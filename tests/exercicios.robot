*** Settings ***
Documentation     Entrega do Exercicício de Argumentos e Retorno

*** Variable ***
&{PESSOA}         nome=Anderson    sobrenome=Galvao    idade=36
${DOMINIO_EMAIL}    testerobot.com

*** Test Cases ***
Exercicicio Argumentos e Retorno
    Criar email formatado

*** Keywords ***

Criar email formatado
    
    ${EMAIL_CRIADO}    Formacao email    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}
    Log To Console    ${EMAIL_CRIADO}

Formacao email
    [Arguments]         ${nome}        ${sobrenome}        ${idade}
    ${EMAIL_VALIDO}=    Catenate     SEPARATOR=_        ${nome}        ${sobrenome}        ${idade}        
    [Return]      ${EMAIL_VALIDO}@${DOMINIO_EMAIL}  