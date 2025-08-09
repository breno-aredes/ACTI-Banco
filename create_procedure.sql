CREATE PROCEDURE sp_insert_partner
    @PartnerType VARCHAR(50),
    @PersonalityType VARCHAR(20),
    @CompanyName VARCHAR(255),
    @TradeName VARCHAR(255),
    @CnpjCpf VARCHAR(20),
    @Segment VARCHAR(100),
    @Category VARCHAR(100),
    @ZipCode VARCHAR(10),
    @Country VARCHAR(50),
    @State VARCHAR(2),
    @City VARCHAR(100),
    @Street VARCHAR(255),
    @Number VARCHAR(20),
    @District VARCHAR(100),
    @Email VARCHAR(255),
    @Phone VARCHAR(20),
    @AddressComplement VARCHAR(255),
    @MobilePhone VARCHAR(20),
    @Notes TEXT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Partners WHERE CnpjCpf = @CnpjCpf)
    BEGIN
        RAISERROR ('CNPJ/CPF already exists', 16, 1);
        RETURN;
    END

    INSERT INTO Partners (
        PartnerType, PersonalityType, CompanyName, TradeName, CnpjCpf,
        Segment, Category, ZipCode, Country, State, City, Street, Number,
        District, Email, Phone, AddressComplement, MobilePhone, Notes
    )
    VALUES (
        @PartnerType, @PersonalityType, @CompanyName, @TradeName, @CnpjCpf,
        @Segment, @Category, @ZipCode, @Country, @State, @City, @Street, @Number,
        @District, @Email, @Phone, @AddressComplement, @MobilePhone, @Notes
    );
END;
