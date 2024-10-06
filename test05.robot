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

    @{best}    Get WebElements    css=.ta-product-title
#    Log    ${best}
    FOR     ${element}    IN    @{best}
        log    ${element}
    sleep    15
