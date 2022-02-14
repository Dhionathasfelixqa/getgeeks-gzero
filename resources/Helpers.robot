*Settings*
Documentation       Test Helpers



*Keywords*

add User From Database
    [Arguments]        ${user}

    Connect To Postgres
    Insert User  ${user}
    Disconnect From Database