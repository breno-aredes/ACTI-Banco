# ACTI-Banco

## Banco de Dados - Cadastro de Parceiros Comerciais

Este repositório contém os scripts SQL para o banco de dados do sistema de cadastro de parceiros comerciais do desafio ACTi.

### Estrutura dos Arquivos

- `create_table.sql` - Script para criar a tabela Partners
- `create_procedure.sql` - Script para criar a procedure sp_insert_partner
- `script_example_select.sql` - Exemplo de consulta SELECT

### Como Configurar e Testar

#### 1. Pré-requisitos

- SQL Server (ou outro SGBD compatível)
- SQL Server Management Studio (SSMS) ou cliente SQL similar

#### 2. Configuração do Banco

```sql
-- Criar um novo banco de dados
CREATE DATABASE ParceirosDB;
USE ParceirosDB;
```

#### 3. Executar Scripts na Ordem

1. **Criar a Tabela:**

   - Execute o conteúdo completo do arquivo `create_table.sql`

2. **Criar a Procedure:**

   - Execute o conteúdo completo do arquivo `create_procedure.sql`

3. **Testar a Funcionalidade:**

   ```sql
   -- Inserir um parceiro de teste
   EXEC sp_insert_partner
       @PartnerType = 'Cliente',
       @PersonalityType = 'Jurídica',
       @CompanyName = 'Empresa Teste LTDA',
       @TradeName = 'Teste Store',
       @CnpjCpf = '12.345.678/0001-90',
       @Segment = 'Varejo',
       @Category = 'Loja',
       @ZipCode = '01234-567',
       @Country = 'Brasil',
       @State = 'SP',
       @City = 'São Paulo',
       @Street = 'Rua Teste',
       @Number = '123',
       @District = 'Centro',
       @Email = 'teste@teste.com',
       @Phone = '(11) 1234-5678',
       @AddressComplement = '',
       @MobilePhone = '(11) 98765-4321',
       @Notes = 'Parceiro de teste';
   ```

4. **Consultar os Dados:**
   - Execute o conteúdo do arquivo `script_example_select.sql`

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
