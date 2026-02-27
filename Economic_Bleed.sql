SELECT 
    order_id,
    category_name,
    product_name,
    order_item_total AS order_value,
    shipping_mode,
    days_for_shipping_real,
    days_for_shipment_scheduled,
    (days_for_shipping_real - days_for_shipment_scheduled) AS days_late,  -- Late Window
    CASE 
        WHEN category_name LIKE '%Electronics%' OR category_name LIKE '%Tech%' THEN 5.0
        WHEN category_name LIKE '%Industrial%' OR category_name LIKE '%Garden%' THEN 3.0
        ELSE 1.0 
    END AS part_criticality, --Define Manufacturing Criticality
    ROUND(
        ((days_for_shipping_real - days_for_shipment_scheduled) * 300) + 
        ((days_for_shipping_real - days_for_shipment_scheduled) * (order_item_total * 0.02) * CASE 
                WHEN category_name LIKE '%Electronics%' OR category_name LIKE '%Tech%' THEN 5.0
                WHEN category_name LIKE '%Industrial%' OR category_name LIKE '%Garden%' THEN 3.0
                ELSE 1.0 
            END
        ), 2) AS production_loss_usd -- Financial Impact ($) Logic: $300 fixed daily labor loss + 2% of order value per day late scaled by criticality
FROM SupplyChain
WHERE delivery_status = 'Late delivery' 
  AND days_for_shipping_real > days_for_shipment_scheduled;