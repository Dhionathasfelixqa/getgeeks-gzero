*Settings*
Documentation           Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     dnpdkoam
    ...                     dnpdkoam
    ...                     5SYqYoN35XLuy5yjKh9v1UqZk_yVDFRH
    ...                     castor.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]     ${u}

    ${hashed_pass}      Get Hashed pass     ${u}[password]
    ${q}                Set Variable        INSERT INTO public.Users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)

    Execute SQL String          ${q}   

Users Seed

    ${user}         Factory User Login

    Insert User  ${user}