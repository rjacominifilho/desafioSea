*** Settings ***
Resource    ../../Pages/menuLateral/menuLateralPage.resource

# Suite Setup    Open Browser To Chalange Page    Chrome
Test Teardown    Close Browser
    
*** Test Cases ***
CT-MENU-LAT-001 - Validar Item 1 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 1 do Menu Lateral         ${BUILDING_MENU}
    Then Tela "Em breve" é exibida

CT-MENU-LAT-002 - Validar Item 2 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${EDIT_MENU}
    Then Valida exibição da tela Menu 2

CT-MENU-LAT-003 - Validar Item 3 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 3 do Menu Lateral         ${NODE_TREE_MENU}
    Then Tela "Em breve" é exibida
   
CT-MENU-LAT-004 - Validar Item 4 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 4 do Menu Lateral         ${BELL_MENU}
    Then Tela "Em breve" é exibida

CT-MENU-LAT-005 - Validar Item 5 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 5 do Menu Lateral         ${HISTORY_MENU}
    Then Tela "Em breve" é exibida

CT-MENU-LAT-006 - Validar Item 6 Menu Lateral - Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 6 do Menu Lateral         ${PERSON_MENU}
    Then Tela "Em breve" é exibida