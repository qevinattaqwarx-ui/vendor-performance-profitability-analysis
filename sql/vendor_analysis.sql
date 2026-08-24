USE vendor_analysis;
SELECT DATABASE();

SHOW TABLES;

USE vendor_analysis;

DESCRIBE begin_inventory;
DESCRIBE end_inventory;
DESCRIBE purchase_prices;
DESCRIBE purchases;
DESCRIBE sales;
DESCRIBE vendor_invoice;


USE vendor_analysis;

SELECT
    'begin_inventory' AS table_name,
    COUNT(*) AS row_count
FROM begin_inventory

UNION ALL
SELECT
    'end_inventory',
    COUNT(*)
FROM end_inventory
UNION ALL
SELECT
    'purchase_prices',
    COUNT(*)
FROM purchase_prices
UNION ALL
SELECT
    'purchases',
    COUNT(*)
FROM purchases
UNION ALL
SELECT
    'sales',
    COUNT(*)
FROM sales
UNION ALL
SELECT
    'vendor_invoice',
    COUNT(*)
FROM vendor_invoice;



USE vendor_analysis;
SELECT
    'begin_inventory' AS table_name,
    MIN(startDate) AS min_date,
    MAX(startDate) AS max_date
FROM begin_inventory
UNION ALL
SELECT
    'end_inventory',
    MIN(endDate),
    MAX(endDate)
FROM end_inventory
UNION ALL
SELECT
    'purchases',
    MIN(PODate),
    MAX(PODate)
FROM purchases
UNION ALL
SELECT
    'sales',
    MIN(SalesDate),
    MAX(SalesDate)
FROM sales
UNION ALL
SELECT
    'vendor_invoice',
    MIN(InvoiceDate),
    MAX(InvoiceDate)
FROM vendor_invoice;


USE vendor_analysis;
SELECT
    'purchases' AS table_name,
    SUM(VendorNumber IS NULL) AS null_vendor,
    SUM(PurchasePrice IS NULL) AS null_purchase_price,
    SUM(Quantity IS NULL) AS null_quantity,
    SUM(Dollars IS NULL) AS null_dollars,
    SUM(PODate IS NULL) AS null_po_date
FROM purchases
UNION ALL
SELECT
    'sales',
    SUM(VendorNo IS NULL),
    SUM(SalesPrice IS NULL),
    SUM(SalesQuantity IS NULL),
    SUM(SalesDollars IS NULL),
    SUM(SalesDate IS NULL)
FROM sales
UNION ALL
SELECT
    'purchase_prices',
    SUM(VendorNumber IS NULL),
    SUM(PurchasePrice IS NULL),
    NULL,
    SUM(Price IS NULL),
    NULL
FROM purchase_prices;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT PONumber) AS unique_po_number,
    COUNT(DISTINCT InventoryId) AS unique_inventory_id
FROM purchases;

SELECT COUNT(*) AS total_rows
FROM sales;

USE vendor_analysis;

SELECT COUNT(*) AS total_rows
FROM vendor_invoice;

SELECT
    COUNT(*) AS total_rows,
    SUM(Brand IS NULL) AS null_brand,
    SUM(Description IS NULL) AS null_description,
    SUM(Price IS NULL) AS null_price,
    SUM(Size IS NULL) AS null_size,
    SUM(Volume IS NULL) AS null_volume,
    SUM(Classification IS NULL) AS null_classification,
    SUM(PurchasePrice IS NULL) AS null_purchase_price,
    SUM(VendorNumber IS NULL) AS null_vendor_number,
    SUM(VendorName IS NULL) AS null_vendor_name
FROM purchase_prices;


SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId IS NULL) AS null_inventory_id,
    SUM(Store IS NULL) AS null_store,
    SUM(Brand IS NULL) AS null_brand,
    SUM(Description IS NULL) AS null_description,
    SUM(Size IS NULL) AS null_size,
    SUM(VendorNumber IS NULL) AS null_vendor_number,
    SUM(VendorName IS NULL) AS null_vendor_name,
    SUM(PONumber IS NULL) AS null_po_number,
    SUM(PODate IS NULL) AS null_po_date,
    SUM(ReceivingDate IS NULL) AS null_receiving_date,
    SUM(InvoiceDate IS NULL) AS null_invoice_date,
    SUM(PayDate IS NULL) AS null_pay_date,
    SUM(PurchasePrice IS NULL) AS null_purchase_price,
    SUM(Quantity IS NULL) AS null_quantity,
    SUM(Dollars IS NULL) AS null_dollars,
    SUM(Classification IS NULL) AS null_classification
FROM purchases;


SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId IS NULL) AS null_inventory_id,
    SUM(Store IS NULL) AS null_store,
    SUM(Brand IS NULL) AS null_brand,
    SUM(Description IS NULL) AS null_description,
    SUM(Size IS NULL) AS null_size,
    SUM(SalesQuantity IS NULL) AS null_sales_quantity,
    SUM(SalesDollars IS NULL) AS null_sales_dollars,
    SUM(SalesPrice IS NULL) AS null_sales_price,
    SUM(SalesDate IS NULL) AS null_sales_date,
    SUM(Volume IS NULL) AS null_volume,
    SUM(Classification IS NULL) AS null_classification,
    SUM(ExciseTax IS NULL) AS null_excise_tax,
    SUM(VendorNo IS NULL) AS null_vendor_no,
    SUM(VendorName IS NULL) AS null_vendor_name
FROM sales;


SELECT
    COUNT(*) AS total_rows,
    SUM(VendorNumber IS NULL) AS null_vendor_number,
    SUM(VendorName IS NULL) AS null_vendor_name,
    SUM(InvoiceDate IS NULL) AS null_invoice_date,
    SUM(PONumber IS NULL) AS null_po_number,
    SUM(PODate IS NULL) AS null_po_date,
    SUM(PayDate IS NULL) AS null_pay_date,
    SUM(Quantity IS NULL) AS null_quantity,
    SUM(Dollars IS NULL) AS null_dollars,
    SUM(Freight IS NULL) AS null_freight,
    SUM(Approval IS NULL) AS null_approval
FROM vendor_invoice;

SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId IS NULL) AS null_inventory_id,
    SUM(Store IS NULL) AS null_store,
    SUM(City IS NULL) AS null_city,
    SUM(Brand IS NULL) AS null_brand,
    SUM(Description IS NULL) AS null_description,
    SUM(Size IS NULL) AS null_size,
    SUM(onHand IS NULL) AS null_on_hand,
    SUM(Price IS NULL) AS null_price,
    SUM(startDate IS NULL) AS null_start_date
FROM begin_inventory;

SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId IS NULL) AS null_inventory_id,
    SUM(Store IS NULL) AS null_store,
    SUM(City IS NULL) AS null_city,
    SUM(Brand IS NULL) AS null_brand,
    SUM(Description IS NULL) AS null_description,
    SUM(Size IS NULL) AS null_size,
    SUM(onHand IS NULL) AS null_on_hand,
    SUM(Price IS NULL) AS null_price,
    SUM(endDate IS NULL) AS null_end_date
FROM end_inventory;


SELECT
    COUNT(*) AS total_rows,
    SUM(Description = '') AS empty_description,
    SUM(Size = '') AS empty_size,
    SUM(Volume = '') AS empty_volume,
    SUM(VendorName = '') AS empty_vendor_name
FROM purchase_prices;


SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId = '') AS empty_inventory_id,
    SUM(Description = '') AS empty_description,
    SUM(Size = '') AS empty_size,
    SUM(VendorName = '') AS empty_vendor_name,
    SUM(PODate = '') AS empty_po_date,
    SUM(ReceivingDate = '') AS empty_receiving_date,
    SUM(InvoiceDate = '') AS empty_invoice_date,
    SUM(PayDate = '') AS empty_pay_date
FROM purchases;

SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId = '') AS empty_inventory_id,
    SUM(Description = '') AS empty_description,
    SUM(Size = '') AS empty_size,
    SUM(SalesDate = '') AS empty_sales_date,
    SUM(VendorName = '') AS empty_vendor_name
FROM sales;

SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId = '') AS empty_inventory_id,
    SUM(City = '') AS empty_city,
    SUM(Description = '') AS empty_description,
    SUM(Size = '') AS empty_size,
    SUM(startDate = '') AS empty_start_date
FROM begin_inventory;


SELECT
    COUNT(*) AS total_rows,
    SUM(InventoryId = '') AS empty_inventory_id,
    SUM(City = '') AS empty_city,
    SUM(Description = '') AS empty_description,
    SUM(Size = '') AS empty_size,
    SUM(endDate = '') AS empty_end_date
FROM end_inventory;

SELECT
    COUNT(*) AS total_rows,
    SUM(VendorName = '') AS empty_vendor_name,
    SUM(InvoiceDate = '') AS empty_invoice_date,
    SUM(PODate = '') AS empty_po_date,
    SUM(PayDate = '') AS empty_pay_date,
    SUM(Approval = '') AS empty_approval
FROM vendor_invoice;



SELECT
    COUNT(*) AS total_rows,
    SUM(PurchasePrice < 0) AS negative_purchase_price,
    SUM(PurchasePrice = 0) AS zero_purchase_price,
    SUM(Quantity < 0) AS negative_quantity,
    SUM(Quantity = 0) AS zero_quantity,
    SUM(Dollars < 0) AS negative_dollars,
    SUM(Dollars = 0) AS zero_dollars
FROM purchases;


SELECT
    COUNT(*) AS total_rows,
    SUM(SalesPrice < 0) AS negative_sales_price,
    SUM(SalesPrice = 0) AS zero_sales_price,
    SUM(SalesQuantity < 0) AS negative_sales_quantity,
    SUM(SalesQuantity = 0) AS zero_sales_quantity,
    SUM(SalesDollars < 0) AS negative_sales_dollars,
    SUM(SalesDollars = 0) AS zero_sales_dollars
FROM sales;


SELECT
    COUNT(*) AS total_rows,
    SUM(PurchasePrice < 0) AS negative_purchase_price,
    SUM(PurchasePrice = 0) AS zero_purchase_price,
    SUM(Price < 0) AS negative_price,
    SUM(Price = 0) AS zero_price
FROM purchase_prices;


SELECT
    COUNT(*) AS total_rows,
    SUM(onHand < 0) AS negative_on_hand,
    SUM(onHand = 0) AS zero_on_hand,
    SUM(Price < 0) AS negative_price,
    SUM(Price = 0) AS zero_price
FROM begin_inventory;


SELECT
    COUNT(*) AS total_rows,
    SUM(onHand < 0) AS negative_on_hand,
    SUM(onHand = 0) AS zero_on_hand,
    SUM(Price < 0) AS negative_price,
    SUM(Price = 0) AS zero_price
FROM end_inventory;



SELECT
    COUNT(*) AS total_rows,
    SUM(Freight < 0) AS negative_freight,
    SUM(Freight = 0) AS zero_freight,
    SUM(Dollars < 0) AS negative_dollars,
    SUM(Dollars = 0) AS zero_dollars
FROM vendor_invoice;


SELECT
    COUNT(*) AS unmatched_rows
FROM purchases p
LEFT JOIN purchase_prices pp
    ON p.VendorNumber = pp.VendorNumber
   AND p.Brand = pp.Brand
WHERE pp.VendorNumber IS NULL;


SELECT
    COUNT(*) AS unmatched_rows,
    COUNT(DISTINCT p.VendorNumber) AS unmatched_vendors
FROM purchases p
LEFT JOIN purchase_prices pp
    ON p.VendorNumber = pp.VendorNumber
   AND p.Brand = pp.Brand
WHERE pp.VendorNumber IS NULL;


SELECT
    p.VendorNumber,
    p.VendorName,
    COUNT(*) AS unmatched_rows
FROM purchases p
LEFT JOIN purchase_prices pp
    ON p.VendorNumber = pp.VendorNumber
   AND p.Brand = pp.Brand
WHERE pp.VendorNumber IS NULL
GROUP BY
    p.VendorNumber,
    p.VendorName
ORDER BY unmatched_rows DESC;


SELECT
    p.VendorNumber,
    p.VendorName,
    COUNT(DISTINCT p.Brand) AS unmatched_brands
FROM purchases p
LEFT JOIN purchase_prices pp
    ON p.VendorNumber = pp.VendorNumber
   AND p.Brand = pp.Brand
WHERE pp.VendorNumber IS NULL
GROUP BY
    p.VendorNumber,
    p.VendorName
ORDER BY unmatched_brands DESC;


SELECT
    COUNT(*) AS unmatched_purchase_rows,
    COUNT(DISTINCT p.PONumber) AS unmatched_po_numbers
FROM purchases p
LEFT JOIN vendor_invoice vi
    ON p.PONumber = vi.PONumber
WHERE vi.PONumber IS NULL;

SELECT
    COUNT(*) AS unmatched_price_rows,
    COUNT(DISTINCT pp.VendorNumber) AS unmatched_vendors
FROM purchase_prices pp
LEFT JOIN purchases p
    ON pp.VendorNumber = p.VendorNumber
WHERE p.VendorNumber IS NULL;

SELECT
    COUNT(*) AS unmatched_sales_rows,
    COUNT(DISTINCT s.InventoryId) AS unmatched_inventory_ids
FROM sales s
LEFT JOIN begin_inventory bi
    ON s.InventoryId = bi.InventoryId
WHERE bi.InventoryId IS NULL;


SELECT
    COUNT(*) AS unmatched_sales_rows,
    COUNT(DISTINCT s.InventoryId) AS unmatched_inventory_ids
FROM sales s
LEFT JOIN end_inventory ei
    ON s.InventoryId = ei.InventoryId
WHERE ei.InventoryId IS NULL;

SELECT
    COUNT(*) AS unmatched_begin_rows,
    COUNT(DISTINCT bi.InventoryId) AS unmatched_inventory_ids
FROM begin_inventory bi
LEFT JOIN end_inventory ei
    ON bi.InventoryId = ei.InventoryId
WHERE ei.InventoryId IS NULL;


SELECT
    COUNT(*) AS unmatched_end_rows,
    COUNT(DISTINCT ei.InventoryId) AS unmatched_inventory_ids
FROM end_inventory ei
LEFT JOIN begin_inventory bi
    ON ei.InventoryId = bi.InventoryId
WHERE bi.InventoryId IS NULL;


DESCRIBE sales;

SELECT *
FROM sales
LIMIT 5;


SELECT
    MIN(SalesDate) AS MinSalesDate,
    MAX(SalesDate) AS MaxSalesDate,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN SalesDate IS NULL OR TRIM(SalesDate) = '' THEN 1 ELSE 0 END) AS MissingSalesDate
FROM sales;


SELECT
    COUNT(*) AS TotalRows,

    SUM(CASE WHEN SalesQuantity IS NULL THEN 1 ELSE 0 END) AS NullSalesQuantity,
    SUM(CASE WHEN SalesDollars IS NULL THEN 1 ELSE 0 END) AS NullSalesDollars,
    SUM(CASE WHEN SalesPrice IS NULL THEN 1 ELSE 0 END) AS NullSalesPrice,

    SUM(CASE WHEN SalesQuantity = 0 THEN 1 ELSE 0 END) AS ZeroSalesQuantity,
    SUM(CASE WHEN SalesDollars = 0 THEN 1 ELSE 0 END) AS ZeroSalesDollars,
    SUM(CASE WHEN SalesPrice = 0 THEN 1 ELSE 0 END) AS ZeroSalesPrice,

    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars
FROM sales;


SHOW INDEX FROM sales;

SELECT
    SalesDate,
    STR_TO_DATE(SalesDate, '%Y-%m-%d') AS SalesDateConverted
FROM sales
LIMIT 10;


SHOW VARIABLES LIKE 'max_allowed_packet';
SHOW VARIABLES LIKE 'wait_timeout';

SELECT
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars
FROM sales;
SELECT COUNT(*)
FROM sales;


SELECT DISTINCT VendorNo
FROM sales
ORDER BY VendorNo;


SHOW INDEX FROM sales;

CREATE TABLE vendor_sales_summary (
    VendorNo BIGINT NOT NULL,
    VendorName TEXT,
    SalesRecords BIGINT,
    TotalSalesQuantity BIGINT,
    TotalSalesDollars DOUBLE,
    AverageSalesPrice DOUBLE,
    PRIMARY KEY (VendorNo)
);


SHOW VARIABLES
WHERE Variable_name IN (
    'innodb_buffer_pool_size',
    'tmp_table_size',
    'max_heap_table_size',
    'sort_buffer_size',
    'read_buffer_size',
    'max_execution_time'
);


SHOW TABLE STATUS LIKE 'sales';

SHOW GLOBAL STATUS LIKE 'Uptime';

SHOW PROCESSLIST;

KILL QUERY 31;
KILL QUERY 76;
KILL QUERY 84;
KILL QUERY 94;
KILL QUERY 105;

SHOW PROCESSLIST;

SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo = 2
GROUP BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (2, 60, 105, 200, 388)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    2, 60, 105, 200, 388,
    480, 516, 653, 660, 1002
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    1003, 1128, 1189, 1265, 1273,
    1392, 1439, 1485, 1587, 1590
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    1650, 1655, 1703, 2000, 2242,
    2396, 2450, 2496, 2555, 2561
)
GROUP BY VendorNo
ORDER BY VendorNo;

SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    2876, 3089, 3252, 3551, 3664,
    3924, 3950, 3951, 3960, 4380
)
GROUP BY VendorNo
ORDER BY VendorNo;



SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    4425, 4466, 4550, 4692, 4848,
    4950, 5083, 5270, 5455, 5612
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    5686, 5795, 5876, 5917, 6040,
    6152, 6222, 6240, 6267, 6285
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    5686, 5795, 5876, 5917, 6040,
    6152, 6222, 6240, 6267, 6285
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 5612
ORDER BY VendorNo
LIMIT 10;



SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    5992, 6213, 6215, 6280, 6355,
    6359, 6785, 6830, 7153, 7154
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 7154
ORDER BY VendorNo
LIMIT 10;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    7239, 7240, 7245, 7255, 7749,
    8004, 8112, 8150, 8320, 8352
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 8352
ORDER BY VendorNo
LIMIT 10;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    8663, 8664, 8673, 8735, 8892,
    8920, 9099, 9165, 9206, 9260
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 9260
ORDER BY VendorNo
LIMIT 10;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    9552, 9622, 9625, 9710, 9744,
    9751, 9815, 9819, 10000, 10050
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 10050
ORDER BY VendorNo
LIMIT 10;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    10754, 11567, 12331, 12546, 17031,
    17032, 17033, 17035, 17037, 28750
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 28750
ORDER BY VendorNo
LIMIT 10;



SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    28776, 90010, 90011, 90017, 90024,
    90026, 90027, 90032, 90033, 90034
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 90034
ORDER BY VendorNo
LIMIT 10;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    90037, 90046, 90047, 90051, 90052,
    90053, 90056, 90057, 90058, 90059
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT DISTINCT VendorNo
FROM sales
WHERE VendorNo > 90059
ORDER BY VendorNo
LIMIT 10;



SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    98450, 99166, 172662, 173357, 201359
)
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    COUNT(*) AS TotalSalesRecords,
    COUNT(DISTINCT VendorNo) AS UniqueVendors,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars
FROM sales;


SELECT
    VendorNo
FROM sales
GROUP BY VendorNo
ORDER BY VendorNo;


SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    287,
    1601
)
GROUP BY VendorNo
ORDER BY VendorNo;



SELECT
    COUNT(*) AS VendorCount,
    SUM(SalesRecords) AS TotalSalesRecords,
    SUM(TotalSalesQuantity) AS TotalSalesQuantity,
    SUM(TotalSalesDollars) AS TotalSalesDollars
FROM (
    SELECT
        VendorNo,
        COUNT(*) AS SalesRecords,
        SUM(SalesQuantity) AS TotalSalesQuantity,
        SUM(SalesDollars) AS TotalSalesDollars
    FROM sales
    GROUP BY VendorNo
) AS vendor_check;



SELECT
    SUM(CAST(SalesDollars AS DECIMAL(20,6))) AS ExactTotalSalesDollars
FROM sales;



SELECT
    SUM(TotalSalesDollars) AS AggregatedTotalSalesDollars
FROM (
    SELECT
        VendorNo,
        SUM(CAST(SalesDollars AS DECIMAL(20,6))) AS TotalSalesDollars
    FROM sales
    GROUP BY VendorNo
) AS vendor_check;


SELECT COUNT(*) AS VendorSummaryRows
FROM vendor_sales_summary;


INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    2, 60, 105, 200, 287,
    388, 480, 516, 653, 660
)
GROUP BY VendorNo;

SELECT COUNT(*) AS InsertedRows
FROM vendor_sales_summary;


INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    1002, 1003, 1128, 1189, 1265,
    1273, 1392, 1439, 1485, 1587
)
GROUP BY VendorNo;


SELECT COUNT(*) AS InsertedRows
FROM vendor_sales_summary;



-- =========================================================
-- BATCH 3
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    1590, 1601, 1650, 1655, 1703,
    2000, 2242, 2396, 2450, 2496
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 4
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    2555, 2561, 2876, 3089, 3252,
    3551, 3664, 3924, 3950, 3951
)
GROUP BY VendorNo;


SELECT COUNT(*) AS VendorSummaryRows
FROM vendor_sales_summary;



-- =========================================================
-- BATCH 5
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    3960, 4380, 4425, 4466, 4550,
    4692, 4848, 4950, 5083, 5270
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 6
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    5455, 5612, 5992, 6213, 6215,
    6280, 6355, 6359, 6785, 6830
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 7
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    7153, 7154, 7239, 7240, 7245,
    7255, 7749, 8004, 8112, 8150
)
GROUP BY VendorNo;

SELECT COUNT(*) AS VendorSummaryRows
FROM vendor_sales_summary;



-- =========================================================
-- BATCH 8
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    8320, 8352, 8663, 8664, 8673,
    8735, 8892, 8920, 9099, 9165
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 9
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    9206, 9260, 9552, 9622, 9625,
    9710, 9744, 9751, 9815, 9819
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 10
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    10000, 10050, 10754, 11567, 12331,
    12546, 17031, 17032, 17033, 17035
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 11
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    17037, 28750, 28776, 90010, 90011,
    90017, 90024, 90026, 90027, 90032
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 12
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    90033, 90034, 90037, 90046, 90047,
    90051, 90052, 90053, 90056, 90057
)
GROUP BY VendorNo;


-- =========================================================
-- BATCH 13
-- =========================================================

INSERT INTO vendor_sales_summary (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice
)
SELECT
    VendorNo,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS SalesRecords,
    SUM(SalesQuantity) AS TotalSalesQuantity,
    SUM(SalesDollars) AS TotalSalesDollars,
    AVG(SalesPrice) AS AverageSalesPrice
FROM sales
WHERE VendorNo IN (
    90058, 90059, 98450, 99166, 172662,
    173357, 201359
)
GROUP BY VendorNo;


-- =========================================================
-- FINAL ROW COUNT
-- =========================================================

SELECT COUNT(*) AS VendorSummaryRows
FROM vendor_sales_summary;


SELECT
    COUNT(*) AS VendorCount,
    SUM(SalesRecords) AS TotalSalesRecords,
    SUM(TotalSalesQuantity) AS TotalSalesQuantity,
    SUM(CAST(TotalSalesDollars AS DECIMAL(20,6))) AS TotalSalesDollars
FROM vendor_sales_summary;


SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT VendorNo) AS UniqueVendorNo
FROM vendor_sales_summary;


DESCRIBE purchases;

SELECT
    COUNT(*) AS PurchaseRows,
    COUNT(DISTINCT VendorNumber) AS UniqueVendors,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    MIN(PODate) AS MinPODate,
    MAX(PODate) AS MaxPODate
FROM purchases;



SELECT
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS NullQuantity,
    SUM(CASE WHEN Dollars IS NULL THEN 1 ELSE 0 END) AS NullDollars,
    SUM(CASE WHEN Quantity = 0 THEN 1 ELSE 0 END) AS ZeroQuantity,
    SUM(CASE WHEN Dollars = 0 THEN 1 ELSE 0 END) AS ZeroDollars,
    SUM(CASE
        WHEN PODate IS NULL OR TRIM(PODate) = ''
        THEN 1 ELSE 0
    END) AS MissingPODate
FROM purchases;


SELECT
    PODate,
    STR_TO_DATE(PODate, '%Y-%m-%d') AS PODateConverted
FROM purchases
LIMIT 10;


SELECT
    COUNT(*) AS TotalRows,
    SUM(
        CASE
            WHEN ABS(Dollars - (PurchasePrice * Quantity)) > 0.01
            THEN 1
            ELSE 0
        END
    ) AS PriceQuantityMismatch
FROM purchases;


CREATE TABLE vendor_purchase_summary (
    VendorNumber BIGINT NOT NULL,
    VendorName TEXT,
    PurchaseRecords BIGINT,
    TotalPurchaseQuantity BIGINT,
    TotalPurchaseDollars DOUBLE,
    WeightedAveragePurchasePrice DOUBLE,
    PRIMARY KEY (VendorNumber)
);


SELECT DISTINCT VendorNumber
FROM purchases
ORDER BY VendorNumber
LIMIT 10;


INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    2, 54, 60, 105, 200,
    287, 388, 480, 516, 653
)
GROUP BY VendorNumber
ORDER BY VendorNumber;

SELECT COUNT(*) AS PurchaseSummaryRows
FROM vendor_purchase_summary;

SELECT DISTINCT VendorNumber
FROM purchases
WHERE VendorNumber NOT IN (
    2, 54, 60, 105, 200,
    287, 388, 480, 516, 653
)
ORDER BY VendorNumber
LIMIT 30;

-- =========================================================
-- BATCH 2
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    660, 1003, 1128, 1189, 1265,
    1273, 1392, 1439, 1485, 1587
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 3
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    1590, 1601, 1650, 1655, 1703,
    2000, 2242, 2396, 2450, 2496
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 4
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    2555, 2561, 2876, 3089, 3252,
    3551, 3664, 3924, 3950, 3951
)
GROUP BY VendorNumber;


-- =========================================================
-- VALIDATION
-- =========================================================

SELECT COUNT(*) AS PurchaseSummaryRows
FROM vendor_purchase_summary;



SELECT DISTINCT VendorNumber
FROM purchases
WHERE VendorNumber NOT IN (
    SELECT VendorNumber
    FROM vendor_purchase_summary
)
ORDER BY VendorNumber
LIMIT 30;



-- =========================================================
-- BATCH 5
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    3960, 4380, 4425, 4466, 4550,
    4692, 4848, 4901, 4950, 5083
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 6
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    5270, 5455, 5612, 5992, 6213,
    6215, 6280, 6355, 6359, 6785
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 7
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    6830, 7153, 7154, 7239, 7240,
    7245, 7255, 7749, 8004, 8112
)
GROUP BY VendorNumber;


-- =========================================================
-- VALIDATION
-- =========================================================

SELECT COUNT(*) AS PurchaseSummaryRows
FROM vendor_purchase_summary;


SELECT DISTINCT VendorNumber
FROM purchases
WHERE VendorNumber NOT IN (
    SELECT VendorNumber
    FROM vendor_purchase_summary
)
ORDER BY VendorNumber
LIMIT 30;


-- =========================================================
-- BATCH 8
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName),
    COUNT(*),
    SUM(Quantity),
    SUM(Dollars),
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
FROM purchases
WHERE VendorNumber IN (
    8150, 8320, 8352, 8663, 8664,
    8673, 8735, 8892, 8920, 9099
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 9
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName),
    COUNT(*),
    SUM(Quantity),
    SUM(Dollars),
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
FROM purchases
WHERE VendorNumber IN (
    9165, 9206, 9260, 9552, 9622,
    9625, 9744, 9751, 9815, 9819
)
GROUP BY VendorNumber;


-- =========================================================
-- BATCH 10
-- =========================================================

INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName),
    COUNT(*),
    SUM(Quantity),
    SUM(Dollars),
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
FROM purchases
WHERE VendorNumber IN (
    10000, 10050, 10754, 11567, 12331,
    12546, 17031, 17032, 17033, 17035
)
GROUP BY VendorNumber;


-- =========================================================
-- VALIDATION
-- =========================================================

SELECT COUNT(*) AS PurchaseSummaryRows
FROM vendor_purchase_summary;


SELECT DISTINCT VendorNumber
FROM purchases
WHERE VendorNumber NOT IN (
    SELECT VendorNumber
    FROM vendor_purchase_summary
)
ORDER BY VendorNumber;


INSERT INTO vendor_purchase_summary (
    VendorNumber,
    VendorName,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    VendorNumber,
    MAX(VendorName) AS VendorName,
    COUNT(*) AS PurchaseRecords,
    SUM(Quantity) AS TotalPurchaseQuantity,
    SUM(Dollars) AS TotalPurchaseDollars,
    SUM(Dollars) / NULLIF(SUM(Quantity), 0)
        AS WeightedAveragePurchasePrice
FROM purchases
WHERE VendorNumber IN (
    17037,
    28750,
    28776,
    90010,
    90011,
    90017,
    90024,
    90026,
    90027,
    90032,
    90033,
    90037,
    90046,
    90047,
    90051,
    90052,
    90053,
    90056,
    90057,
    90058,
    90059,
    98450,
    99166,
    172662,
    173357,
    201359
)
GROUP BY VendorNumber;



SELECT
    COUNT(*) AS SummaryVendors,
    SUM(PurchaseRecords) AS SummaryPurchaseRecords,
    SUM(TotalPurchaseQuantity) AS SummaryPurchaseQuantity,
    SUM(TotalPurchaseDollars) AS SummaryPurchaseDollars
FROM vendor_purchase_summary;



SELECT
    s.VendorNo,
    s.VendorName,
    s.TotalSalesDollars,
    p.VendorNumber
FROM vendor_sales_summary s
LEFT JOIN vendor_purchase_summary p
    ON s.VendorNo = p.VendorNumber
WHERE p.VendorNumber IS NULL
ORDER BY s.VendorNo;



SELECT
    p.VendorNumber,
    p.VendorName,
    p.TotalPurchaseDollars,
    s.VendorNo
FROM vendor_purchase_summary p
LEFT JOIN vendor_sales_summary s
    ON p.VendorNumber = s.VendorNo
WHERE s.VendorNo IS NULL
ORDER BY p.VendorNumber;


SELECT
    COUNT(*) AS CommonVendors,
    SUM(s.TotalSalesDollars) AS CommonSalesDollars,
    SUM(p.TotalPurchaseDollars) AS CommonPurchaseDollars
FROM vendor_sales_summary s
INNER JOIN vendor_purchase_summary p
    ON s.VendorNo = p.VendorNumber;
    
    
    
    CREATE TABLE vendor_sales_purchase (
    VendorNo BIGINT NOT NULL,
    VendorName TEXT,
    SalesRecords BIGINT,
    TotalSalesQuantity BIGINT,
    TotalSalesDollars DOUBLE,
    AverageSalesPrice DOUBLE,
    PurchaseRecords BIGINT,
    TotalPurchaseQuantity BIGINT,
    TotalPurchaseDollars DOUBLE,
    WeightedAveragePurchasePrice DOUBLE,
    PRIMARY KEY (VendorNo)
);



INSERT INTO vendor_sales_purchase (
    VendorNo,
    VendorName,
    SalesRecords,
    TotalSalesQuantity,
    TotalSalesDollars,
    AverageSalesPrice,
    PurchaseRecords,
    TotalPurchaseQuantity,
    TotalPurchaseDollars,
    WeightedAveragePurchasePrice
)
SELECT
    s.VendorNo,
    s.VendorName,
    s.SalesRecords,
    s.TotalSalesQuantity,
    s.TotalSalesDollars,
    s.AverageSalesPrice,
    COALESCE(p.PurchaseRecords, 0),
    COALESCE(p.TotalPurchaseQuantity, 0),
    COALESCE(p.TotalPurchaseDollars, 0),
    COALESCE(p.WeightedAveragePurchasePrice, 0)
FROM vendor_sales_summary s
LEFT JOIN vendor_purchase_summary p
    ON s.VendorNo = p.VendorNumber;
    
    
    
    SELECT
    COUNT(*) AS Vendors,
    SUM(SalesRecords) AS SalesRecords,
    SUM(TotalSalesQuantity) AS TotalSalesQuantity,
    SUM(TotalSalesDollars) AS TotalSalesDollars,
    SUM(PurchaseRecords) AS PurchaseRecords,
    SUM(TotalPurchaseQuantity) AS TotalPurchaseQuantity,
    SUM(TotalPurchaseDollars) AS TotalPurchaseDollars
FROM vendor_sales_purchase;


SELECT
    SUM(SalesDollars) AS RawSalesDollars,
    (
        SELECT SUM(TotalSalesDollars)
        FROM vendor_sales_summary
    ) AS VendorSummarySalesDollars,
    SUM(SalesDollars) -
    (
        SELECT SUM(TotalSalesDollars)
        FROM vendor_sales_summary
    ) AS Difference
FROM sales;


SELECT
    SUM(TotalSalesDollars) AS VendorSummarySalesDollars,
    SUM(ROUND(TotalSalesDollars, 2)) AS RoundedVendorSalesDollars,
    SUM(TotalSalesDollars) - SUM(ROUND(TotalSalesDollars, 2)) AS PrecisionDifference
FROM vendor_sales_summary;



CREATE TABLE vendor_profitability (
    VendorNo BIGINT NOT NULL,
    VendorName TEXT,
    TotalSalesDollars DOUBLE,
    TotalPurchaseDollars DOUBLE,
    GrossProfit DOUBLE,
    ProfitMargin DOUBLE,
    PRIMARY KEY (VendorNo)
);



INSERT INTO vendor_profitability (
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    GrossProfit,
    ProfitMargin
)
SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    TotalSalesDollars - TotalPurchaseDollars AS GrossProfit,
    CASE
        WHEN TotalSalesDollars = 0 THEN NULL
        ELSE
            (TotalSalesDollars - TotalPurchaseDollars)
            / TotalSalesDollars * 100
    END AS ProfitMargin
FROM vendor_sales_purchase;



SELECT
    COUNT(*) AS Vendors,
    SUM(TotalSalesDollars) AS TotalSalesDollars,
    SUM(TotalPurchaseDollars) AS TotalPurchaseDollars,
    SUM(GrossProfit) AS TotalGrossProfit,
    MIN(ProfitMargin) AS MinProfitMargin,
    MAX(ProfitMargin) AS MaxProfitMargin
FROM vendor_profitability;




SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    GrossProfit,
    ProfitMargin
FROM vendor_profitability
ORDER BY ProfitMargin ASC
LIMIT 10;



SELECT
    COUNT(*) AS NegativeProfitVendors,
    SUM(CASE WHEN GrossProfit < 0 THEN TotalSalesDollars ELSE 0 END) AS NegativeProfitSales,
    SUM(CASE WHEN GrossProfit < 0 THEN GrossProfit ELSE 0 END) AS TotalNegativeGrossProfit,
    SUM(CASE WHEN GrossProfit < 0 THEN 1 ELSE 0 END) AS NegativeProfitCount
FROM vendor_profitability;



SELECT
    COUNT(*) AS PositiveProfitVendors,
    SUM(TotalSalesDollars) AS PositiveProfitSales,
    SUM(GrossProfit) AS TotalPositiveGrossProfit,
    AVG(ProfitMargin) AS AverageProfitMargin
FROM vendor_profitability
WHERE GrossProfit > 0;



SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    GrossProfit,
    ProfitMargin
FROM vendor_profitability
WHERE GrossProfit > 0
ORDER BY GrossProfit DESC
LIMIT 10;


SELECT
    SUM(GrossProfit) AS Top10GrossProfit,
    SUM(TotalSalesDollars) AS Top10Sales,
    (SELECT SUM(GrossProfit)
     FROM vendor_profitability
     WHERE GrossProfit > 0) AS TotalPositiveGrossProfit,
    (SELECT SUM(TotalSalesDollars)
     FROM vendor_profitability) AS TotalSales
FROM (
    SELECT
        GrossProfit,
        TotalSalesDollars
    FROM vendor_profitability
    WHERE GrossProfit > 0
    ORDER BY GrossProfit DESC
    LIMIT 10
) AS top10;



CREATE TABLE vendor_efficiency (
    VendorNo BIGINT NOT NULL,
    VendorName TEXT,
    TotalSalesDollars DOUBLE,
    TotalPurchaseDollars DOUBLE,
    GrossProfit DOUBLE,
    ProfitMargin DOUBLE,
    StockTurnover DOUBLE,
    SalesToPurchaseRatio DOUBLE,
    PRIMARY KEY (VendorNo)
);


SELECT
    COUNT(*) AS RowCount,
    COUNT(DISTINCT VendorNo) AS DistinctVendors
FROM vendor_efficiency;


SELECT
    COUNT(*) AS Vendors,
    COUNT(DISTINCT VendorNo) AS DistinctVendors,
    SUM(TotalSalesDollars) AS TotalSalesDollars,
    SUM(TotalPurchaseDollars) AS TotalPurchaseDollars,
    SUM(GrossProfit) AS TotalGrossProfit,
    MIN(StockTurnover) AS MinStockTurnover,
    MAX(StockTurnover) AS MaxStockTurnover,
    MIN(SalesToPurchaseRatio) AS MinSalesToPurchaseRatio,
    MAX(SalesToPurchaseRatio) AS MaxSalesToPurchaseRatio
FROM vendor_efficiency;


SELECT
    AVG(StockTurnover) AS MeanStockTurnover,
    AVG(SalesToPurchaseRatio) AS MeanSalesToPurchaseRatio,
    AVG(ProfitMargin) AS MeanProfitMargin
FROM vendor_efficiency;



SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    StockTurnover,
    SalesToPurchaseRatio
FROM vendor_efficiency
ORDER BY StockTurnover DESC
LIMIT 10;



SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    StockTurnover,
    SalesToPurchaseRatio
FROM vendor_efficiency
ORDER BY StockTurnover ASC
LIMIT 10;


SELECT
    COUNT(*) AS TotalVendors,
    COUNT(StockTurnover) AS VendorsWithStockTurnover,
    COUNT(SalesToPurchaseRatio) AS VendorsWithSalesPurchaseRatio,
    COUNT(*) - COUNT(StockTurnover) AS VendorsWithoutPurchaseQuantity,
    COUNT(*) - COUNT(SalesToPurchaseRatio) AS VendorsWithoutPurchaseValue
FROM vendor_efficiency;



SELECT
    VendorNo,
    VendorName,
    TotalSalesDollars,
    TotalPurchaseDollars,
    StockTurnover,
    SalesToPurchaseRatio
FROM vendor_efficiency
WHERE SalesToPurchaseRatio IS NOT NULL
ORDER BY SalesToPurchaseRatio ASC
LIMIT 10;



SELECT
    AVG(StockTurnover) AS MedianStockTurnover
FROM (
    SELECT
        StockTurnover,
        ROW_NUMBER() OVER (ORDER BY StockTurnover) AS rn,
        COUNT(*) OVER () AS cnt
    FROM vendor_efficiency
    WHERE StockTurnover IS NOT NULL
) t
WHERE rn IN (
    FLOOR((cnt + 1) / 2),
    CEIL((cnt + 1) / 2)
);

SELECT
    AVG(SalesToPurchaseRatio) AS MedianSalesToPurchaseRatio
FROM (
    SELECT
        SalesToPurchaseRatio,
        ROW_NUMBER() OVER (ORDER BY SalesToPurchaseRatio) AS rn,
        COUNT(*) OVER () AS cnt
    FROM vendor_efficiency
    WHERE SalesToPurchaseRatio IS NOT NULL
) t
WHERE rn IN (
    FLOOR((cnt + 1) / 2),
    CEIL((cnt + 1) / 2)
);




SELECT
    AVG(SalesToPurchaseRatio) AS MedianSalesToPurchaseRatio
FROM (
    SELECT
        SalesToPurchaseRatio,
        ROW_NUMBER() OVER (ORDER BY SalesToPurchaseRatio) AS rn,
        COUNT(*) OVER () AS cnt
    FROM vendor_efficiency
    WHERE SalesToPurchaseRatio IS NOT NULL
) t
WHERE rn IN (
    FLOOR((cnt + 1) / 2),
    CEIL((cnt + 1) / 2)
);



SELECT
    (
        SELECT AVG(StockTurnover)
        FROM (
            SELECT
                StockTurnover,
                ROW_NUMBER() OVER (ORDER BY StockTurnover) AS rn,
                COUNT(*) OVER () AS cnt
            FROM vendor_efficiency
            WHERE StockTurnover IS NOT NULL
        ) x
        WHERE rn IN (
            FLOOR((cnt + 1) / 2),
            CEIL((cnt + 1) / 2)
        )
    ) AS MedianStockTurnover,

    (
        SELECT AVG(SalesToPurchaseRatio)
        FROM (
            SELECT
                SalesToPurchaseRatio,
                ROW_NUMBER() OVER (ORDER BY SalesToPurchaseRatio) AS rn,
                COUNT(*) OVER () AS cnt
            FROM vendor_efficiency
            WHERE SalesToPurchaseRatio IS NOT NULL
        ) y
        WHERE rn IN (
            FLOOR((cnt + 1) / 2),
            CEIL((cnt + 1) / 2)
        )
    ) AS MedianSalesToPurchaseRatio;
    
    
    
    SELECT
    CASE
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'High Efficiency'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Low Efficiency'
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Mixed - Higher Turnover'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Mixed - Higher Sales Conversion'
        ELSE 'Undefined'
    END AS EfficiencySegment,
    COUNT(*) AS VendorCount
FROM vendor_efficiency
GROUP BY EfficiencySegment
ORDER BY VendorCount DESC;



SELECT
    CASE
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'High Efficiency'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Low Efficiency'
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Mixed - Higher Turnover'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Mixed - Higher Sales Conversion'
        ELSE 'Undefined'
    END AS EfficiencySegment,

    COUNT(*) AS VendorCount,
    SUM(TotalSalesDollars) AS TotalSalesDollars,
    SUM(GrossProfit) AS TotalGrossProfit,
    AVG(ProfitMargin) AS AverageProfitMargin,
    AVG(StockTurnover) AS AverageStockTurnover,
    AVG(SalesToPurchaseRatio) AS AverageSalesToPurchaseRatio

FROM vendor_efficiency

GROUP BY EfficiencySegment

ORDER BY TotalGrossProfit DESC;




SELECT
    CASE
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'High Efficiency'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Low Efficiency'
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Mixed - Higher Turnover'
        WHEN StockTurnover < 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Mixed - Higher Sales Conversion'
        ELSE 'Undefined'
    END AS EfficiencySegment,

    COUNT(*) AS VendorCount,
    AVG(ProfitMargin) AS AverageProfitMargin,

    (
        SELECT AVG(x.ProfitMargin)
        FROM (
            SELECT
                ProfitMargin,
                ROW_NUMBER() OVER (
                    ORDER BY ProfitMargin
                ) AS rn,
                COUNT(*) OVER () AS cnt
            FROM vendor_efficiency v2
            WHERE v2.StockTurnover IS NOT NULL
              AND
              CASE
                  WHEN v2.StockTurnover >= 0.96965
                       AND v2.SalesToPurchaseRatio >= 1.3719834442
                      THEN 'High Efficiency'
                  WHEN v2.StockTurnover < 0.96965
                       AND v2.SalesToPurchaseRatio < 1.3719834442
                      THEN 'Low Efficiency'
                  WHEN v2.StockTurnover >= 0.96965
                       AND v2.SalesToPurchaseRatio < 1.3719834442
                      THEN 'Mixed - Higher Turnover'
                  ELSE 'Mixed - Higher Sales Conversion'
              END =
              CASE
                  WHEN StockTurnover >= 0.96965
                       AND SalesToPurchaseRatio >= 1.3719834442
                      THEN 'High Efficiency'
                  WHEN StockTurnover < 0.96965
                       AND SalesToPurchaseRatio < 1.3719834442
                      THEN 'Low Efficiency'
                  WHEN StockTurnover >= 0.96965
                       AND SalesToPurchaseRatio < 1.3719834442
                      THEN 'Mixed - Higher Turnover'
                  ELSE 'Mixed - Higher Sales Conversion'
              END
        ) x
        WHERE x.rn IN (
            FLOOR((x.cnt + 1) / 2),
            CEIL((x.cnt + 1) / 2)
        )
    ) AS MedianProfitMargin

FROM vendor_efficiency
GROUP BY EfficiencySegment
ORDER BY VendorCount DESC;



WITH segmented AS (
    SELECT
        VendorNo,
        ProfitMargin,
        CASE
            WHEN StockTurnover >= 0.96965
                 AND SalesToPurchaseRatio >= 1.3719834442
                THEN 'High Efficiency'

            WHEN StockTurnover < 0.96965
                 AND SalesToPurchaseRatio < 1.3719834442
                THEN 'Low Efficiency'

            WHEN StockTurnover >= 0.96965
                 AND SalesToPurchaseRatio < 1.3719834442
                THEN 'Mixed - Higher Turnover'

            WHEN StockTurnover < 0.96965
                 AND SalesToPurchaseRatio >= 1.3719834442
                THEN 'Mixed - Higher Sales Conversion'

            ELSE 'Undefined'
        END AS EfficiencySegment
    FROM vendor_efficiency
),

ranked AS (
    SELECT
        EfficiencySegment,
        ProfitMargin,
        ROW_NUMBER() OVER (
            PARTITION BY EfficiencySegment
            ORDER BY ProfitMargin
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY EfficiencySegment
        ) AS cnt
    FROM segmented
    WHERE ProfitMargin IS NOT NULL
)

SELECT
    EfficiencySegment,
    COUNT(*) AS VendorCount,
    AVG(ProfitMargin) AS AverageProfitMargin,
    AVG(
        CASE
            WHEN rn IN (
                FLOOR((cnt + 1) / 2),
                CEIL((cnt + 1) / 2)
            )
            THEN ProfitMargin
        END
    ) AS MedianProfitMargin
FROM ranked
GROUP BY EfficiencySegment
ORDER BY VendorCount DESC;



SELECT
    COUNT(*) AS TotalVendors,
    COUNT(DISTINCT VendorNo) AS DistinctVendors,

    MIN(TotalSalesDollars) AS MinSales,
    MAX(TotalSalesDollars) AS MaxSales,

    MIN(GrossProfit) AS MinGrossProfit,
    MAX(GrossProfit) AS MaxGrossProfit,

    MIN(ProfitMargin) AS MinProfitMargin,
    MAX(ProfitMargin) AS MaxProfitMargin,

    MIN(StockTurnover) AS MinStockTurnover,
    MAX(StockTurnover) AS MaxStockTurnover,

    MIN(SalesToPurchaseRatio) AS MinSalesToPurchaseRatio,
    MAX(SalesToPurchaseRatio) AS MaxSalesToPurchaseRatio

FROM vendor_efficiency;



SELECT
    AVG(TotalSalesDollars) AS AverageSales,
    AVG(GrossProfit) AS AverageGrossProfit,
    AVG(ProfitMargin) AS AverageProfitMargin
FROM vendor_efficiency;



SELECT
    AVG(TotalSalesDollars) AS MedianSales,
    AVG(GrossProfit) AS MedianGrossProfit,
    AVG(ProfitMargin) AS MedianProfitMargin
FROM (
    SELECT
        TotalSalesDollars,
        GrossProfit,
        ProfitMargin,

        ROW_NUMBER() OVER (
            ORDER BY TotalSalesDollars
        ) AS rn_sales,

        ROW_NUMBER() OVER (
            ORDER BY GrossProfit
        ) AS rn_profit,

        ROW_NUMBER() OVER (
            ORDER BY ProfitMargin
        ) AS rn_margin,

        COUNT(*) OVER () AS cnt
    FROM vendor_efficiency
) t
WHERE
    rn_sales IN (
        FLOOR((cnt + 1) / 2),
        CEIL((cnt + 1) / 2)
    )
    OR
    rn_profit IN (
        FLOOR((cnt + 1) / 2),
        CEIL((cnt + 1) / 2)
    )
    OR
    rn_margin IN (
        FLOOR((cnt + 1) / 2),
        CEIL((cnt + 1) / 2)
    );
    
    
    
    
    SELECT
    CASE
        WHEN TotalSalesDollars >= 894436.2466666977
            THEN 'High Sales'
        ELSE 'Low Sales'
    END AS SalesScale,

    CASE
        WHEN ProfitMargin >= 0.23116187641111978
            THEN 'High Margin'
        ELSE 'Low Margin'
    END AS Profitability,

    CASE
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Efficient'
        WHEN StockTurnover IS NULL
             OR SalesToPurchaseRatio IS NULL
            THEN 'Undefined'
        ELSE 'Less Efficient'
    END AS OperationalEfficiency,

    COUNT(*) AS VendorCount

FROM vendor_efficiency

GROUP BY
    SalesScale,
    Profitability,
    OperationalEfficiency

ORDER BY VendorCount DESC;




SELECT
    CASE
        WHEN TotalSalesDollars >= 894436.2466666977
            THEN 'High Sales'
        ELSE 'Low Sales'
    END AS SalesScale,

    CASE
        WHEN ProfitMargin >= 0.23116187641111978
            THEN 'High Margin'
        ELSE 'Low Margin'
    END AS Profitability,

    CASE
        WHEN StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Efficient'
        WHEN StockTurnover IS NULL
             OR SalesToPurchaseRatio IS NULL
            THEN 'Undefined'
        ELSE 'Less Efficient'
    END AS OperationalEfficiency,

    COUNT(*) AS VendorCount,
    SUM(TotalSalesDollars) AS TotalSalesDollars,
    SUM(GrossProfit) AS TotalGrossProfit,
    AVG(ProfitMargin) AS AverageProfitMargin

FROM vendor_efficiency

GROUP BY
    SalesScale,
    Profitability,
    OperationalEfficiency

ORDER BY TotalSalesDollars DESC;




SELECT
    CASE
        WHEN TotalSalesDollars >= 894436.2466666977
             AND ProfitMargin >= 0.23116187641111978
             AND StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Top Performer'

        WHEN TotalSalesDollars >= 894436.2466666977
             AND ProfitMargin >= 0.23116187641111978
             AND (
                 StockTurnover < 0.96965
                 OR SalesToPurchaseRatio < 1.3719834442
             )
            THEN 'High-Value Efficiency Opportunity'

        WHEN TotalSalesDollars < 894436.2466666977
             AND ProfitMargin >= 0.23116187641111978
             AND StockTurnover >= 0.96965
             AND SalesToPurchaseRatio >= 1.3719834442
            THEN 'Growth Opportunity'

        WHEN TotalSalesDollars < 894436.2466666977
             AND ProfitMargin >= 0.23116187641111978
             AND (
                 StockTurnover < 0.96965
                 OR SalesToPurchaseRatio < 1.3719834442
             )
            THEN 'Development / Improvement'

        WHEN TotalSalesDollars < 894436.2466666977
             AND ProfitMargin < 0.23116187641111978
             AND StockTurnover < 0.96965
             AND SalesToPurchaseRatio < 1.3719834442
            THEN 'Performance Risk'

        ELSE 'Unclassified'
    END AS PerformanceSegment,

    COUNT(*) AS VendorCount,
    SUM(TotalSalesDollars) AS TotalSales,
    SUM(GrossProfit) AS TotalGrossProfit,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM vendor_efficiency),
        2
    ) AS VendorSharePercent,

    ROUND(
        SUM(TotalSalesDollars) * 100.0 /
        (SELECT SUM(TotalSalesDollars) FROM vendor_efficiency),
        2
    ) AS SalesSharePercent,

    ROUND(
        SUM(GrossProfit) * 100.0 /
        (SELECT SUM(GrossProfit) FROM vendor_efficiency),
        2
    ) AS GrossProfitSharePercent

FROM vendor_efficiency

GROUP BY PerformanceSegment

ORDER BY TotalSales DESC;