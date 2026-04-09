*** Settings ***
Library    SeleniumLibrary

*** Variables ***

######################################################
####################    TIMEOUTS  ####################
######################################################
${SMALL_TIMEOUT}        10s
${MEDIUM_TIMEOUT}       15s
${LARGE_TIMEOUT}        30s

######################################################
###################    CONNECTION  ###################
######################################################
${URL}                  http://analista-teste.seatecnologia.com.br/

######################################################
#################    MENU LATERAL    #################
######################################################
${BUILDING_MENU}        //img[@src="/assets/building-22d5608a.svg"]
${EDIT_MENU}            //img[@src="/assets/edit-dfcb7eed.svg"]
${NODE_TREE_MENU}       //img[@src="/assets/node-tree-924036ae.svg"]
${BELL_MENU}            //img[@src="/assets/bell-181193f6.svg"]
${HISTORY_MENU}         //img[@src="/assets/history-9102babe.svg"]
${PERSON_MENU}          //img[@src="/assets/person-bde031c5.svg"]

*** Keywords ***
Usuário acessa página do desafio
    [Arguments]    ${BROWSER}
    Log To Console                               \n...Acessando a página do desafio...   
    Open Browser                                 ${URL}                   ${BROWSER}
    Maximize Browser Window
    Title Should Be                              Vite + React + TS
    Wait Until Page Contains                     Funcionário(s)           ${SMALL_TIMEOUT}
    Log To Console                               ...Página do desafio acessada com sucesso!...

Aciona elemento
    [Arguments]    ${ELEMENT}
    Log To Console                               ...Clicando no elemento: ${ELEMENT}...
    Wait Until Element Is Visible                ${ELEMENT}               ${SMALL_TIMEOUT}
    Click Element                                ${ELEMENT}

Valida texto em tela
    [Arguments]    ${TEXTO}
    ${teste}    Run Keyword And Return Status    Wait Until Page Contains    ${TEXTO}    ${SMALL_TIMEOUT}
    IF    ${teste}
        Capture Page Screenshot    menuLateral01.png
    ELSE
        Capture Page Screenshot    menuLateral01Erro.png
        Fail    TEXTO "${TEXTO}" NÃO FOI EXIBIDO EM ${SMALL_TIMEOUT} SEGUNDOS!!!
    END  

Valida elemento em tela
    [Arguments]    ${ELEMENTO}
    ${teste}    Run Keyword And Return Status    Wait Until Page Contains Element    ${ELEMENTO}    ${SMALL_TIMEOUT}
    IF    ${teste}
        Capture Page Screenshot    menuLateral01.png
    ELSE
        Capture Page Screenshot    menuLateral01Erro.png
        Fail    ELEMENTO "${ELEMENTO}" NÃO FOI EXIBIDO EM ${SMALL_TIMEOUT} SEGUNDOS!!!
    END  

Valida menu selecionado
    [Arguments]    ${MENU}
    ${selecionado}    Execute Javascript    return window.getComputedStyle(document.querySelector(".c-juSleU > div:nth-of-type(${MENU})"), '::before').backgroundColor;
    Run Keyword And Continue On Failure          Should Be Equal          ${selecionado}           rgb(255, 255, 255)
    IF    '${selecionado}' != 'rgb(255, 255, 255)'
        Log To Console                           ...O MENU ${MENU} NÃO FOI SELECIONADO CORRETAMENTE!!!...
    END
    
Tela "Em breve" é exibida
    Log To Console                               ...Validando exibição da tela "Em breve"...
    Valida texto em tela                         Em breve

Valida fonte de texto 
    [Arguments]    ${selector}
    Log To Console                               ...Validando fonte do texto de descrição...
    ${fontFamily}    Execute Javascript    return window.getComputedStyle(document.querySelector('${selector}')).fontFamily;
    Run Keyword And Continue On Failure          
    ...    Should Be Equal    ${fontFamily}    Ubuntu, sans-serif    msg=...FONTE DIFERENTE DO PROTÓTIPO!!! PROTÓTIPO: Ubuntu, sans-serif, FONTE ATUAL: ${fontFamily}!!!...    values=False

Valida tamanho de texto
    [Arguments]    ${selector}    ${tamanho}
    Log To Console                               ...Validando tamanho do texto de descrição...
    ${fontSize}    Execute Javascript    return window.getComputedStyle(document.querySelector('${selector}')).fontSize;
    Run Keyword And Continue On Failure          
    ...    Should Be Equal    ${fontSize}    ${tamanho}px    msg=...TAMANHO DA FONTE DIFERENTE DO PROTÓTIPO! PROTÓTIPO: ${tamanho}px, FONTE ATUAL: ${fontSize}!!!...    values=False

Valida cor
    [Arguments]    ${selector}    ${cor}
    Log To Console                               ...Validando cor do texto ou elemento...
    ${color}    Execute Javascript    return window.getComputedStyle(document.querySelector('${selector}')).color;
    Run Keyword And Continue On Failure          
    ...    Should Be Equal    ${color}    ${cor}    msg=...COR DO TEXTO OU ELEMENTO DIFERENTE DO PROTÓTIPO! PROTÓTIPO: ${cor}, COR ATUAL: ${color}!!!...    values=False

Valida cor de fundo
    [Arguments]    ${selector}    ${cor}
    Log To Console                               ...Validando cor de fundo do elemento...
    ${backgroundColor}    Execute Javascript    return window.getComputedStyle(document.querySelector('${selector}')).backgroundColor;
    Run Keyword And Continue On Failure          
    ...    Should Be Equal    ${backgroundColor}    ${cor}    msg=...COR DE FUNDO DIFERENTE DO PROTÓTIPO! PROTÓTIPO: ${cor}, COR ATUAL: ${backgroundColor}!!!...    values=False