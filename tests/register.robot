*** Settings ***
Documentation        Suite de teste com RobotFramework na tela Register

Library        Browser
Resource       ../resources/base.resource

*** Variables ***
${url}        https://demo.automationtesting.in/Register.html


*** Test Cases ***
Deve acessar a tela Register
    #Dado que acesso o sistema
    New Browser        browser=chromium        headless=False
    New Page           url=https://demo.automationtesting.in/Index.html
    Get Title          equal          Index

    #Quando eu clicar no btn Entrar
    Get Element        css=#enterimg            
    Click              css=#enterimg

    #Então eu acesso a tela Register
    Wait For Elements State        css=h2 >> text=Register        visible        5
    Get Text                       h2                             equal          Register    
    Take Screenshot

Validar campos obrigatorios
    #Dado que acesso a tela Register
    New Browser        browser=chromium        headless=False
    New Page           ${url}
    Get Text           h2             equal    Register 

    #Quando eu clicar no btn 
    Get Element        id=submitbtn
    Click              id=submitbtn        
    
    #Então a msg de alerta é exibido
    Wait For Elements State    text=Preencha o campo.    visible    5
    Take Screenshot


Validar a obrigatoriedade do campo FullName
    ${register}    Get Faker Register

    #Dado que acesso a tela Register
    New Browser        browser=chromium        headless=False
    New Page           url=https://demo.automationtesting.in/Register.html
    Get Text           h2             equal    Register 

    #Quando preecnho todos os campos menos Full Name
    Submit register form
    ...    ${register}
    ...    input[value=Male]
    ...    css=input[value=Male]
    ...    css=input[value=Cricket]
    
    # eu clicar no btn 
    Get Element       selector=#submitbtn    
    
    #Então a msg de alerta é exibido
    Sleep    5
    Take Screenshot

*** Keywords ***
Submit register form
    [Arguments]        ${register}    ${gender}    ${hobby}

    #Preenchendo os campos
    Fill Text         css=input[placeholder^=First]        ${register}[firstName]
    Fill Text         css=input[placeholder^=Last]         ${register}[lastName]
    Fill Text         css=textarea[ng-model=Adress]        ${register}[address]
    Fill Text         css=input[ng-model=EmailAdress]      ${register}[email]
    Fill Text         css=input[ng-model=Phone]            ${register}[phone]
    
    Check Checkbox    css=${gender}
    Check Checkbox    css=${hobby}

    #Selecionar uma linguagem

    #Selecionar uma habilidade
    Click    id=Skills

    #Selecionar um Pais

    #Selecionar um ano

    #Selecionar um mes

    #Selecionar um dia

    #Preencher senha
    Fill Text    id=firstpassword     ${register}[pass]
    Fill Text    id=secondpassword    ${register}[confirmPass]

    #Upload de arquivo
    Upload File By Selector    id=imagesrc    ${EXECDIR}/image/nome.jpg

    #Clicando no Submit
    Get Element       id=submitbtn
    Click             id=submitbtn 
         
