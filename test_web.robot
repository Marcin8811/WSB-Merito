*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    file:///Users/marcin8kozik/Downloads/webTicTacToe-master/index.html

*** Test Cases ***
Test New Game Button
    [Documentation]    Test otwiera aplikacje webowa i klika przecisk New Game
    open browser    ${url}    Chrome
    sleep    5
    maximize browser window
    click element    id:new-game
    capture page screenshot    screen_1.
    sleep    2
