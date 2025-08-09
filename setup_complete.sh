

echo "Testando conexão com SQL Server..."
echo "Digite a senha do usuário 'sa' quando solicitado:"

/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -Q "SELECT @@VERSION"

if [ $? -eq 0 ]; then
    echo "Conexão bem-sucedida!"
    
    echo "Criando banco de dados ACTI..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -Q "CREATE DATABASE ACTI"
    
    echo "Executando create_table.sql..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d ACTI -i create_table.sql
    
    echo "Executando create_procedure.sql..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d ACTI -i create_procedure.sql
    
    echo "Testando com dados de exemplo..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d ACTI -i script_example_select.sql
    
    echo "Banco de dados ACTI configurado com sucesso!"
else
    echo "Falha na conexão. Verifique a senha e tente novamente."
fi
