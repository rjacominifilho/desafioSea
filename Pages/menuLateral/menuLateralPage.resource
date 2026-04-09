*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/base.resource

*** Variables ***
${Imagem_Descricao}               //img[@src="data:image/png;base64,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"]
${Botao_Adicionar_Funcionario}    //button[contains(text(),"+ Adicionar Funcionário")]
${Botao_Ver_Apenas_Ativos}        //button[contains(text(),"Ver apenas ativos")]
${Botao_Limpar_Filtros}           //button[contains(text(),"Limpar filtros")]
${Contador_Funcionarios}          //div[@class="c-kGuehp"]/span
${CARD_FUNCIONARIO}               //div[@class="c-bXqUbA"]
${CPF_FUNCIONARIO}                //div[@class="c-iYbcAK"][1]
${ATIVIDADE_FUNCIONARIO}          //div[@class="c-iYbcAK"][2]
${CARGO_FUNCIONARIO}              //div[@class="c-iYbcAK"][3]
${BOTAO_CONTROLE_FUNCIONARIO}     //img[@src="/assets/dots-a1d17b25.svg"]
${BOTAO_CONCLUSAO_ETAPA}          //button[@class="ant-switch css-2uw1qp"]
${BOTAO_PROXIMO_PASSO}            //button[contains(text(),"Próximo passo")]

*** Keywords ***

###############################################################################################
####  O ITEM CORRESPONDENTE AO MENU LATERAL DEVE SER PASSADO COMO ARGUMENTO PARA O TESTE.  ####
####              EX: 1 PARA O ITEM 01, 2 PARA O ITEM 02 E ASSIM POR DIANTE                ####
###############################################################################################
Acessa o Item ${ITEM} do Menu Lateral
    [Arguments]    ${MENU}
    Log To Console                               ...Acessando o Item ${ITEM} do Menu Lateral...
    Aciona elemento                              ${MENU}
    Log To Console                               ...Validando exibição de barra de seleção de menu...
    Valida menu selecionado                      ${ITEM}

######################################################
####################    MENU 02   ####################
######################################################
Valida exibição da tela Menu 2
    Log To Console                               ...Validando exibição da tela do Item 2 do Menu Lateral...
#
#
### INÍCIO DA VALIDAÇÃO DA DIV DESCRIÇÃO ###
    Log To Console                               ...Validando DIV Descrição...
    ### VALIDAÇÃO DO TEXTO DE DESCRIÇÃO ###
    Log To Console                               ...Validando texto de descrição...
    Valida texto em tela                         Lorem ipsum dolor sit amet, consectetur adipiscing elit. In suscipit suscipit porttitor. Suspendisse ex lorem, rhoncus nec ante eu, venenatis aliquam turpis. Nulla facilisi. Curabitur nec mattis dolor. Nulla finibus bibendum ligula tempus vehicula. Ut at tristique libero, nec efficitur dui. Aliquam erat volutpat. Fusce quam sem, tempus nec justo eget, luctus scelerisque velit. Nam sollicitudin purus urna, vitae ornare neque tincidunt vel. Proin ac lacinia erat, et commodo felis. Phasellus tempor tellus eu vulputate tempus.
    Valida fonte de texto                        selector=.descriptionSpan
    Valida tamanho de texto                      selector=.descriptionSpan    tamanho=16
    ### VALIDAÇÃO DA IMAGEM DE DESCRIÇÃO ###
    Log To Console                               ...Validando imagem de descrição...
    Valida elemento em tela                      ${Imagem_Descricao}
### FIM DA VALIDAÇÃO DA DIV DESCRIÇÃO ###
#
#
### INÍCIO DA VALIDAÇÃO DA DIV FUNCIONÁRIO ###
    Log To Console                               ...Validando DIV Funcionário...
    ### VALIDAÇÃO DO TÍTULO DA SEÇÃO FUNCIONÁRIO ###
    Log To Console                               ...Validando título da seção funcionário...
    Valida texto em tela                         Funcionário(s)
    Valida fonte de texto                        selector=h2
    Valida tamanho de texto                      selector=h2    tamanho=28
    Valida cor                                   selector=h2    cor=rgb(255, 255, 255)
    ### VALIDAÇÃO DO BOTÃO DE ADICIONAR FUNCIONÁRIO ###
    Log To Console                               ...Validando botão de adicionar funcionário...
    Valida elemento em tela                      ${Botao_Adicionar_Funcionario}
    Valida fonte de texto                        selector=.c-kUQtTK
    Valida tamanho de texto                      selector=.c-kUQtTK    tamanho=16
    Valida cor                                   selector=.c-kUQtTK    cor=rgb(100, 159, 191)
    ### VALIDAÇÃO DO BOTÃO VER APENAS ATIVOS ###
    Log To Console                               ...Validando botão de ver apenas ativos...
    Valida elemento em tela                      ${Botao_Ver_Apenas_Ativos}
    Valida fonte de texto                        selector=.c-hfAyug > button:nth-child(1)
    Valida tamanho de texto                      selector=.c-hfAyug > button:nth-child(1)    tamanho=14
    Valida cor                                   selector=.c-hfAyug > button:nth-child(1)    cor=rgb(100, 159, 191)
    ### VALIDAÇÃO DO BOTÃO LIMPAR FILTROS ###
    Log To Console                               ...Validando botão de limpar filtros...
    Valida elemento em tela                      ${Botao_Limpar_Filtros}
    Valida fonte de texto                        selector=.clear
    Valida tamanho de texto                      selector=.clear    tamanho=14
    Valida cor                                   selector=.clear    cor=rgb(149, 149, 149)
    ### VALIDAÇÃO CONTADOR DE FUNCIONÁRIOS CADASTRADOS ###
    Log To Console                               ...Validando contador de funcionários cadastrados...
    Valida elemento em tela                      ${Contador_Funcionarios}
    Valida fonte de texto                        selector=.c-kGuehp > span
    Valida tamanho de texto                      selector=.c-kGuehp > span    tamanho=14
    ### VALIDAÇÃO DO CARD DE FUNCIONÁRIO CADASTRADO ###
    Log To Console                               ...Validando card de funcionário cadastrado...
    Valida elemento em tela                      ${CARD_FUNCIONARIO}
    ### Validação do nome do funcionário no card ###
    Log To Console                               ...Validando nome do funcionário no card...
    Valida elemento em tela                      ${CARD_FUNCIONARIO}
    Valida fonte de texto                        selector=.c-bXqUbA > span
    Valida tamanho de texto                      selector=.c-bXqUbA     tamanho=24
    Valida cor                                   selector=.c-bXqUbA     cor=rgb(112, 112, 112))
    ### Validação do cpf do funcionário no card ###
    Log To Console                               ...Validando cpf do funcionário no card...
    Valida elemento em tela                      ${CPF_FUNCIONARIO}
    Valida fonte de texto                        selector=.c-cwYURa > div:nth-child(1)
    Valida tamanho de texto                      selector=.c-cwYURa > div:nth-child(1)    tamanho=14
    Valida cor                                   selector=.c-cwYURa > div:nth-child(1)    cor=rgb(255, 255, 255)
    Valida cor de fundo                          selector=.c-cwYURa > div:nth-child(1)    cor=rgb(100, 159, 191)
    ### Validação da atividade do funcionário no card ###
    Log To Console                               ...Validando atividade do funcionário no card...
    Valida elemento em tela                      ${ATIVIDADE_FUNCIONARIO}
    Valida fonte de texto                        selector=.c-cwYURa > div:nth-child(2)
    Valida tamanho de texto                      selector=.c-cwYURa > div:nth-child(2)    tamanho=14
    Valida cor                                   selector=.c-cwYURa > div:nth-child(2)    cor=rgb(255, 255, 255)
    Valida cor de fundo                          selector=.c-cwYURa > div:nth-child(2)    cor=rgb(100, 159, 191)

    ### Validação do cargo do funcionário no card ###
    Log To Console                               ...Validando cargo do funcionário no card...
    Valida elemento em tela                      ${CARGO_FUNCIONARIO}
    Valida fonte de texto                        selector=.c-cwYURa > div:nth-child(3)
    Valida tamanho de texto                      selector=.c-cwYURa > div:nth-child(3)    tamanho=14
    Valida cor                                   selector=.c-cwYURa > div:nth-child(3)    cor=rgb(255, 255, 255)
    Valida cor de fundo                          selector=.c-cwYURa > div:nth-child(3)    cor=rgb(100, 159, 191)
    ### Validação do botão de controle do card de funcionário cadastrado ###
    Log To Console                               ...Validando botão de controle do card de funcionário cadastrado...
    Valida elemento em tela                      ${BOTAO_CONTROLE_FUNCIONARIO}
    Valida cor                                   selector=.c-jyZWAy    cor=rgb(100, 159, 191)
    ### Validação do botão de conclusão de etapa ###
    Log To Console                               ...Validando botão de conclusão de etapa...
    Valida texto em tela                         A etapa está concluída?
    Valida elemento em tela                      ${BOTAO_CONCLUSAO_ETAPA}
#
#
### FIM DA VALIDAÇÃO DA DIV FUNCIONÁRIO ###
#
#
### INÍCIO DA VALIDAÇÃO DO BOTÃO PRÓXIMO PASSO ###
    Log To Console                               ...Validando botão próximo passo...
    Valida elemento em tela                      ${BOTAO_PROXIMO_PASSO}
    Valida fonte de texto                        selector=.c-iuBfvZ
    Valida tamanho de texto                      selector=.c-iuBfvZ    tamanho=14
    Valida cor                                   selector=.c-iuBfvZ    cor=rgb(255, 255, 255)
    Valida cor de fundo                          selector=.c-iuBfvZ    cor=rgb(149, 149, 149)
### FIM DA VALIDAÇÃO DO BOTÃO PRÓXIMO PASSO ###
    