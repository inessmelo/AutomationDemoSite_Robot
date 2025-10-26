*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        Browser
Library        libs/Register.py

Resource        ../resources/pages/Register.resource

*** Keywords ***
Acessar a URL Login
    New Browser        browser=chromium        headless=False
    New Page           url=https://demo.automationtesting.in/Index.html
    Get Title          equal          Index

Acessar a tela Register
    Acessar a URL Login

    #Quando eu clicar no btn Entrar
    Get Element        css=#enterimg            
    Click              css=#enterimg

    #Então eu acesso a tela Register
    Wait For Elements State        css=h2 >> text=Register        visible        5
    Get Text                       h2                             equal          Register 