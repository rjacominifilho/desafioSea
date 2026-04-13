*** Settings ***
Resource    ../menuLateral/menuLateralPage.resource

*** Variables ***
###STATUS DO CADASTRO###
${BOTAO_ATIVO_INATIVO}            //span[@class="ant-switch-inner"]
${BOTAO_ATIVO_SELECIONADO}        //span[@class="ant-switch-inner-checked"]
${BOTAO_INATIVO_SELECIONADO}      //span[@class="ant-switch-inner-unchecked"]
###DADOS PESSOAIS###
${CAMPO_NOME}                     css:input[name="name"] 
${nome}                                                
${SELETOR_SEXO}                   //div[@class="ant-radio-group ant-radio-group-outline radioGroup css-2uw1qp"]
${sexo}
${SEXO_MASCULINO}                 //span[contains(text(),"Masculino")]
${SEXO_FEMININO}                  //span[contains(text(),"Feminino")]
${CAMPO_CPF}                      css:input[name="cpf"]
${cpf}    
${cpf_formatado}
${cpf_invalido}                   000.000.000-00
${cpf_texto}                      abcdefghijk                         
${CAMPO_DATA_NASCIMENTO}          css:input[name="birthDay"]
${nascimento}
${CAMPO_RG}                       css:input[name="rg"]
${rg}
${CAMPO_CARGO}                    //*[contains(text(), 'Cargo 01')]
${CARGO_SELECIONAR}               //div[@title="Cargo 02"]
${cargo}
###ATIVIDADE E EPI###
${BOTAO_TRABALHA_COM_EPI}         //span[contains(text(),"O trabalhador não usa EPI.")]
${CAMPO_ATIVIDADE}                //*[contains(text(), 'Ativid 01')]
${ATIVIDADE_SELECIONAR}           //div[@title="Ativid 02"]
${atividade}
${CAMPO_EPI}                      //*[contains(text(), 'Capacete de segurança')]
${EPI_SELECIONAR}                 //div[@title="Óculos de proteção"]
${epi}
${CAMPO_CA_EPI}                   css:input[name="caNumber"]
${caEPI}                          123456789
###ENVIO DE ARQUIVO###
${BOTAO_SELECIONAR_ARQUIVO}       //input[@type="file"]
###SUBMIT CADASTRO###
${BOTAO_SALVAR}                   //button[@type="submit"]


*** Keywords ***

Acessa tela de cadastro de funcionário
    Log To Console                               ...Acessando tela de cadastro de funcionário...
    Aciona elemento                              ${Botao_Adicionar_Funcionario}
    Valida texto em tela                         Adicionar Funcionário
    Log To Console                               ...Tela de cadastro de funcionário acessada com sucesso!...

Inicializar Variáveis com dados aleatórios
    ###INICIALIZANDO VARIÁVEIS COM DADOS ALEATÓRIOS USANDO FAKER###
    ${sexo}         Set Variable    ${{random.choice(['Male', 'Female'])}}
    Set Suite Variable    ${sexo}
    ${nome}         Run Keyword     FakerLibrary.Name ${sexo}
    Set Suite Variable    ${nome}
    ${cpf}          Evaluate        faker.Faker('pt_BR').cpf()    modules=faker
    Set Suite Variable    ${cpf} 
    ${cpf}          Remove String   ${cpf}    .  
    ${cpf}          Remove String   ${cpf}    - 
    Set Suite Variable    ${cpf_formatado}    ${cpf}
    ${nascimento}   Evaluate        faker.Faker('pt_BR').date_of_birth(minimum_age=18, maximum_age=100).strftime('%d%m%Y')    modules=faker
    Set Suite Variable    ${nascimento}
    ${rg}           Evaluate        faker.Faker('pt_BR').rg()     modules=faker
    Set Suite Variable    ${rg}

########################################################################
####################        DADOS PESSOAIS          ####################
########################################################################
Informa data nascimento
    IF    '${BROWSER}' != 'chrome'
        Click Element    ${CAMPO_DATA_NASCIMENTO}
        ${dia}    Set Variable   ${nascimento}[0:2]  
        ${mes}    Set Variable   ${nascimento}[2:4]  
        ${ano}    Set Variable   ${nascimento}[4:]  
        Press Keys     ${CAMPO_DATA_NASCIMENTO}   ${dia}+${mes}+${ano}
    ELSE
        Digita texto                                 ${CAMPO_DATA_NASCIMENTO}      ${nascimento}
    END
Informa dados pessoais
    [Arguments]    ${STATUS}
    Log To Console                               ...Informando dados pessoais do funcionário...
    ###INICIALIZANDO VARIÁVEIS COM DADOS ALEATÓRIOS USANDO FAKER###
    Inicializar Variáveis com dados aleatórios

    IF    '${STATUS}' == 'Ativo'
        Aciona elemento                              ${BOTAO_ATIVO_INATIVO}
    END
    Valida elemento em tela                      ${BOTAO_ATIVO_SELECIONADO}
    Digita texto                                 ${CAMPO_NOME}                 ${nome}
    Valida elemento em tela                      ${SELETOR_SEXO}
    IF    '${sexo}' == 'Male'
        Aciona elemento                          ${SEXO_MASCULINO}
    ELSE
        Aciona elemento                          ${SEXO_FEMININO}
    END
    Digita texto                                 ${CAMPO_CPF}                  ${cpf_formatado}
    Informa data nascimento
    Digita texto                                 ${CAMPO_RG}                   ${rg}
    Log To Console                               ...Dados pessoais informados com sucesso!...

########################################################################
####################             CARGO              ####################
########################################################################
Seleciona Cargo
    Log To Console                               ...Selecionando cargo do funcionário...
    Seleciona combobox                           ${CAMPO_CARGO}    ${CARGO_SELECIONAR}    cargo
    Log To Console                               ...Cargo selecionado: ${cargo}...

########################################################################
####################        ATIVIDADE E EPI         ####################
########################################################################
Seleciona Atividade
    Log To Console                               ...Selecionando atividade do funcionário...
    Seleciona combobox                           ${CAMPO_ATIVIDADE}    ${ATIVIDADE_SELECIONAR}    atividade
    Log To Console                               ...Atividade selecionada: ${atividade}...
Seleciona EPI
    Log To Console                               ...Selecionando EPI...
    Seleciona combobox                           ${CAMPO_EPI}    ${EPI_SELECIONAR}    epi
    Log To Console                               ...EPI selecionado: ${epi}...
Informa CA do EPI
    Log To Console                               ...Informando CA do EPI...
    Digita texto                                 ${CAMPO_CA_EPI}              ${caEPI}
    Log To Console                               ...CA do EPI informado: ${caEPI}...

########################################################################
####################        UPLOAD ARQUIVO          ####################
########################################################################
Anexa atestado de saúde ocupacional
    Log To Console                               ...Upload de atestado de saúde ocupacional...
    Set Focus To Element                         ${BOTAO_SALVAR}
    Choose File                                  ${BOTAO_SELECIONAR_ARQUIVO}    ${EXECDIR}/Utils/ASO.pdf
    Log To Console                               ...Atestado de saúde ocupacional anexado com sucesso!...
    
########################################################################
####################        VALIDAÇÃO CARD          ####################
########################################################################
Validação Card Funcionário
    IF    '${atividade}' == ''
        Log To Console                               ...Validando exibição do card do funcionário cadastrado na tela...      
        Valida texto em tela                         Funcionário(s)
        Reload Page     
        Sleep                                        2s
        ${quantidade}    Execute Javascript    return document.querySelectorAll('.c-bXqUbA').length;
        Set Focus To Element                         //div[@class="c-bXqUbA"][${quantidade}]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]/span[contains(text(),'${nome}')]
        Sleep                                        1
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cpf}')]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cargo}')]
        Execute Javascript                           Array.from(document.querySelectorAll('div.c-bXqUbA span')).find(el => el.textContent.includes('${nome}')).style.border='4px solid red'
        Capture Element Screenshot                   //div[@class="c-bXqUbA"][${quantidade}]    funcionario(${quantidade}).png
    ELSE
        Log To Console                               ...Validando exibição do card do funcionário cadastrado na tela...      
        Valida texto em tela                         Funcionário(s)
        Reload Page     
        Sleep                                        1s
        ${quantidade}    Execute Javascript    return document.querySelectorAll('.c-bXqUbA').length;
        Scroll Element Into View                     //div[@class="c-bXqUbA"][${quantidade}]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]/span[contains(text(),'${nome}')]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cpf}')]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cargo}')]
        Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${atividade}')]
        Execute Javascript                           Array.from(document.querySelectorAll('div.c-bXqUbA span')).find(el => el.textContent.includes('${nome}')).style.border='4px solid red'
        Capture Element Screenshot                   //div[@class="c-bXqUbA"][${quantidade}]    funcionario(${quantidade}).png
    END

Validação Card Funcionário CPF Inválido
    Log To Console                               ...Validando exibição do card do funcionário cadastrado com CPF inválido...      
    Valida texto em tela                         Funcionário(s)
    Reload Page     
    Sleep                                        2s
    ${quantidade}    Execute Javascript    return document.querySelectorAll('.c-bXqUbA').length;
    Set Focus To Element                         //div[@class="c-bXqUbA"][${quantidade}]
    Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]/span[contains(text(),'${nome}')]
    Sleep                                        1
    ${teste}    Run Keyword And Return Status    Wait Until Page Contains Element    //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cpf_invalido}')]    ${SMALL_TIMEOUT}
    IF    ${teste}
        Execute Javascript                           Array.from(document.querySelectorAll('.c-iYbcAK')).findLast(el => el.textContent.includes('${cpf_invalido}')).style.border='4px solid red';
        Capture Element Screenshot                   //div[@class="c-bXqUbA"][${quantidade}]    funcionario(${quantidade})-cpfInválido.png
        Fail                                         FUNCIONÁRIO CADASTRADO COM CPF INVÁLIDO!!!
    END
    ${teste}    Run Keyword And Return Status    Wait Until Page Contains Element    //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'${cpf_texto}')]    ${SMALL_TIMEOUT}
    IF    ${teste}
        Execute Javascript                           Array.from(document.querySelectorAll('.c-iYbcAK')).findLast(el => el.textContent.includes('${cpf_texto}')).style.border='4px solid red';
        Capture Element Screenshot                   //div[@class="c-bXqUbA"][${quantidade}]    funcionario(${quantidade})-cpfInválido.png
        Fail                                         FUNCIONÁRIO CADASTRADO COM CPF INVÁLIDO!!!
    END
    
Validação Card Funcionário CPF texto
    Log To Console                               ...Validando exibição do card do funcionário cadastrado com CPF com texto...      
    Valida texto em tela                         Funcionário(s)
    Reload Page     
    Sleep                                        2s
    ${quantidade}    Execute Javascript    return document.querySelectorAll('.c-bXqUbA').length;
    Set Focus To Element                         //div[@class="c-bXqUbA"][${quantidade}]
    Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]/span[contains(text(),'${nome}')]
    Valida elemento em tela                      //div[@class="c-bXqUbA"][${quantidade}]//div[contains(text(),'abcdefghijk')]
    Execute Javascript                           Array.from(document.querySelectorAll('.c-iYbcAK')).findLast(el => el.textContent.includes('abcdefghijk')).style.border='4px solid red';
    Capture Element Screenshot                   //div[@class="c-bXqUbA"][${quantidade}]    funcionario(${quantidade})-cpfInválido.png
    Fail                                         FUNCIONÁRIO CADASTRADO COM CPF INVÁLIDO!!!
    
########################################################################
####################            CADASTRO            ####################
########################################################################

###USUÁRIO ATIVO###
Realiza cadastro de funcionário ativo sem EPI e sem arquivo
    Log To Console                               ...Realizando cadastro de funcionário ativo sem EPI...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Ativo
    Seleciona Cargo
    ###MARCANDO OPÇÃO DE FUNCIONÁRIO SEM EPI###
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário ativo com EPI e sem arquivo
    Log To Console                               ...Realizando cadastro de funcionário ativo com EPI e sem arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais   Ativo
    Seleciona Cargo
    Seleciona Atividade
    Seleciona EPI
    Informa CA do EPI
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário ativo sem EPI e com arquivo
    Log To Console                               ...Realizando cadastro de funcionário ativo sem EPI e com arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Ativo
    Seleciona Cargo
    ###MARCANDO OPÇÃO DE FUNCIONÁRIO SEM EPI###
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Anexa atestado de saúde ocupacional
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário ativo com EPI e com arquivo
    Log To Console                               ...Realizando cadastro de funcionário ativo com EPI e com arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Ativo
    Seleciona Cargo
    Seleciona Atividade
    Seleciona EPI
    Informa CA do EPI
    Anexa atestado de saúde ocupacional
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

###USUÁRIO INATIVO###
Realiza cadastro de funcionário inativo sem EPI e sem arquivo
    Log To Console                               ...Realizando cadastro de funcionário inativo sem EPI...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Inativo
    Seleciona Cargo
    ###MARCANDO OPÇÃO DE FUNCIONÁRIO SEM EPI###
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário inativo com EPI e sem arquivo
    Log To Console                               ...Realizando cadastro de funcionário inativo com EPI e sem arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais   Inativo
    Seleciona Cargo
    Seleciona Atividade
    Seleciona EPI
    Informa CA do EPI
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário inativo sem EPI e com arquivo
    Log To Console                               ...Realizando cadastro de funcionário inativo sem EPI e com arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Inativo
    Seleciona Cargo
    ###MARCANDO OPÇÃO DE FUNCIONÁRIO SEM EPI###
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Anexa atestado de saúde ocupacional
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}

Realiza cadastro de funcionário inativo com EPI e com arquivo
    Log To Console                               ...Realizando cadastro de funcionário inativo com EPI e com arquivo...
    Acessa tela de cadastro de funcionário
    Informa dados pessoais    Inativo
    Seleciona Cargo
    Seleciona Atividade
    Seleciona EPI
    Informa CA do EPI
    Anexa atestado de saúde ocupacional
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}
    
########################################################################
###############        EXIBIÇÃO CARD FUNCIONÁRIO         ###############
########################################################################
Card do Funcionário é exibido na tela
    Validação Card Funcionário

########################################################################
###############            VALIDAÇÃO DE CAMPOS            ##############
########################################################################
Realiza cadastro de funcionário sem preencher nenhum campo
    Log To Console                              ...Realizando tentativa de cadastro de funcionário sem preencher nenhum campo...
    Acessa tela de cadastro de funcionário
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}
    Sleep                                        1

Realiza cadastro de funcionário sem preencher campo
    [Arguments]    ${CAMPO}
    Inicializar Variáveis com dados aleatórios
    Log To Console                              ...Realizando tentativa de cadastro de funcionário sem preencher campo ${CAMPO}...
    Acessa tela de cadastro de funcionário
    IF    '${CAMPO}' == 'Nome'
        Digita texto                                 ${CAMPO_CPF}                  ${cpf_formatado}
        Informa data nascimento
        Digita texto                                 ${CAMPO_RG}                   ${rg}
        Digita texto                                 ${CAMPO_CA_EPI}               ${caEPI}
        Set Focus To Element                         ${BOTAO_SALVAR}
        Aciona elemento                              ${BOTAO_SALVAR}
        Sleep                                        1
    ELSE IF    '${CAMPO}' == 'CPF'
        Digita texto                                 ${CAMPO_NOME}                 ${nome}
        Informa data nascimento
        Digita texto                                 ${CAMPO_RG}                   ${rg}
        Digita texto                                 ${CAMPO_CA_EPI}               ${caEPI}
        Set Focus To Element                         ${BOTAO_SALVAR}
        Aciona elemento                              ${BOTAO_SALVAR}
        Sleep                                        1
    ELSE IF    '${CAMPO}' == 'Data de Nascimento'
        Digita texto                                 ${CAMPO_NOME}                 ${nome}
        Digita texto                                 ${CAMPO_CPF}                  ${cpf_formatado}
        Digita texto                                 ${CAMPO_RG}                   ${rg}
        Digita texto                                 ${CAMPO_CA_EPI}               ${caEPI}
        Set Focus To Element                         ${BOTAO_SALVAR}
        Aciona elemento                              ${BOTAO_SALVAR}
        Sleep                                        1
    ELSE IF    '${CAMPO}' == 'RG' 
        Digita texto                                 ${CAMPO_NOME}                 ${nome}
        Digita texto                                 ${CAMPO_CPF}                  ${cpf_formatado}
        Informa data nascimento
        Digita texto                                 ${CAMPO_CA_EPI}               ${caEPI}
        Set Focus To Element                         ${BOTAO_SALVAR}
        Aciona elemento                              ${BOTAO_SALVAR}
        Sleep                                        1
    ELSE IF    '${CAMPO}' == 'CA do EPI'
        Digita texto                                 ${CAMPO_NOME}                 ${nome}
        Digita texto                                 ${CAMPO_CPF}                  ${cpf_formatado}
        Informa data nascimento
        Digita texto                                 ${CAMPO_RG}                   ${rg}
        Set Focus To Element                         ${BOTAO_SALVAR}
        Aciona elemento                              ${BOTAO_SALVAR}
        Sleep                                        1
    END       

Mensagem de campos obrigatórios é exibida na tela
    [Arguments]    ${CAMPO}
    ${NOME}     Get Element Attribute            ${CAMPO}    name
    ${CAMPO}    Remove String    ${CAMPO}     css:
    Log To Console                               ...Validando mensagem de campos obrigatórios...    
    ${mensagem}    Execute Javascript    return document.querySelector('${CAMPO}').validationMessage;
    IF    '${BROWSER}' == 'firefox'
        Should Be Equal As Strings    ${mensagem}    Please fill in this field.    msg=...MENSAGEM DE CAMPO OBRIGATÓRIO DIFERENTE DO PROTÓTIPO!!! PROTÓTIPO: Please fill out this field., MENSAGEM ATUAL: ${mensagem}!!!...
        Capture Page Screenshot                      validaçãoCampoObrigatorio-${NOME}.png
        Log To Console                               ...Mensagem de campos obrigatórios validada com sucesso!...
    ELSE IF    '${BROWSER}' == 'chrome'
        Should Be Equal As Strings    ${mensagem}    Please fill out this field.    msg=...MENSAGEM DE CAMPO OBRIGATÓRIO DIFERENTE DO PROTÓTIPO!!! PROTÓTIPO: Please fill out this field., MENSAGEM ATUAL: ${mensagem}!!!...
        Capture Page Screenshot                      validaçãoCampoObrigatorio-${NOME}.png
        Log To Console                               ...Mensagem de campos obrigatórios validada com sucesso!...
    END
    
    

########################################################################
###############              VALIDAÇÃO CPF                ##############
########################################################################
Realiza cadastro de funcionário com CPF inválido
    Inicializar Variáveis com dados aleatórios
    Log To Console                               ...Cadastrando usuário com CPF inválido...
    Acessa tela de cadastro de funcionário
    Aciona elemento                              ${BOTAO_ATIVO_INATIVO}
    Digita texto                                 ${CAMPO_NOME}                 ${nome}
    Valida elemento em tela                      ${SELETOR_SEXO}
    IF    '${sexo}' == 'Male'
        Aciona elemento                          ${SEXO_MASCULINO}
    ELSE
        Aciona elemento                          ${SEXO_FEMININO}
    END
    ${cpf_invalido}    Remove String    ${cpf_invalido}    .
    ${cpf_invalido}    Remove String    ${cpf_invalido}    -
    Digita texto                                 ${CAMPO_CPF}                  ${cpf_invalido}
    Informa data nascimento
    Digita texto                                 ${CAMPO_RG}                   ${rg}
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}
    Sleep                                        1

Realiza cadastro de funcionário com CPF texto
    Inicializar Variáveis com dados aleatórios
    Log To Console                               ...Cadastrando usuário com CPF inválido...
    Acessa tela de cadastro de funcionário
    Aciona elemento                              ${BOTAO_ATIVO_INATIVO}
    Digita texto                                 ${CAMPO_NOME}                 ${nome}
    Valida elemento em tela                      ${SELETOR_SEXO}
    IF    '${sexo}' == 'Male'
        Aciona elemento                          ${SEXO_MASCULINO}
    ELSE
        Aciona elemento                          ${SEXO_FEMININO}
    END
    Digita texto                                 ${CAMPO_CPF}                  ${cpf_texto}
    Informa data nascimento
    Digita texto                                 ${CAMPO_RG}                   ${rg}
    Aciona elemento                              ${BOTAO_TRABALHA_COM_EPI}
    Set Focus To Element                         ${BOTAO_SALVAR}
    Aciona elemento                              ${BOTAO_SALVAR}
    Sleep                                        1

Mensagem de CPF inválido é apresentada
    ${teste}    Run Keyword And Return Status    Wait Until Page Contains    Funcionário(s)    ${SMALL_TIMEOUT}    
    IF    ${teste}
        Validação Card Funcionário CPF Inválido
    ELSE
        Log To Console                               ...Validando mensagem de CPF inválido...  
        ${CAMPO_CPF}    Remove String    ${CAMPO_CPF}     css:  
        ${mensagem}    Execute Javascript    return document.querySelector('${CAMPO_CPF}').validationMessage;
        Should Be Equal As Strings    ${mensagem}    CPF Inválido.    msg=...MENSAGEM DE CAMPO OBRIGATÓRIO DIFERENTE DO PROTÓTIPO!!! PROTÓTIPO: CPF Inválido, MENSAGEM ATUAL: ${mensagem}!!!...
        Capture Page Screenshot                      validaçãoCampoObrigatorio-${NOME}.png
        Log To Console                               ...Mensagem de CPF inválido validada com sucesso!...
    END