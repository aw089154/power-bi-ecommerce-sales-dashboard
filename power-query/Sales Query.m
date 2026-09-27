let
    Source = Csv.Document(
        File.Contents("CHANGE_TO_YOUR_PATH\\dataset\\ecommerce-sales.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Row ID", Int64.Type}, {"Order ID", type text},
        {"Order Date", type date}, {"Ship Date", type date},
        {"Ship Mode", type text}, {"Customer ID", type text},
        {"Customer Name", type text}, {"Segment", type text},
        {"Region", type text}, {"State", type text}, {"City", type text},
        {"Category", type text}, {"Sub-Category", type text},
        {"Product Name", type text}, {"Quantity", Int64.Type},
        {"Discount", Percentage.Type}, {"Sales", Currency.Type},
        {"Profit", Currency.Type}, {"Shipping Cost", Currency.Type}
    }),
    RemovedBlankRows = Table.SelectRows(ChangedTypes, each [Order ID] <> null and [Order ID] <> ""),
    RemovedDuplicates = Table.Distinct(RemovedBlankRows, {"Row ID"})
in
    RemovedDuplicates

