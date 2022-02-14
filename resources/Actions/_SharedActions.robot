*Settings*
Documentation           Shared Actions




*Keywords*

Modal Content should Be
    [Arguments]     ${expected_text}

    ${title}        Set Variable        css=.swal2-title 
    ${content}      Set Variable        css=.swal2-html-container

    Wait for Elements State             ${title}            visible     5
    Get Text                            ${title}            equal       Oops...    

    Wait For Elements State             ${content}          visible     5
    Get text                            ${content}          equal       ${expected_text}