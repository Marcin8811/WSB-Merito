*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://google.com
${filename}     screenshot
${counter}      1

*** Keywords ***
Take Screenshot
    ${filename}     set variable    ${filename}_${counter}.png
    capture page screenshot     ${filename}
    ${counter}      convert to integer      ${counter}
    ${counter}      set variable    ${counter + 1}
    set suite variable    ${counter}

*** Test Cases ***
Test open browser
    open browser   ${url}   Chrome
    sleep    10
    maximize browser window
    Take Screenshot
    click element   id:L2AGLb
    Take Screenshot
    input text    name:q    Merito
    Take Screenshot
#    capture page screenshot    screen01.png
#    click element    name:btnK
    press keys     name:q       ENTER
    Take Screenshot
#    capture page screenshot    screen02.png
    sleep    2
    execute javascript    window.scrollBy(0,300)
    Take Screenshot
#    capture page screenshot    screen03.png
    sleep    2
    element attribute value should be    id:APjFqb    value    Merito