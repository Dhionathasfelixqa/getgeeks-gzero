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
    
Incorrect Email
    [Tags]      inv_email
    ${user}         Create Dictionary       email=dhonathasfelix.com.br            password=ped123

    Go To Login Form
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email    