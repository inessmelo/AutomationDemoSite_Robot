*** Settings ***
Documentation        Suite de teste com RobotFramework na tela Register

Library        Browser


*** Test Cases ***
Deve acessar a tela Register
    #Dado que acesso o sistema
    New Browser        browser=chromium        headless=False
    New Page           url=https://demo.automationtesting.in/Index.html
    Get Title          equal          Index

    #Quando eu clicar no btn Entrar
    Get Element        selector=#enterimg            
    Click              selector=#enterimg

    #Então eu acesso a tela Register
    Get Text           h2             equal    Register    
    Take Screenshot

Validar campos obrigatorios
    #Dado que acesso a tela Register
    New Browser        browser=chromium        headless=False
    New Page           url=https://demo.automationtesting.in/Register.html
    Get Text           h2             equal    Register 

    #Quando eu clicar no btn 
    Get Element    selector=#submitbtn    
    #Então a msg de alerta é exibido
    Take Screenshot