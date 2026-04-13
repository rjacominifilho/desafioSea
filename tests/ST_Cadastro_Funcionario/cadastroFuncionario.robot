*** Settings ***
Resource    ../../Pages/cadastroFuncionario/cadastroFuncionarioPage.resource

Test Teardown    Close Browser

*** Test Cases ***
CT-CAD-FUNC-001 - Cadastro de Funcionário Ativo Sem EPI e Sem Arquivo
    [Documentation]    ...CT-CAD-FUNC-001 - Validar cadastro de funcionário ativo sem EPI e sem arquivo...
    [Tags]    CadastroFuncionario    Ativo    SemEPI    SemArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário ativo sem EPI e sem arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-002 - Cadastro de Funcionário Ativo Com EPI e Sem Arquivo
    [Documentation]    ...CT-CAD-FUNC-002 - Validar cadastro de funcionário ativo com EPI e sem arquivo...
    [Tags]    CadastroFuncionario    Ativo    ComEPI    SemArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário ativo com EPI e sem arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-003 - Cadastro de Funcionário Ativo Sem EPI e Com Arquivo
    [Documentation]    ...CT-CAD-FUNC-003 - Validar cadastro de funcionário ativo sem EPI e com arquivo...
    [Tags]    CadastroFuncionario    Ativo    SemEPI    ComArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário ativo sem EPI e com arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-004 - Cadastro de Funcionário Ativo Com EPI e Com Arquivo
    [Documentation]    ...CT-CAD-FUNC-004 - Validar cadastro de funcionário ativo com EPI e com arquivo...
    [Tags]    CadastroFuncionario    Ativo    ComEPI    ComArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}                
    And Realiza cadastro de funcionário ativo com EPI e com arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-005 - Cadastro de Funcionário Inativo Sem EPI e Sem Arquivo
    [Documentation]    ...CT-CAD-FUNC-005 - Validar cadastro de funcionário inativo sem EPI e sem arquivo...
    [Tags]    CadastroFuncionario    Inativo    SemEPI    SemArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário inativo sem EPI e sem arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-006 - Cadastro de Funcionário Inativo Com EPI e Sem Arquivo
    [Documentation]    ...CT-CAD-FUNC-006 - Validar cadastro de funcionário inativo com EPI e sem arquivo...
    [Tags]    CadastroFuncionario    Inativo    ComEPI    SemArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário inativo com EPI e sem arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-007 - Cadastro de Funcionário Inativo Sem EPI e Com Arquivo
    [Documentation]    ...CT-CAD-FUNC-007 - Validar cadastro de funcionário inativo sem EPI e com arquivo...
    [Tags]    CadastroFuncionario    Inativo    SemEPI    ComArquivo    Chrome
    Given Usuário acessa página do desafio       
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU}
    And Realiza cadastro de funcionário inativo sem EPI e com arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-008 - Cadastro de Funcionário Inativo Com EPI e Com Arquivo
    [Documentation]    ...CT-CAD-FUNC-008 - Validar cadastro de funcionário inativo com EPI e com arquivo...
    [Tags]    CadastroFuncionario    Inativo    ComEPI    ComArquivo    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário inativo com EPI e com arquivo
    Then Card do Funcionário é exibido na tela

CT-CAD-FUNC-009 - Cadastro de Funcionário Sem Preencher Campos
    [Documentation]    ...CT-CAD-FUNC-009 - Validar mensagem de campo obrigatório ao tentar cadastrar funcionário sem preencher nenhum campo...
    [Tags]    CadastroFuncionario    CamposObrigatorios    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário sem preencher nenhum campo
    Then Mensagem de campos obrigatórios é exibida na tela    ${CAMPO_NOME}

CT-CAD-FUNC-010 - Cadastro de Funcionário Sem Preencher Campo CPF
    [Documentation]    ...CT-CAD-FUNC-010 - Validar mensagem de campo obrigatório ao tentar cadastrar funcionário sem preencher campo CPF...
    [Tags]    CadastroFuncionario    CamposObrigatorios    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário sem preencher campo    CPF
    Then Mensagem de campos obrigatórios é exibida na tela    ${CAMPO_CPF}

CT-CAD-FUNC-011 - Cadastro de Funcionário Sem Preencher Campo Data de Nascimento
    [Documentation]    ...CT-CAD-FUNC-011 - Validar mensagem de campo obrigatório ao tentar cadastrar funcionário sem preencher campo Data de Nascimento...
    [Tags]    CadastroFuncionario    CamposObrigatorios    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário sem preencher campo    Data de Nascimento
    Then Mensagem de campos obrigatórios é exibida na tela     ${CAMPO_DATA_NASCIMENTO}

CT-CAD-FUNC-012 - Cadastro de Funcionário Sem Preencher Campo RG
    [Documentation]    ...CT-CAD-FUNC-012 - Validar mensagem de campo obrigatório ao tentar cadastrar funcionário sem preencher campo RG...
    [Tags]    CadastroFuncionario    CamposObrigatorios    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário sem preencher campo    RG
    Then Mensagem de campos obrigatórios é exibida na tela     ${CAMPO_RG}

CT-CAD-FUNC-013 - Cadastro de Funcionário Sem Preencher Campo CA do EP
    [Documentation]    ...CT-CAD-FUNC-013 - Validar mensagem de campo obrigatório ao tentar cadastrar funcionário sem preencher campo CA do EPI...
    [Tags]    CadastroFuncionario    CamposObrigatorios    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário sem preencher campo    CA do EPI
    Then Mensagem de campos obrigatórios é exibida na tela     ${CAMPO_CA_EPI}

CT-CAD-FUNC-014 - Cadastro de Funcionário Com CPF Inválido
    [Documentation]    ...CT-CAD-FUNC-014 - Validar mensagem de CPF inválido ao tentar cadastrar funcionário com número de CPF inválido...
    [Tags]    CadastroFuncionario    ValidaCPF    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário com CPF inválido
    Then Mensagem de CPF inválido é apresentada

CT-CAD-FUNC-015 - Cadastro de Funcionário Com CPF Numérico
    [Documentation]    ...CT-CAD-FUNC-015 - Validar mensagem de CPF inválido ao tentar cadastrar funcionário com número de CPF numérico...
    [Tags]    CadastroFuncionario    ValidaCPF    Chrome
    Given Usuário acessa página do desafio                   
    When Acessa o Item 2 do Menu Lateral         ${BUILDING_MENU} 
    And Realiza cadastro de funcionário com CPF texto
    Then Mensagem de CPF inválido é apresentada