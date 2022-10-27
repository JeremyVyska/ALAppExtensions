codeunit 4791 "Create Whse Put Away Template"
{
    Permissions = tabledata "Put-away Template Header" = rim,
        tabledata "Put-away Template Line" = rim;

    var
        DoInsertTriggers: Boolean;

    trigger OnRun()
    begin
        CreateCollection(false);
    end;

    local procedure CreatePutawayTemplateHeader(
        Code: Code[10];
        Description: Text[100]
    )
    var
        PutawayTemplateHeader: Record "Put-away Template Header";
    begin
        PutawayTemplateHeader.Init();
        PutawayTemplateHeader."Code" := Code;
        PutawayTemplateHeader."Description" := Description;
        PutawayTemplateHeader.Insert(DoInsertTriggers);
    end;

    local procedure CreatePutawayTemplateLine(
        PutawayTemplateCode: Code[10];
        LineNo: Integer;
        Description: Text[100];
        FindFixedBin: Boolean;
        FindFloatingBin: Boolean;
        FindSameItem: Boolean;
        FindUnitofMeasureMatch: Boolean;
        FindBinwLessthanMinQty: Boolean;
        FindEmptyBin: Boolean
    )
    var
        PutawayTemplateLine: Record "Put-away Template Line";
    begin
        PutawayTemplateLine.Init();
        PutawayTemplateLine."Put-away Template Code" := PutawayTemplateCode;
        PutawayTemplateLine."Line No." := LineNo;
        PutawayTemplateLine."Description" := Description;
        PutawayTemplateLine."Find Fixed Bin" := FindFixedBin;
        PutawayTemplateLine."Find Floating Bin" := FindFloatingBin;
        PutawayTemplateLine."Find Same Item" := FindSameItem;
        PutawayTemplateLine."Find Unit of Measure Match" := FindUnitofMeasureMatch;
        PutawayTemplateLine."Find Bin w. Less than Min. Qty" := FindBinwLessthanMinQty;
        PutawayTemplateLine."Find Empty Bin" := FindEmptyBin;
        PutawayTemplateLine.Insert(DoInsertTriggers);
    end;

    local procedure CreateCollection(ShouldRunInsertTriggers: Boolean)
    begin
        DoInsertTriggers := ShouldRunInsertTriggers;
        CreatePutawayTemplateHeader('STD', 'Standard Template');
        CreatePutawayTemplateHeader('VAR', 'Variable Template');

        CreatePutawayTemplateLine('STD', 10000, '', true, false, true, true, true, false);
        CreatePutawayTemplateLine('STD', 20000, '', true, false, true, true, false, false);
        CreatePutawayTemplateLine('STD', 30000, '', false, true, true, true, false, false);
        CreatePutawayTemplateLine('STD', 40000, '', false, true, true, false, false, false);
        CreatePutawayTemplateLine('STD', 50000, '', false, true, false, false, false, true);
        CreatePutawayTemplateLine('STD', 60000, '', false, true, false, false, false, false);
        CreatePutawayTemplateLine('VAR', 10000, '', false, true, true, true, false, false);
        CreatePutawayTemplateLine('VAR', 20000, '', false, true, false, false, false, true);
        CreatePutawayTemplateLine('VAR', 30000, '', false, true, false, false, false, false);

    end;
}
