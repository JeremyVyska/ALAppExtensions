codeunit 4787 "Create Whse Locations"
{
    Permissions = tabledata "Location" = rim;

    var
        WhseDemoDataSetup: Record "Whse Demo Data Setup";
        DoInsertTriggers: Boolean;
        XBASICLOCNAMETok: Label 'Silver Warehouse';
        XSIMPLELOCNAMETok: Label 'Yellow Warehouse';
        XADVLOCNAMETok: Label 'White Warehouse';
        XTRANSITLOCNAMETok: Label 'Own Logistics';


    trigger OnRun()
    var
        IsHandled: Boolean;
    begin
        WhseDemoDataSetup.Get();
        CreateLocations(false);
        OnAfterCreateLocations();

        OnBeforeAddCurrentUserAsWhseEmployee(IsHandled);
        if not IsHandled then
            AddUserAsWarehouseEmployee(CopyStr(UserId, 1, 50));
    end;

    local procedure CreateLocation(
        Code: Code[10];
        Name: Text[100];
        UseAsInTransit: Boolean;
        RequirePutaway: Boolean;
        RequirePick: Boolean;
        UseCrossDocking: Boolean;
        RequireReceive: Boolean;
        RequireShipment: Boolean;
        BinMandatory: Boolean;
        DirectedPutawayandPick: Boolean;
        DefaultBinSelection: Enum "Location Default Bin Selection";
        PutawayTemplateCode: Code[10];
        AllowBreakbulk: Boolean;
        BinCapacityPolicy: Option;
        AdjustmentBinCode: Code[20];
        ReceiptBinCode: Code[20];
        ShipmentBinCode: Code[20];
        CrossDockBinCode: Code[20];
        ToAssemblyBinCode: Code[20];
        FromAssemblyBinCode: Code[20];
        AsmtoOrderShptBinCode: Code[20];
        UseADCS: Boolean
    )
    var
        Location: Record "Location";
    begin
        if Location.Get(Code) then
            exit;
        Location.Init();
        Location."Code" := Code;
        Location."Name" := Name;
        Location."Use As In-Transit" := UseAsInTransit;
        Location."Require Put-away" := RequirePutaway;
        Location."Require Pick" := RequirePick;
        Location."Use Cross-Docking" := UseCrossDocking;
        Location."Require Receive" := RequireReceive;
        Location."Require Shipment" := RequireShipment;
        Location."Bin Mandatory" := BinMandatory;
        Location."Directed Put-away and Pick" := DirectedPutawayandPick;
        Location."Default Bin Selection" := DefaultBinSelection;
        Location."Put-away Template Code" := PutawayTemplateCode;
        Location."Always Create Put-away Line" := DirectedPutawayandPick;
        Location."Allow Breakbulk" := AllowBreakbulk;
        Location."Bin Capacity Policy" := BinCapacityPolicy;
        Location."Adjustment Bin Code" := AdjustmentBinCode;
        Location."Receipt Bin Code" := ReceiptBinCode;
        Location."Shipment Bin Code" := ShipmentBinCode;
        Location."Cross-Dock Bin Code" := CrossDockBinCode;
        if CrossDockBinCode <> '' then
            Evaluate(Location."Cross-Dock Due Date Calc.", '<1W>');
        Location."To-Assembly Bin Code" := ToAssemblyBinCode;
        Location."From-Assembly Bin Code" := FromAssemblyBinCode;
        Location."Asm.-to-Order Shpt. Bin Code" := AsmtoOrderShptBinCode;
        Location."Use ADCS" := UseADCS;
        OnBeforeInsertCreateLocation(Location);
        Location.Insert(DoInsertTriggers);
    end;

    local procedure CreateLocations(ShouldRunInsertTriggers: Boolean)
    begin
        DoInsertTriggers := ShouldRunInsertTriggers;
        CreateLocation(WhseDemoDataSetup."Location Basic", XBASICLOCNAMETok, false, true, true, true, false, false, true, false, Enum::"Location Default Bin Selection"::"Fixed Bin", '', false, 0, '', '', '', '', '', '', '', false);
        CreateLocation(WhseDemoDataSetup."Location Simple Logistics", XSIMPLELOCNAMETok, false, true, true, false, true, true, false, false, Enum::"Location Default Bin Selection"::" ", '', false, 0, '', '', '', '', '', '', '', false);
        CreateLocation(WhseDemoDataSetup."Location Advanced Logistics", XADVLOCNAMETok, false, true, true, true, true, true, true, true, Enum::"Location Default Bin Selection"::" ", 'STD', true, 2, 'W-11-0001', 'W-08-0001', 'W-09-0001', 'W-14-0001', 'W-07-0002', 'W-07-0003', '', true);
        CreateLocation(WhseDemoDataSetup."Location In-Transit", XTRANSITLOCNAMETok, true, false, false, false, false, false, false, false, Enum::"Location Default Bin Selection"::" ", '', false, 0, '', '', '', '', '', '', '', false);
    end;

    local procedure AddUserAsWarehouseEmployee(UserId: Text[50])
    var
        WarehouseEmployee: Record "Warehouse Employee";
    begin
        if not WarehouseEmployee.Get(UserId, WhseDemoDataSetup."Location Basic") then begin
            WarehouseEmployee.Init();
            WarehouseEmployee."User ID" := UserId;
            WarehouseEmployee."Location Code" := WhseDemoDataSetup."Location Basic";
            WarehouseEmployee.Insert(true);
        end;
        if not WarehouseEmployee.Get(UserId, WhseDemoDataSetup."Location Simple Logistics") then begin
            WarehouseEmployee.Init();
            WarehouseEmployee."User ID" := UserId;
            WarehouseEmployee."Location Code" := WhseDemoDataSetup."Location Simple Logistics";
            WarehouseEmployee.Insert(true);
        end;
        if not WarehouseEmployee.Get(UserId, WhseDemoDataSetup."Location Advanced Logistics") then begin
            WarehouseEmployee.Init();
            WarehouseEmployee."User ID" := UserId;
            WarehouseEmployee."Location Code" := WhseDemoDataSetup."Location Advanced Logistics";
            WarehouseEmployee.Default := true;
            WarehouseEmployee.Insert(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAddCurrentUserAsWhseEmployee(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateLocations()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertCreateLocation(var Location: Record Location)
    begin
    end;
}
