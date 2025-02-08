*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    home.steps.robot
Resource    pages/webdrivers.robot
Variables    webelements.py

*** Variables ***

*** Keywords ***
I will be redirected to the Flight and Hotel page
    Click Element    ${FLIGHT_HOTEL_BTN}
    Successfull redirection to the flight and hotel page    ${FLIGHT_HOTEL_PAGE}

I select the english language on the top
    Wait Until Element Is Visible    ${FLIGHT_HOTEL_ACCEPT_COOKIES}
    Click Element    ${FLIGHT_HOTEL_ACCEPT_COOKIES}
    Wait Until Element Is Visible     ${FLIGHT_HOTEL_LANGUAGE}
    Click Element    ${FLIGHT_HOTEL_LANGUAGE}
    Click Element    ${FLIGHT_HOTEL_ENGLISH}

I click on the departure field
    Click Element    ${DEPARTURE_FLIGHT_HOTEL_FIELD}

I see that the departure field is active
    Element Should Be Enabled    ${DEPARTURE_FLIGHT_HOTEL_FIELD}

I see that the field is ready for input
    Element Should Be Enabled    ${DEPARTURE_FLIGHT_HOTEL_FIELD}

I enter at least one letter "${O}" 
    Clear Element Text    ${DEPARTURE_FLIGHT_HOTEL_FIELD}
    Wait Until Keyword Succeeds    1s    2s    Press Key    ${DEPARTURE_FLIGHT_HOTEL_FIELD}    ${O}
    ${input}    Get Value    ${DEPARTURE_FLIGHT_HOTEL_FIELD}
    ${input}    Convert To Lower Case    ${input}
    Set Global Variable    ${input}
    RETURN    ${input}

I see related cities or airports as suggestions
    Sleep    2s
    Wait Until Element Is Visible    ${LIST_OF_DEPARTURE}
    ${departure_items}    Get WebElements    ${LIST_OF_DEPARTURE}
    ${l}=    Get Length    ${departure_items}
    RETURN    ${departure_items}    ${l}

I select a random departure from the list
    ${departure_items}    ${departure_count}    I see related cities or airports as suggestions
    ${random_index}    Evaluate    random.randint(0, ${departure_count}-1)
    ${selected_departure}    Get Text    ${departure_items}[${random_index}]
    Click Element    ${departure_items}[${random_index}]
    Sleep    1s
    Set Global Variable    ${selected_departure}
    [Return]    ${selected_departure}

The departure will be assigned to the departure field
    ${departure_assigned}    Get Value    ${ASSIGNED_DEPARTURE}
    Should Start With   ${selected_departure}    ${departure_assigned}

I click on the destination field
    Log    message

I see that the destination field is active
    Log    message

I see that the destination field is ready for input
    Log    message

I enter a letter "I"
    Log    message
 
I see related cities or airports for destination
    Log    message

*** Comments ***
I see related cities or airports as suggestions
    Wait Until Element Is Visible    ${LIST_OF_DEPARTURE}
    ${departure_items}    Get WebElements    ${LIST_OF_DEPARTURE}
    ${l}=    Get Length    ${departure_items}
    Set Global Variable    @{departure_items}
    Set Global Variable    ${l}
    RETURN    ${departure_items}    ${l}

I select a random departure from the list
    ${random_index}    Evaluate    random.randint(0, ${l}-1)
    ${departure_city}    Get WebElements    ${LIST_OF_DEPARTURE}
    ${selected_departure}    Get Text    ${departure_city}[${random_index}]
    Set Global Variable    ${selected_departure}
    Click Element    ${departure_city}[${random_index}]
    Sleep    1s
    RETURN    ${selected_departure}
