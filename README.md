<h1 align="center">Delivery App</h1>

## Como a aplicação funciona

É um sistema capaz de gerenciar entregas de produtos previamente cadastrados, através de uma consulta (realizada por pessoa administradora) que escolhe a transportadora disponível que atenda aos critérios do produto. Para isso, a aplicação conta com três tipos de acesso:

- Administrador
- Usuário da transportadora
- Visitante

#### Administrador:

- Capaz de cadastrar novas transportadoras
- Capaz de consultar preços e prazos
- Capaz de criar ordem de serviço de uma transportadora
- Acesso do administrador cadastrado no banco de dados:

```
  email: admin@sistemadefrete.com.br
  password: password
```

#### Usuário:

- Capaz de acessar somente a transportadora a que está vinculado (vínculo através do domínio de e-mail)
- Capaz de cadastrar veículos que serão utilizados nas entregas
- Capaz de configurar preços e prazos de entrega
- Capaz de ver e atualizar ordem de serviço
- Acesso do administrador cadastrado no banco de dados:

```
  email: user@entregasja.com.br
  password: password
```

#### Visitante:

- Capaz de acessar a página inicial e pesquisar pelo seu pedido informando seu código

---

## Descrição do Projeto

Projeto final desenvolvido na Etapa 1 do Programa TreinaDev realizado pela [Campus Code](https://www.campuscode.com.br/), consiste em uma aplicação web responsável por gerenciar meios de transporte disponíveis para e-commerces utilizando <strong>Ruby on Rails</strong>.

Você pode clicar [aqui](https://github.com/users/fmarga/projects/1) para acompanhar o desenvolvimento do projeto

## Configurações da aplicação (linguagens e gems instaladas)

- [Ruby](https://www.ruby-lang.org/pt/): versão 3.1.1
- [Rails](https://rubyonrails.org/): versão 7.0.2.4
- [RSpec](https://github.com/rspec/rspec-rails): na versão 3.11.0 para a criação de testes unitários
- [Capybara](https://github.com/teamcapybara/capybara): na versão 3.36.0 para a criação de testes de sistema
- [i18n](https://guides.rubyonrails.org/i18n.html): utilizada para internacionalização da aplicação
- [Devise](https://github.com/heartcombo/devise): autenticação e autorização de usuários/administradores

## Como rodar a aplicação

#### Clone o projeto a partir do seu terminal:

```
  $ git clone https://github.com/fmarga/delivery-app.git
```

#### Entre na pasta do projeto:

```
  $ cd delivery-app
```

#### Carregue o banco de dados pré-existente

```
  $ rails db:seed
```

#### Instale as dependências:

```
  $ bin/setup
```

#### Execute a aplicação:

```
  $ rails s
```

#### Acesse a partir do navegador de sua preferência:

```
  $ http://localhost:3000
```

## Como rodar os testes

```
  $ cd delivery-app
  $ rspec
```
