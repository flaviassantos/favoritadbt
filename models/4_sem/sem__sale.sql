With final As (
    Select
        sale_id As "Sale id",
        product_id As "Product id",
        store_id As "Store id",
        product_family_code As "Product family",
        sale_order_number As "Sales order number",
        sale_date As "Date",
        sale_qty As "Quantity",
        on_promotion As "Promotion",
        sale_status As "Status",
        source_data As "Source"
    From {{ ref('mart__fact_sale') }}
)

Select * From final
