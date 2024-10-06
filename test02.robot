*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test open browser
    open browser    https://google.com    Chrome
    sleep   10
    maximize browser window
    click element   id:L2AGLb
#    Sleep    10
#    input text  id:APjFąb   Merito
    input text  name:q    Merito
    capture page screenshot    screen01.png
#    sleep    10
    click element    name:btnK
#    press keys    name:q    ENTER
    capture page screenshot    screen02.png
    sleep    2
    execute javascript  window.scrollBy(0,300)
    sleep    2
    execute javascript  window.scrollBy(0,600)
    Sleep    10
    element attribute value should be    id:APjFqb    value    Merito
