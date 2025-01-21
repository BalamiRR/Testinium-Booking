*** Settings ***
Library    SeleniumLibrary
Resource    home.steps.robot
Resource    pages/webdrivers.robot
Variables    webelements.py

*** Variables ***

*** Keywords ***
I click on destination field
    Wait Until Element Is Enabled    

I will see that field is enabled
    Log    message

I will see the list of popular nearby destinations
    Log    message

When I enter "b" "a" in the input field
    Log    message

Then The list of destinations is displayed
    Log    message

The list of destinations matching the input
    Log    message

Then I will see some destinations will be displayed
    Log    message

I select a random destination from the list
    Log    message

The destination will be assigned to the destination field
    Log    message

The destination input is cleared
    Log    message

