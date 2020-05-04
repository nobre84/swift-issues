# Prova de iOS
## Objetivo

Você deve desenvolver uma aplicação iOS em Swift que consuma a API do Github 
Issues ( https://developer.github.com/v3/issues/ ), usando como base o 
repositório do Swift ( https://github.com/apple/swift ).

## O aplicativo deve conter

* Uma tela com a lista de issues do repositório
( https://api.github.com/repos/apple/swift/issues ). Cada item da lista deve
conter os seguintes elementos:
    * Título do issue
    * Estado do issue (ABERTO, FECHADO)
* Uma tela mostrando os detalhes do issue que foi selecionado na lista, que deve
conter os seguintes elementos:
    * Título do issue
    * Texto de Descrição do issue
    * Avatar do usuário que criou a issue
    * Data de criação
    * Um botão que abre o browser com o link issue do site do github

## Requisitos

* Ser escrito em Swift
* Clean Architecture (MVP ou MVVM)
* View Code
* Testes Unitários (preferencialmente com Quick, Nimble, Cuckoo e OHHTTPStubs)
* Preferencialmente uso de Alamofire/Moya

## Pontos de avaliação

* Como você organiza seus arquivos, métodos, nomeia variáveis, lida com o seu
código como um todo são pontos observados. Seja cuidadoso, utilize boas
práticas e padrões.
* Siga o guideline da Apple, bem como respeite as boas práticas do Swift.
* Codifique como você gostaria de trabalhar.
