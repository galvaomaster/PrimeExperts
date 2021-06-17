*** Settings ***
Documentation     Entrega do Exercício de Argumentos e Retorno

*** Variable ***
&{PESSOA}         nome=Anderson    sobrenome=Galvao    idade=36
${DOMINIO_EMAIL}    testerobot.com

*** Test Cases ***
Exercicicio Argumentos e Retorno
    Criar email formatado


imprimir numero
    [Tags]        numero
    FOR    ${numero}    IN RANGE    0    10
        IF    "${numero}" == "5"
            Log    ${numero}
        END
    END


*** Keywords ***
Criar email formatado
    ${EMAIL_CRIADO}    Formacao email    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}
    Log To Console    ${EMAIL_CRIADO}

Formacao email
    [Arguments]    ${nome}    ${sobrenome}    ${idade}
    ${EMAIL_VALIDO}=    Catenate    SEPARATOR=_    ${nome}    ${sobrenome}    ${idade}
    [Return]    ${EMAIL_VALIDO}@${DOMINIO_EMAIL}

