//
//  IssueListViewModel.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Combine
import SwiftUI
import Moya

class IssueListViewModel: ObservableObject, Identifiable {

    enum State {
        case loading
        case error(String)
        case ready([IssueListRowViewModel])
    }
    
    @Published var state: State = .loading
    
    private let provider: MoyaProvider<GitHubService>
    private var disposables = Set<AnyCancellable>()
    
    init(provider: MoyaProvider<GitHubService> = MoyaProvider<GitHubService>()) {
        self.provider = provider
        
        fetchIssues()
    }
    
    func fetchIssues() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        provider.requestPublisher(.issues(owner: .apple, repo: .swift))
            .filterSuccessfulStatusAndRedirectCodes()
            .retry(2)
            .map(\.data)
            .decode(type: [Issue].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state = .error(error.localizedDescription)
                }
            }, receiveValue: { [weak self] issues in
                self?.state = .ready(issues.map(IssueListRowViewModel.init))
            })
            .store(in: &disposables)
    }
}
