# 🧪 Automação de Testes - Desafio SEA Tecnologia

## 📋 Sobre o Projeto

Este repositório contém uma **suite de testes automatizados** desenvolvida em **Robot Framework** para validação funcional da aplicação web "Vite + React + TS" da **SEA Tecnologia**. O projeto implementa testes end-to-end (E2E) para garantir a qualidade e estabilidade das funcionalidades principais da plataforma.

### 🎯 Objetivo

Validar o funcionamento correto das seguintes funcionalidades:
- ✅ **Navegação do Menu Lateral** - Validação de todos os 6 itens do menu
- ✅ **Cadastro de Funcionários** - Múltiplos cenários de cadastro com variações de status, EPI e documentação

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Descrição | Versão |
|-----------|-----------|---------|
| **Robot Framework** | Framework de automação de testes | Latest |
| **SeleniumLibrary** | Biblioteca para automação web | Latest |
| **Robot Framework Faker** | Geração de dados aleatórios | Latest |
| **Python** | Linguagem de programação | 3.8+ |
| **Chrome/Firefox** | Navegadores para testes | Latest |

---

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados:

- **Python 3.8 ou superior** - [Download](https://www.python.org/downloads/)
- **pip** - Gerenciador de pacotes Python (instalado com Python)
- **Google Chrome** ou **Mozilla Firefox** - Para execução dos testes
- **Git** - Para versionamento de código

---

## 🚀 Instalação e Configuração

### 1️⃣ Clone o Repositório

```bash
git clone https://github.com/rjacominifilho/desafioSea.git
cd desafioSea
```

### 2️⃣ Crie um Ambiente Virtual

```bash
# Para macOS/Linux
python3 -m venv venv
source venv/bin/activate

# Para Windows
python -m venv venv
venv\Scripts\activate
```

### 3️⃣ Instale as Dependências

```bash
pip install -r requirements.txt
```

As dependências incluem:
- `robotframework` - Framework de automação
- `robotframework-seleniumLibrary` - Automação web
- `robotframework-faker` - Geração de dados (locale: pt_BR)

---

## 📂 Estrutura do Projeto

```
desafioSea/
├── resources/
│   └── base.resource              # Keywords e variáveis compartilhadas
├── pages/
│   ├── cadastroFuncionario/
│   │   └── cadastroFuncionarioPage.resource  # Page Object - Cadastro
│   └── menuLateral/
│       └── menuLateralPage.resource          # Page Object - Menu Lateral
├── tests/
│   ├── ST_Cadastro_Funcionario/
│   │   └── cadastroFuncionario.robot         # Test Suite - Cadastro
│   └── ST_Menu_Lateral/
│       └── menuLateral.robot                 # Test Suite - Menu Lateral
├── results/
│   ├── log.html                  # Logs detalhados dos testes
│   ├── report.html               # Relatório de execução
│   └── output.xml                # Resultado em XML
├── requirements.txt              # Dependências Python
├── executar_testes.sh            # Script para executar testes
└── README.md                      # Este arquivo
```

### 🏗️ Arquitetura

O projeto segue o padrão **Page Object Model (POM)** para melhor manutenibilidade:

- **base.resource**: Contém keywords genéricas e variáveis compartilhadas entre os testes
- **pages/**: Page Objects específicos para cada seção da aplicação
- **tests/**: Suites de testes organizadas por funcionalidade

---

## ▶️ Executando os Testes

### Executar Todos os Testes (Chrome e Firefox)

**macOS/Linux:**
```bash
./executar_testes.sh
```

**Windows:**
```cmd
executar_testes.bat
```

Ou simplesmente clique duas vezes no arquivo `executar_testes.bat`.

### Executar Testes em um Navegador Específico

**Chrome:**
```bash
robot -d results -v BROWSER:chrome tests
```

**Firefox:**
```bash
robot -d results -v BROWSER:firefox tests
```

### Executar uma Suite Específica

**Menu Lateral:**
```bash
robot -d results -v BROWSER:chrome tests/ST_Menu_Lateral/menuLateral.robot
```

**Cadastro de Funcionário:**
```bash
robot -d results -v BROWSER:chrome tests/ST_Cadastro_Funcionario/cadastroFuncionario.robot
```

### Executar por Tags

```bash
# Todos os testes de cadastro ativo
robot -d results -v BROWSER:chrome -i Ativo tests

# Testes sem EPI
robot -d results -v BROWSER:chrome -i SemEPI tests

# Excluir testes em desenvolvimento
robot -d results -v BROWSER:chrome -e WIP tests
```

---

## 📊 Resultados dos Testes

Após a execução, os resultados estarão disponíveis na pasta `results/`:

- **`report.html`** - Relatório visual com gráficos e sumário
- **`log.html`** - Log detalhado com screenshots e informações de cada teste
- **`output.xml`** - Resultado em formato XML para integração com CI/CD

Para visualizar os relatórios:

```bash
open results/report.html        # macOS
xdg-open results/report.html    # Linux
start results\report.html       # Windows
```

### ⚠️ Nota Importante sobre a Pasta `results/`

A pasta `results/` foi **adicionada ao repositório do Git apenas para fins didáticos**, para que você possa visualizar exemplos de relatórios gerados. Em um projeto real, essa pasta deveria estar no `.gitignore` para evitar adicionar arquivos de saída ao controle de versão.

Se desejar remover essa pasta do Git e adicionar ao `.gitignore`, execute:
```bash
git rm -r --cached results/
echo "results/" >> .gitignore
git commit -m "Remove results folder from git tracking"
```

---

## 🔧 Configurações Importantes

### Variáveis de Ambiente (base.resource)

```robot
# URLs
${URL}                  http://analista-teste.seatecnologia.com.br/

# Navegador Padrão
${BROWSER}              firefox

# Timeouts
${SMALL_TIMEOUT}        10s      # Operações rápidas
${MEDIUM_TIMEOUT}       15s      # Operações normais
${LARGE_TIMEOUT}        30s      # Operações longas
```

Para sobrescrever em tempo de execução:

```bash
robot -v BROWSER:chrome -v URL:http://seu-url.com tests
```

---

## 📝 Escrevendo Novos Testes

### Template Básico

```robot
*** Settings ***
Resource    ../../resources/base.resource
Test Teardown    Close Browser

*** Test Cases ***
CT-NOVA-FUNCIAO-001 - Descrição do Teste
    [Documentation]    Descrição detalhada do que está sendo testado
    [Tags]    NovaFuncao    Chrome    Smoke
    Given Usuário acessa página do desafio
    When Realiza ação X
    And Realiza ação Y
    Then Valida resultado esperado
```

### Keywords Disponíveis (base.resource)

```robot
Usuário acessa página do desafio           # Abre navegador na aplicação
Aciona elemento                            # Clica em um elemento
Digita texto                               # Digita em um campo
Valida texto em tela                       # Verifica se texto está visível
Valida elemento em tela                    # Verifica se elemento está visível
Tela "Em breve" é exibida                  # Valida tela interim
```

---

## 🐛 Troubleshooting

### Problema: Testes não encontram os elementos

**Solução:**
- Verifique se a URL está correta: `${URL}` em `base.resource`
- Aumente o timeout: `-v SMALL_TIMEOUT:20s`
- Valide os XPaths dos elementos no navegador

### Problema: Erro de Chrome/Firefox Driver

**Solução:**
```bash
# Reinstale a SeleniumLibrary
pip install --upgrade robotframework-seleniumLibrary

# Ou especifique a versão do driver manualmente
webdrivermanager chrome --linkpath /usr/local/bin
```

### Problema: Script `executar_testes.sh` não é executável

**Solução:**
```bash
chmod +x executar_testes.sh
./executar_testes.sh
```

---

## 🤝 Contribuindo

1. **Faça um Fork** do projeto
2. **Crie uma Branch** para sua feature (`git checkout -b feature/nova-suite`)
3. **Comite suas mudanças** (`git commit -m 'Add nova suite de testes'`)
4. **Push para a Branch** (`git push origin feature/nova-suite`)
5. **Abra um Pull Request**

### Padrões de Codificação

- Use nomes descritivos em português para Keywords
- Mantenha a estrutura de pastas (Page Objects, Test Cases, Resources)
- Adicione tags aos testes para fácil filtragem
- Documente novas Keywords com `[Documentation]`

---

## 👤 Autores

- **Rodrigo Jacomini** - Desenvolvedor QA Automation

## 🔗 Referências Úteis

- [Robot Framework Documentation](https://robotframework.org/documentation.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/latest/SeleniumLibrary.html)
- [Robot Framework Best Practices](https://github.com/robotframework/robotframework/wiki/Best-Practices)

---

**Última atualização:** Abril de 2026
