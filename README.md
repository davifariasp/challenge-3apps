<h1 align="center">
    Desafio 3apps
</h1>

<p align="center">
  <a href="#page_with_curl-sobre">Sobre</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#sos-desafios">Desafios</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#hammer-tecnologias">Tecnologias</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#books-requisitos">Requisitos</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#rocket-iniciando">Iniciando</a>
  <a href="#rocket-iniciando">APK</a>
</p>

<div align="center">
    <img alt="Calculadora" src="https://i.imgur.com/fMeU4ub.png" width="220" />
    <img alt="Histórico" src="https://i.imgur.com/YTgFt7J.png" width="220" />
    <img alt="Calculando" src="https://i.imgur.com/3PTLk7U.png" width="220" />
</div>
<div align="center">
    <img alt="Resultado" src="https://i.imgur.com/BAKFxLm.png" width="220" />
    <img alt="Artigos" src="https://i.imgur.com/JyJaQlg.png" width="220" />
    <img alt="Histórico preenchido" src="https://i.imgur.com/ZznLKxC.png" width="220" />
</div>

## :page_with_curl: Sobre

Este repositório é referente ao [**desafio mobile 3apps**](https://github.com/globoi/globoplay-desafio-mobile?tab=readme-ov-file).

O objetivo do desafio é criar um aplicativo Flutter que permita ao usuário calcular a quantidade diária recomendada de calorias para ganhar ou perder peso, com base em seu perfil físico (peso, altura, idade, gênero, nível de atividade física) e objetivo (perda de peso ou ganho de peso), além de exibir uma lista de artigos relacionadas ao seu objetivo (perda de peso ou ganho de peso). O app deve armazenar localmente o registro do seu último cálculo.

## :sos: Desafios

- Arquitetura: gosto de utilizar a Flutter Clean Arch em meus projetos

- Consumo de API: é uma mistura entre os princípios de Clean Architecture e injeção de dependência, promovendo modularidade e separação de responsabilidades. A interface [**IHttpClient**](https://github.com/davifariasp/challenge-3apps/blob/main/lib/interfaces/i_http_client.dart) define uma abstração para o cliente HTTP, desacoplando a implementação real da lógica de negócio, permitindo que ela seja facilmente substituída, como em cenários de teste. A classe [**HttpClient**](https://github.com/davifariasp/challenge-3apps/blob/main/lib/data/datasources/remote/http/http_client.dart) implementa essa interface, cuidando das requisições HTTP reais, enquanto a lógica de requisição fica isolada, facilitando a manutenção. A classe [**ArticlesRepository**](https://github.com/davifariasp/challenge-3apps/blob/main/lib/data/datasources/remote/repositories/articles_repository.dart) encapsula a lógica de acesso a dados, realiza requisições a uma API externa e transforma os dados recebidos em objetos utilizáveis no aplicativo, mantendo a separação entre a lógica de negócios e a implementação de dados. Já a classe [**ArticlesStore**](https://github.com/davifariasp/challenge-3apps/blob/main/lib/presentation/pages/home/store/article_store.dart) gerencia o estado da aplicação, controlando variáveis como isLoading, list e error, e faz a comunicação com o repositório (repository) para buscar os dados necessários, mantendo a UI separada da lógica de requisições e garantindo um código mais testável e organizado.

- Armazenamento local: No caso, optei por usar o **Provider** pela praticidade, mas creio que minha solução com ele poderia ser reaplicada em outros tipos de armazenamento sem nenhum problema. 

## :hammer: Tecnologias
Este projeto foi desenvolvodio em Flutter e é importante seu Flutter estar na mesma versão em que o projeto foi criado, pois caso contrário poderá haver conflitos. 

- Flutter 3.19.3 
- Dart 3.3.1 

## :books: Requisitos
- Ter [**Git**](https://git-scm.com/) para clonar o projeto.
- Ter [**Flutter**](https://docs.flutter.dev/get-started/install) configurado para executar o projeto.
- Um dispositivo ou emulador iOS ou Android.

## :rocket: Iniciando
``` bash
  # Clonar o projeto:
  $ https://github.com/davifariasp/challenge-3apps

  # Entrar no diretório:
  $ cd challenge-3apps
  
  # Instalar as dependências:
  $ flutter pub get
```

Também tem a versão [**APK do aplicativo**](https://github.com/davifariasp/challenge-3apps/blob/main/release/app.apk)
