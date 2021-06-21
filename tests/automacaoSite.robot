
*** Settings ***
Documentation     Neste arquivo estarão presentes nossos primeiros fluxos
...               de automação web e seus respectivos cenários automatizados.
Resource          ../resources/kw/kws_automation.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "SUMMER DRESSES " foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    Informar um e-mail valido
    Clicar em "Create an Account"
    Preecher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
