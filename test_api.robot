*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}    http://127.0.0.1:5000


*** Test Cases ***
Test create new game
    [Documentation]    Test tworzenia nowej gry
    ${response}    POST    ${url}/game
    should be equal as numbers    ${response.status_code}    201
    ${json_data}    set variable    ${response.json()}
    log    ${json_data["message"]}