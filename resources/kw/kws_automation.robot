*** Settings ***
Documentation           Aqui estarão presentes todas as keywords que
...                     compõem os testes de automação web.

Library                 SeleniumLibrary
Library                 String

*** Variable ***
${BROWSER}          chrome
${URL}              http://automationpractice.com

*** Keywords ***
### Setup e Teardown
Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query       ${PRODUTO}
    Capture Page Screenshot

Clicar no botão pesquisar
    Click Element       name=submit_search
    Capture Page Screenshot

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(), "${PRODUTO}")]

Conferir mensagem "${MENSAGEM} "${PRODUTO}""
    Title Should Be                     Search - My Store
    Wait Until Element Is Visible        xpath=//div//p[@class='alert alert-warning']    #[contains(text(), "${MENSAGEM} "${PRODUTO}"")]
    Element should Contain               xpath=//div//p[@class='alert alert-warning']        ${MENSAGEM} "${PRODUTO}"        

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Title Should Be                     My Store
    Mouse Over                          css=ul>li>a[title="${CATEGORIA}"]
   
Clicar na sub categoria "${SUB_CATEGORIA}"
    Wait Until Element Is Visible       xpath=//ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='${SUB_CATEGORIA}']
    Click Element                       xpath=//ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='${SUB_CATEGORIA}']      

Conferir se os produtos da sub-categoria "${SUB_CATEGORIA}" foram mostrados na página
    Title Should Be                     Summer Dresses - My Store