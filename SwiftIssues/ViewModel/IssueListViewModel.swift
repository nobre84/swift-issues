//
//  IssueListViewModel.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation
import Combine
import Moya

class IssueListViewModel: ObservableObject, Identifiable {

    enum State: Equatable {
        
        static func == (lhs: IssueListViewModel.State, rhs: IssueListViewModel.State) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.error(let lhsError), .error(let rhsError)):
                return lhsError as NSError == rhsError as NSError
            case (.ready(let lhsRows), .ready(let rhsRows)):
                return lhsRows == rhsRows
            default:
                return false
            }
        }
        
        case loading
        case error(Error)
        case ready([IssueListRowViewModel])
        
        var isLoading: Bool {
            if case .loading = self {
                return true
            }
            return false
        }
        
        var isError: Bool {
            if case .error = self {
                return true
            }
            return false
        }
    }
    
    @Published var state: State = .loading
    
    private let provider: MoyaProvider<GitHubService>
    private var disposables = Set<AnyCancellable>()
    
    init(provider: MoyaProvider<GitHubService> = MoyaProvider<GitHubService>()) {
        self.provider = provider
    }
    
    func fetchIssues() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        provider.requestPublisher(.issues(owner: .apple, repo: .swift, state: .all))
            .filterSuccessfulStatusAndRedirectCodes()
            .print()
            .map(\.data)
            .decode(type: [Issue].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state = .error(error)
                }
            }, receiveValue: { [weak self] issues in
                self?.state = .ready(issues.map(IssueListRowViewModel.init))
            })
            .store(in: &disposables)
    }
}
