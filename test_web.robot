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
    close browser

Test Click Cell and Verify
    [Documentation]    Test otwiera noną grę i klika w pole
    open browser    ${url}    Chrome
    sleep    5
    maximize browser window
    click element    id:new-game

    sleep    2
    click element    xpath=//*[@id="game-board"]/div[2]/div[2]
    sleep    1
    capture page screenshot    screen_2.png
    sleep    2
    ${cell_text}    Get Text    xpath=//*[@id="game-board"]/div[2]/div[2]
    log    ${cell_text}
    log to console    ${cell_text}
    should be equal    ${cell_text}    X
    sleep    1
    click element    xpath=//*[@id="game-board"]/div[2]/div[2]
    sleep    1
    alert should be present
    sleep    1
    ${cell_text}    Get Text    xpath=//*[@id="game-board"]/div[2]/div[2]
    should be equal    ${cell_text}    X

    close browser