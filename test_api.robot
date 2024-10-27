*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}    http://127.0.0.1:5000
${game_id}

*** Test Cases ***
Test create new game
    [Documentation]     Test tworzenia nowej gry
    ${response}     POST    ${url}/game
    should be equal as integers    ${response.status_code}  201
    ${json_data}    set variable    ${response.json()}
    should be equal    ${json_data["message"]}  New game created
    set suite variable    ${game_id}    ${json_data["game_id"]}
    log    ${game_id}

Get Game Status
    [Documentation]    Test pobierania stanu gry
    ${response}    GET    ${url}/game/${game_id}
    should be equal as integers    ${response.status_code}  200
    ${json_data}    set variable    ${response.json()}
    log    ${json_data}
    should be empty    ${json_data["moves"]}

Make First Move
    [Documentation]    Test wykonania pierwszego ruchu
    ${body}    create dictionary    cellIndex=3
    ${response}    POST    ${url}/game/${game_id}/move    json=${body}
    should be equal as integers    ${response.status_code}  200
    ${json_data}    set variable    ${response.json()}
    log    ${json_data}
    should be equal    ${json_data["game_id"]}    ${game_id}
    should be equal    ${json_data["message"]}    Move made
    should be equal    ${json_data["moves"]}    3X

Make Invalid Move
    [Documentation]    Test wykonania ruchu na to samo pole
    ${body}    create dictionary    cellIndex=3
    ${status}    ${response}    run keyword and ignore error    POST    ${url}/game/${game_id}/move    json=${body}
    log    ${status}
    log    ${response}
    should be equal    ${status}    FAIL
    ${response}    GET    ${url}/game/${game_id}
    should be equal as integers    ${response.status_code}  200
    ${json_data}    set variable    ${response.json()}
    log    ${json_data}
    should be equal    ${json_data["moves"]}    3X

#Made Second Move
#    [Documentation]    Test wykonania drugiego ruchu
#    ${body}    create dictionary    cellIndex=7
#    ${response}    POST    ${url}/game/${game_id}/move    json=${body}
#    should be equal as integers    ${response.status_code}  200
#    ${json_data}    set variable    ${response.json()}
#    log    ${json_data}
#    should be equal    ${json_data["game_id"]}    ${game_id}
#    should be equal    ${json_data["message"]}    Move made
#    should be equal    ${json_data["moves"]}    3X7O



