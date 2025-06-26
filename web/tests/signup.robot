*** Settings ***
Documentation      Cenários de testes de pré-cadastro de clientes

Resource           ../resources/Base.resource

Test Setup         Start session
Test Teardown      Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}     Create Dictionary
    ...    name=Zé do Teste
    ...    email=zedoteste@gmail.com
    ...    cpf=00005310814
    
    Delete Account By Email    ${account}[email]

    Submit signup form        ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Tags]    attempt

    [Template]     Attempt signup
        ${EMPTY}         joaodasilva@gmail.com      49976289057       Por favor informe o seu nome completo
        João da Silva    ${EMPTY}                   49976289057       Por favor, informe o seu melhor e-mail
        João da Silva    joaodasilva@gmail.com      ${EMPTY}          Por favor, informe o seu CPF
        João da Silva    joaodasilva#gmail.com      49976289057       Oops! O email informado é inválido
        João da Silva    joaodasilva!gmail.com      49976289057       Oops! O email informado é inválido
        João da Silva    joaodasilva@gmail          49976289057       Oops! O email informado é inválido
        João da Silva    www.example.com            49976289057       Oops! O email informado é inválido
        João da Silva    https://www.example.com    49976289057       Oops! O email informado é inválido
        João da Silva    joaodasilva@gmail.com      1234567890a       Oops! O CPF informado é inválido
        João da Silva    joaodasilva@gmail.com      12345678900       Oops! O CPF informado é inválido
        João da Silva    joaodasilva@gmail.com      4997628905        Oops! O CPF informado é inválido
        João da Silva    joaodasilva@gmail.com      ABCDEFGHIJK       Oops! O CPF informado é inválido
        João da Silva    joaodasilva@gmail.com      1234567890#       Oops! O CPF informado é inválido
