*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${url}  https://www.empik.com/bestsellery

*** Test Cases ***
Test empik
    open browser    ${url}  Chrome
    sleep    15
    maximize browser window

    click element    css=button[data-ta="cookie-btn-accept-all"]

    @{best}    Get WebElements    css=.ta-product-title
    @{lista}    create list
#    Log    ${best}

    FOR    ${element}    IN    @{best}
        log    ${element.text}
        append to list    ${lista}    ${element.text}
    END

    list should contain value    ${lista}    5 Red Shirt

    sleep    5
