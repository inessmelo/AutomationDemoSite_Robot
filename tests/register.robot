*** Settings ***
Documentation        Suite de teste com RobotFramework na tela Register

Library        Browser
Resource       ../resources/Base.resource

*** Test Cases ***
Deve acessar a tela Register
    #Dado que acesso o sistema
    Acessar a tela Register   
    Take Screenshot

Validar campos obrigatorios
    Acessar a tela Register 
    Clicar no botão Submit
    Exibe mensagem de alerta        Preencha este campo.
    

Validar a obrigatoriedade do campo FullName
    ${register}    Get Faker Register

    Acessar a tela Register
    Preencher o campo First Name        ${EMPTY}
    Preencher o campo Last Name         ${register}[lastName]
    Preencher o campo Address           ${register}[address]
    Preencher o campo Email             ${register}[email]
    Preencher o campo Phone             ${register}[phone]

    Wait For Elements State             css=input[value="Male"]    visible    5
    Selecionar uma opção de Genero      css=input[value="Male"]
    Selecionar um Hobby                 css=input[value="Movies"]
    
    # eu clicar no btn 
    Clicar no botão Submit    
    
    #Então a msg de alerta é exibido
    Exibe mensagem de alerta            Preencha este campo.


         
