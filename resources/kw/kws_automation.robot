*** Settings ***
Documentation     Aqui estarão presentes todas as keywords que
...               compõem os testes de automação web.
Library           SeleniumLibrary
Library           String
Library           XML
Resource          ../page/page_objects.robot

*** Variable ***
${BROWSER}        chrome
${URL}            http://automationpractice.com
${DOMAIN}         @primeexpert.com

*** Keywords ***
### Setup e Teardown
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To    ${URL}
    Wait Until Element Is Visible    ${menu_site}
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    ${campo_pesquisa}    ${PRODUTO}
    Capture Page Screenshot

Clicar no botão pesquisar
    Click Element    ${botao_pesquisa}
    Capture Page Screenshot

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    ${resultado_pesquisa}
    Title Should Be    Search - My Store
    Page Should Contain Image    ${imagem_produto}
    Page Should Contain Link    ${link_produto} [contains(text(), "${PRODUTO}")]

Conferir mensagem "${MENSAGEM} "${PRODUTO}""
    Title Should Be    Search - My Store
    Wait Until Element Is Visible    ${mensagem_produto}
    Element should Contain    ${mensagem_produto}    ${MENSAGEM} "${PRODUTO}"

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Title Should Be    My Store
    Mouse Over    ${mouse_over}a[title="${CATEGORIA}"]

Clicar na sub categoria "${SUB_CATEGORIA}"
    Wait Until Element Is Visible    xpath=//ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='Summer Dresses']
    Click Element    xpath=//ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='Summer Dresses']

Conferir se os produtos da sub-categoria "${SUB_CATEGORIA}" foram mostrados na página
    Title Should Be    Summer Dresses - My Store
    Wait Until Element Is Visible    ${prd_subcategoria}    3
    Element Text Should Be    ${prd_subcategoria}    ${SUB_CATEGORIA}
    Wait Until Element Is Visible    ${contem_produtos} [contains(text(), "There are 3 products.")]

Clicar em "Sign in"
    Wait Until Element Is Visible    ${btn_login}
    Click Element                     ${btn_login}
    Sleep    5

Informar um e-mail valido
    Title Should Be    Login - My Store
    Wait Until Element Is Visible    ${tela_autenticacao}
    ${EMAIL}=    Generate Random String    5    [LOWER]
    Input Text    ${input_email}    ${EMAIL}${DOMAIN}

Clicar em "Create an Account"
    Wait Until Element Is Visible    ${btn_criar_conta}
    Click Element                    ${btn_criar_conta}

Preecher os dados obrigatórios
    Wait Until Element Is Visible    ${tela_criar_conta}
    Wait Until Element Is Visible    ${check_btn_genero}
    Click Element                    ${check_btn_genero}
    Wait Until Element Is Visible    ${nome_cliente}
    Input Text                       ${nome_cliente}         Anderson
    Wait Until Element Is Visible    ${sobrenome_cliente}
    Input Text                       ${sobrenome_cliente}    Galvão
    Wait Until Element Is Visible    ${senha}
    Input Text                       ${senha}                123456    
    Wait Until Element Is Visible    ${fistname}
    Input Text                       ${fistname}            Anderson
    Wait Until Element Is Visible    ${lastname}
    Input Text                       ${lastname}            Galvão
    Wait Until Element Is Visible    ${endereco}
    Input Text                       ${endereco}            Avenida Recife
    Wait Until Element Is Visible    ${cidade}
    Input Text                       ${cidade}              Recife
    Wait Until Element Is Visible    ${estado}
    Click Element                    ${estado}
    Wait Until Element Is Visible    ${cep}
    Input Text                       ${cep}                 12345  
    Wait Until Element Is Visible    ${pais}
    Click Element                    ${pais}
    Wait Until Element Is Visible    ${telefone}
    Input Text                       ${telefone}            8111111111
    Wait Until Element Is Visible    ${alias_endereco}
    Input Text                       ${alias_endereco}      Prime Expert
    Wait Until Element Is Visible    ${telefone}
    Input Text                       ${telefone}            8111111111

Submeter cadastro
    Wait Until Element Is Visible    ${btn_submeter_conta}
    Click Element                    ${btn_submeter_conta}

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${tela_conta}
