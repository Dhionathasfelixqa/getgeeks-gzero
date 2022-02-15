*Settings*
Documentation           Login Test Suite   

Resource                ${EXECDIR}/Resources/base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login
    ${user}                 Factory User Login

    add User From Database  ${user}   
    Go To Login Form
    Fill Credentials        ${user}   
    Submit Credentials
    User should Be Logged In        ${user}   

Incorrect Pass
    [Tags]      inv_pass
    ${user}         Create Dictionary       email=dhonathas.felix@gmail.com             password=1234567

    Go To Login Form
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content should Be  Usuário e/ou senha inválidos.

User not Found 
    [Tags]      user_404
    ${user}         Create Dictionary       email=dhonathasfelix@gmail.com             password=ped123

    Go To Login Form
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content should Be  Usuário e/ou senha inválidos.
    

Required Fields
    [Tags]      attempt_signupreqf

    @{expected_alerts}          Create List
    ...                         Cadê o seu nome?
    ...                         E o sobrenome? 
    ...                         O email é importante também!
    ...                         Agora só falta a senha!


    Go To Singup Form
    Submit Signup Form
    Alert Spans Should Be  ${expected_alerts}


Incorrect Email
    [Tags]      inv_email
    ${user}         Create Dictionary       email=dhonathasfelix.com.br            password=ped123

    Go To Login Form
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email    

Required email
    [Tags]              required_email

    ${usuario}        Create Dictionary       email=       password=123456789

    Go To Login Form
    Fill Credentials  ${usuario} 
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório

Required password
    [Tags]              required_pass

    ${usuario}         Create Dictionary       email=dhonathas.felix@gmail.com         password=

    Go To Login Form
    Fill Credentials  ${usuario} 
    Submit Credentials
    Alert Span Should Be  Senha obrigatória

Requirede login 
    [Tags]              required_email_pass         

    @{expected_alert}           Create List                         
    ...                         E-mail obrigatório
    ...                         Senha obrigatória

    Go To Login Form
    Submit Credentials
    Alert Spans Should Be  ${expected_alert}




