*** Settings ***
Library    Collections

*** Variables ***
${zmienna}    moja zmienna jest fajna
@{lista}    Adam    Bartosz    Cecylia    Damian

*** Test Cases ***
Test zmiennej
    log to console    ${zmienna}
    log    ${zmienna}

Test listy
#    log    @{lista}
    FOR    ${imie}    IN    @{lista}
        log to console    ${imie}
        log    ${imie}
    END

