*Settings*
Documentation               Singup Test Suite

Resource        ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Register new user

    ${user}         Factory User


    Go To Singup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    User should Be Registered


Duplicate user
    [Tags]          dup_email

    ${user}                 Factory User
    add User From Database  ${user}      

    Go To Singup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Modal Content should Be  Já temos um usuário com o e-mail informado.

Wrong email
    [Tags]      attempt_sigup

    ${user}     Factory Wrong Email

    Go To Singup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  O email está estranho

Required Fields
    [Tags]          attempt_sigup       REQF

    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    Go To Singup Form
    Submit Signup Form
    Alert Spans Should Be  ${expected_alerts}



Short password
    [Tags]               attempt_sigup       short_pass
    [Template]           Signup With Short pass
    1
    12
    123
    1234
    a1
    a2s
    as3
    asd3
    1.a$
    23#de


*Keywords*
Signup With Short pass 
    [Arguments]         ${short_pass}

    ${user}         Create Dictionary
    ...             name=Felix                  lastname=Henrique
    ...             email=felix@gmail.com       password=${short_pass}

    Go To Singup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres
