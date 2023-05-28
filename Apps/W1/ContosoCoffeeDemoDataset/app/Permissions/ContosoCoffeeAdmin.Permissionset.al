permissionset 4763 "Contoso Coffee Admin"
{
    Access = Public;
    Assignable = true;
    Caption = 'Contoso Coffee Admin';

    IncludedPermissionSets = "Contoso Coffee -Read";

    Permissions =
        tabledata "Assisted Company Setup Status" = m,
        tabledata "Base Calendar" = i,
        tabledata Bin = i,
        tabledata "Bin Type" = i,
        tabledata "Bin Template" = i,
        tabledata "Capacity Constrained Resource" = im,
        tabledata "Capacity Unit of Measure" = i,
        tabledata "Company Information" = m,
        tabledata Customer = i,
        tabledata "Customer Posting Group" = i,
        tabledata "Fault Reason Code" = i,
        tabledata "G/L Account" = i,
        tabledata "Gen. Business Posting Group" = i,
        tabledata "Gen. Product Posting Group" = i,
        tabledata "General Posting Setup" = im,
        tabledata "Inventory Posting Group" = i,
        tabledata "Inventory Posting Setup" = i,
        tabledata "Inventory Setup" = im,
        tabledata "Item Category" = i,
        tabledata "Item Journal Batch" = i,
        tabledata "Item Journal Line" = i,
        tabledata "Item Journal Template" = i,
        tabledata "Item Tracking Code" = i,
        tabledata "Item Unit of Measure" = i,
        tabledata "Item Variant" = i,
        tabledata "Item" = i,
        tabledata "Job" = i,
        tabledata "Jobs Demo Account" = IMD,
        tabledata "Jobs Demo Data Setup" = IMD,
        tabledata "Job Journal Batch" = i,
        tabledata "Job Journal Line" = i,
        tabledata "Job Journal Template" = i,
        tabledata "Job Task" = i,
        tabledata "Jobs Setup" = i,
        tabledata "Loaner" = i,
        tabledata "Location" = i,
        tabledata "Machine Center" = im,
        tabledata "Manufacturing Demo Account" = IMD,
        tabledata "Manufacturing Demo Data Setup" = IMD,
        tabledata "No. Series Line" = im,
        tabledata "No. Series" = i,
        tabledata "Order Promising Setup" = im,
        tabledata "Production BOM Header" = im,
        tabledata "Production BOM Line" = i,
        tabledata "Production BOM Version" = m,
        tabledata "Put-away Template Header" = i,
        tabledata "Put-away Template Line" = i,
        tabledata "Purchase Header" = im,
        tabledata "Purchase Line" = im,
        tabledata "Resource" = i,
        tabledata "Resource Service Zone" = i,
        tabledata "Resource Skill" = i,
        tabledata "Resource Unit of Measure" = i,
        tabledata "Routing Header" = im,
        tabledata "Routing Line" = i,
        tabledata "Routing Link" = i,
        tabledata "Routing Version" = im,
        tabledata "Sales Header" = im,
        tabledata "Sales Line" = im,
        tabledata "Scrap" = i,
        tabledata "Service Contract Header" = i,
        tabledata "Service Contract Account Group" = i,
        tabledata "Service Item" = i,
        tabledata "Service Item Group" = i,
        tabledata "Service Mgt. Setup" = i,
        tabledata "Service Order Type" = i,
        tabledata "Service Zone" = i,
        tabledata "Svc Demo Data Setup" = IMD,
        tabledata "Svc Demo Account" = IMD,
        tabledata "Shop Calendar Working Days" = i,
        tabledata "Shop Calendar" = i,
        tabledata "Skill Code" = i,
        tabledata "Stop" = i,
        tabledata "Tax Area" = i,
        tabledata "Unit of Measure" = i,
        tabledata "Vendor" = i,
        tabledata "Vendor Posting Group" = i,
        tabledata "Warehouse Class" = i,
        tabledata "Warehouse Employee" = id,
        tabledata "Warehouse Journal Template" = im,
        tabledata "Warehouse Setup" = im,
        tabledata "Whse Demo Data Setup" = IMD,
        tabledata "Whse. Demo Account" = IMD,
        tabledata "Work Center Group" = i,
        tabledata "Work Center" = im,
        tabledata "Work Shift" = i,
        tabledata Zone = i;
}
