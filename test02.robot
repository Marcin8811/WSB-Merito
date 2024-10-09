*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://google.de

*** Test Cases ***
Test open browser
    open browser   ${url}   Chrome
    sleep    10
    maximize browser window
    click element   id:L2AGLb
    #sleep    10
    #input text    id:APjFqb    Merito
    input text    name:q    Merito
    capture page screenshot    screen01.png
    #sleep    10
    click element    name:btnK
    #press keys    name:q     ENTER
    capture page screenshot    screen02.png
    sleep    2
    execute javascript    window.scrollBy(0,300)
    capture page screenshot    screen03.png
    sleep    2
    execute javascript    window.scrollBy(0,600)
    capture page screenshot    screen04.png
    sleep    2
    execute javascript    window.scrollBy(0, document.body.scrollHeight)
    capture page screenshot    screen05.png
    sleep    2
    #sleep    10
    element attribute value should be    id:APjFqb    value    Merito