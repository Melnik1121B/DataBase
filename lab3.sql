CREATE OR REPLACE PROCEDURE AggregateOrders()
LANGUAGE plpgsql
AS $$
DECLARE
    order_rec RECORD;
BEGIN
    FOR order_rec IN SELECT crop_id, COUNT(*) AS num_orders FROM Orders GROUP BY crop_id LOOP
        RAISE NOTICE 'Культура с ID % имеет % заказов', order_rec.crop_id, order_rec.num_orders;
    END LOOP;
END;
$$;