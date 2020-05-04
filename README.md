# Prova de iOS
## Objetivo

Voc� deve desenvolver uma aplica��o iOS em Swift que consuma a API do Github 
Issues ( https://developer.github.com/v3/issues/ ), usando como base o 
reposit�rio do Swift ( https://github.com/apple/swift ).

## O aplicativo deve conter

* Uma tela com a lista de issues do reposit�rio
( https://api.github.com/repos/apple/swift/issues ). Cada item da lista deve
conter os seguintes elementos:
    * T�tulo do issue
    * Estado do issue (ABERTO, FECHADO)
* Uma tela mostrando os detalhes do issue que foi selecionado na lista, que deve
conter os seguintes elementos:
    * T�tulo do issue
    * Texto de Descri��o do issue
    * Avatar do usu�rio que criou a issue
    * Data de cria��o
    * Um bot�o que abre o browser com o link issue do site do github

## Requisitos

* Ser escrito em Swift
* Clean Architecture (MVP ou MVVM)
* View Code
* Testes Unit�rios (preferencialmente com Quick, Nimble, Cuckoo e OHHTTPStubs)
* Preferencialmente uso de Alamofire/Moya

## Pontos de avalia��o

* Como voc� organiza seus arquivos, m�todos, nomeia vari�veis, lida com o seu
c�digo como um todo s�o pontos observados. Seja cuidadoso, utilize boas
pr�ticas e padr�es.
* Siga o guideline da Apple, bem como respeite as boas pr�ticas do Swift.
* Codifique como voc� gostaria de trabalhar.
