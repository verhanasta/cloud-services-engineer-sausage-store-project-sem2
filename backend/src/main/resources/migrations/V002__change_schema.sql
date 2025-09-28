ALTER TABLE product
    ADD COLUMN price double precision,
    ADD PRIMARY KEY (id);

ALTER TABLE orders
    ADD COLUMN date_created date DEFAULT current_date,
    ADD PRIMARY KEY (id);

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_order
        FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_order_product_product
        FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;

DROP TABLE IF EXISTS orders_date;
DROP TABLE IF EXISTS product_info;