# ACTI-Banco

## Banco de Dados - Cadastro de Parceiros Comerciais

Este repositório contém os scripts SQL para o banco de dados do sistema de cadastro de parceiros comerciais do desafio ACTi.

### Estrutura dos Arquivos

- `create_table.sql` - Script para criar a tabela Partners
- `create_procedure.sql` - Script para criar a procedure sp_insert_partner
- `script_example_select.sql` - Exemplo de consulta SELECT
- `setup_complete.sh` - Script automatizado para configuração completa

### Como Configurar no WSL (Ubuntu)

#### 1. Pré-requisitos

- WSL2 com Ubuntu
- SQL Server 2022 instalado no WSL

#### 2. Instalação do SQL Server (se necessário)

```bash
# Adicionar repositório Microsoft
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

# Adicionar repositório SQL Server 2022
curl -fsSL https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

# Instalar SQL Server
sudo apt-get update
sudo apt-get install -y mssql-server

# Configurar SQL Server
sudo /opt/mssql/bin/mssql-conf setup

# Instalar ferramentas
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update && sudo apt-get install -y mssql-tools18 unixodbc-dev

# Adicionar ao PATH
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
```

#### 3. Configuração Automatizada

Execute o script de configuração completa:

```bash
chmod +x setup_complete.sh
./setup_complete.sh
```

#### 4. Configuração Manual (alternativa)

1. **Criar o Banco:**

   ```bash
   /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -Q "CREATE DATABASE ACTI"
   ```

2. **Criar a Tabela:**

   ```bash
   /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d ACTI -i create_table.sql
   ```

3. **Criar a Procedure:**
   ```bash
   /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d ACTI -i create_procedure.sql
   ```

#### 5. Verificar Instalação

```bash
# Verificar status do SQL Server
sudo systemctl status mssql-server

# Testar conexão
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -Q "SELECT @@VERSION"
```

### Validações Implementadas

- **Campos obrigatórios:** PartnerType, PersonalityType, CompanyName, CnpjCpf
- **Validação de duplicidade:** CNPJ/CPF únicos no sistema
- **Tratamento de erros:** Mensagens descritivas para falhas
- **Tipos de parceiros:** Cliente, Fornecedor, Agente Logística, Despachante

### Estrutura da Tabela Partners

| Campo             | Tipo         | Descrição                        |
| ----------------- | ------------ | -------------------------------- |
| Id                | INT          | Chave primária (auto incremento) |
| PartnerType       | VARCHAR(50)  | Tipo do parceiro                 |
| PersonalityType   | VARCHAR(20)  | Física ou Jurídica               |
| CompanyName       | VARCHAR(255) | Razão Social                     |
| TradeName         | VARCHAR(255) | Nome Fantasia                    |
| CnpjCpf           | VARCHAR(20)  | CNPJ/CPF (único)                 |
| Segment           | VARCHAR(100) | Segmento de atuação              |
| Category          | VARCHAR(100) | Categoria                        |
| ZipCode           | VARCHAR(10)  | CEP                              |
| Country           | VARCHAR(50)  | País (padrão: Brazil)            |
| State             | VARCHAR(2)   | UF                               |
| City              | VARCHAR(100) | Município                        |
| Street            | VARCHAR(255) | Logradouro                       |
| Number            | VARCHAR(20)  | Número                           |
| District          | VARCHAR(100) | Bairro                           |
| Email             | VARCHAR(255) | E-mail                           |
| Phone             | VARCHAR(20)  | Telefone                         |
| AddressComplement | VARCHAR(255) | Complemento                      |
| MobilePhone       | VARCHAR(20)  | Celular                          |
| Notes             | TEXT         | Observações                      |

### Objetivo do Projeto

Este banco de dados faz parte do desafio para Desenvolvedor Jr WEB da ACTi, focando em:

- Criação de estrutura de dados robusta
- Implementação de validações de negócio
- Procedures seguras para inserção
- Preparação para integração com backend/frontend

---

**Desenvolvido por:** Breno Arêdes
