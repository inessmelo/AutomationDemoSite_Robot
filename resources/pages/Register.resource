*** Settings ***
Documentation        Ações e elementos da pagina Register

Library              Browser

*** Keywords ***
Clicar no botão Submit
    Get Element        text= Submit 
    Click              css=button[value="sign up"] 

Clicar no botão Refresh
    Get Element        text= Refresh 
    Click              css=button[value="Refresh"] 

Preencher o campo First Name
    [Arguments]       ${firstName}
    Fill Text         css=input[placeholder^=First]        ${firstName}

Preencher o campo Last Name
    [Arguments]       ${lastName}
    Fill Text         css=input[placeholder^=Last]         ${lastName}

Preencher o campo Address
    [Arguments]       ${address}
    Fill Text         css=textarea[ng-model=Adress]           ${address}

Preencher o campo Email
    [Arguments]       ${email}
    Fill Text         css=input[ng-model=EmailAdress]      ${email}

Preencher o campo Phone
    [Arguments]       ${phone}
    Fill Text         css=input[ng-model=Phone]      ${phone}

Selecionar uma opção de Genero
    [Arguments]       ${gender}
    Check Checkbox    css=${gender}

Selecionar um Hobby
    [Arguments]       ${hobby}
    Check Checkbox    css=${hobby}

Selecionar uma linguagem
    [Arguments]       ${language}

Selecionar uma habilidade
    Click    id=Skills

Selecionar um Pais
    [Arguments]       ${country}

Selecionar um ano
    [Arguments]       ${year}

Selecionar um mes
    [Arguments]       ${monthy}

Selecionar um dia
    [Arguments]       ${day}

Preencher o campo Password
    [Arguments]       ${pass}
    Fill Text         id=firstpassword      ${pass}

Preencher o campo Confirm
    [Arguments]       ${confirmPass}
    Fill Text         id=secondpassword      ${confirmPass}

Importar arquivo
    [Arguments]       ${photo}
    Upload File By Selector    id=imagesrc    ${EXECDIR}/${photo}

Exibe mensagem de alerta
    [Arguments]        ${msg}
    Wait For Elements State    text=${msg}    visible    5
    Take Screenshot
