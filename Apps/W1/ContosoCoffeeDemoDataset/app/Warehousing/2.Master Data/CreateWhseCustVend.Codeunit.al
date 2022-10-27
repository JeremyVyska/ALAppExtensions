codeunit 4794 "Create Whse Cust/Vend"
{
    trigger OnRun()
    begin
        WhseDemoDataSetup.Get();

        InsertVendorData(WhseDemoDataSetup."Vendor No.", XBeansSupplierLbl, WhseDemoDataSetup."Vendor Posting Group", WhseDemoDataSetup."Vend. Gen. Bus. Posting Group", '', '');

        InsertCustomerData(WhseDemoDataSetup."S. Customer No.", XSmallCustomerLbl, WhseDemoDataSetup."S. Cust. Posting Group", WhseDemoDataSetup."SCust. Gen. Bus. Posting Group", '', '');
        InsertCustomerData(WhseDemoDataSetup."L. Customer No.", XLargeCustomerLbl, WhseDemoDataSetup."L. Cust. Posting Group", WhseDemoDataSetup."LCust. Gen. Bus. Posting Group", '', '');
    end;

    var
        WhseDemoDataSetup: Record "Whse Demo Data Setup";
        XBeansSupplierLbl: Label 'Bean Wholesale', MaxLength = 30;
        XSmallCustomerLbl: Label 'Localcino', MaxLength = 30;
        XLargeCustomerLbl: Label 'Mocha Multinational', MaxLength = 30;

    local procedure InsertVendorData("No.": Code[20]; Name: Text[30]; VendorPostingGroup: Code[20]; BusPostingGroup: Code[20]; Address: Text[30]; CountryCode: Code[10])
    var
        Vendor: Record Vendor;
        TaxArea: Record "Tax Area";
    begin
        if Vendor.Get("No.") then
            exit;

        Vendor.Init();

        Vendor.Validate("No.", "No.");
        Vendor.Validate(Name, Name);
        Vendor.Validate(Address, Address);
        Vendor.Validate("Country/Region Code", CountryCode);

        if WhseDemoDataSetup."Company Type" = WhseDemoDataSetup."Company Type"::"Sales Tax" then
            if TaxArea.FindFirst() then
                Vendor.Validate("Tax Area Code", TaxArea.Code);

        OnBeforeVendorInsert(Vendor);

        if Vendor."Vendor Posting Group" = '' then
            Vendor.Validate("Vendor Posting Group", VendorPostingGroup);
        if Vendor."Gen. Bus. Posting Group" = '' then
            Vendor.Validate("Gen. Bus. Posting Group", BusPostingGroup);

        Vendor.Insert(true);
    end;

    local procedure InsertCustomerData("No.": Code[20]; Name: Text[30]; CustomerPostingGroup: Code[20]; BusPostingGroup: Code[20]; Address: Text[30]; CountryCode: Code[10])
    var
        Customer: Record Customer;
        TaxArea: Record "Tax Area";
    begin
        if Customer.Get("No.") then
            exit;

        Customer.Init();

        Customer.Validate("No.", "No.");
        Customer.Validate(Name, Name);
        Customer.Validate(Address, Address);
        Customer.Validate("Country/Region Code", CountryCode);

        if WhseDemoDataSetup."Company Type" = WhseDemoDataSetup."Company Type"::"Sales Tax" then
            if TaxArea.FindFirst() then
                Customer.Validate("Tax Area Code", TaxArea.Code);

        OnBeforeCustomerInsert(Customer);

        if Customer."Customer Posting Group" = '' then
            Customer.Validate("Customer Posting Group", CustomerPostingGroup);
        if Customer."Gen. Bus. Posting Group" = '' then
            Customer.Validate("Gen. Bus. Posting Group", BusPostingGroup);

        Customer.Insert(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeVendorInsert(var Vendor: Record Vendor)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCustomerInsert(var Customer: Record Customer)
    begin
    end;
}
