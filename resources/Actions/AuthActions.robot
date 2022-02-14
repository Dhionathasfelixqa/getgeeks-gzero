*Settings*
Documentation       Autenticação Login

*Keywords*
Go To Login Form

    Go To                           ${BASE_URL}

    Wait For Elements State         css=.login-form     visible     3

Fill Credentials
    [Arguments]         ${user}

    Fill Text           id=email            ${user}[email]
    Fill Text           id=password         ${user}[password]

Submit Credentials

    Click               css=.submit-button >> text=Entrar

User should Be Logged In
    [Arguments]     ${user}

    ${element}                      Set Variable            css=a[href="/profile"]

    ${expected_fullname}            Set Variable            ${user}[name] ${user}[lastname]

    Wait For Elements State         ${element}              visible     3
    Get Text                        ${element}              equal     ${expected_fullname}

Should Be Type Email
    
    Get Property            id=email            type         equal        email
