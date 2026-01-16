--correct sequence for creating table
--1.  BRANDS
--2.  SELLERS
--3.  CATEGORIES
--4.  USERS
--5.  USER_ADDRESSES
--6.  PRODUCTS
--7.  PRODUCT_IMAGES
--8.  PRODUCT_VARIANTS
--9.  OFFERS
--10. PRODUCT_OFFERS
--11. WISHLIST
--12. WISHLIST_ITEMS
--13. CART
--14. CART_ITEMS
--15. ORDERS
--16. ORDER_ITEMS
--17. PAYMENTS
--18. SHIPMENT
--19. REFUNDS
--20. REVIEWS


-----------------------oracle---------------------------


--1. BRANDS
CREATE TABLE brands (
    brand_id NUMBER PRIMARY KEY,
    brand_name VARCHAR2(200) UNIQUE
);

CREATE SEQUENCE brands_seq START WITH 1;
CREATE OR REPLACE TRIGGER brands_trg
BEFORE INSERT ON brands
FOR EACH ROW
BEGIN
    IF :NEW.brand_id IS NULL THEN
        SELECT brands_seq.NEXTVAL INTO :NEW.brand_id FROM dual;
    END IF;
END;
/

--2. SELLERS
CREATE TABLE sellers (
    seller_id NUMBER PRIMARY KEY,
    seller_name VARCHAR2(200),
    email VARCHAR2(200),
    phone VARCHAR2(15),
    gst_number VARCHAR2(30),
    address CLOB,
    rating NUMBER(3,2) DEFAULT 0
);

CREATE SEQUENCE sellers_seq START WITH 1;
CREATE OR REPLACE TRIGGER sellers_trg
BEFORE INSERT ON sellers
FOR EACH ROW
BEGIN
    IF :NEW.seller_id IS NULL THEN
        SELECT sellers_seq.NEXTVAL INTO :NEW.seller_id FROM dual;
    END IF;
END;
/

--3. CATEGORIES (Self Reference)
CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(200),
    parent_id NUMBER,
    CONSTRAINT fk_cat_parent FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);

CREATE SEQUENCE categories_seq START WITH 1;
CREATE OR REPLACE TRIGGER categories_trg
BEFORE INSERT ON categories
FOR EACH ROW
BEGIN
    IF :NEW.category_id IS NULL THEN
        SELECT categories_seq.NEXTVAL INTO :NEW.category_id FROM dual;
    END IF;
END;
/

--4. USERS
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(200),
    address VARCHAR2(200),
    email VARCHAR2(200) UNIQUE,
    phone VARCHAR2(15) UNIQUE,
    password_hash VARCHAR2(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE users_seq START WITH 1;
CREATE OR REPLACE TRIGGER users_trg
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF :NEW.user_id IS NULL THEN
        SELECT users_seq.NEXTVAL INTO :NEW.user_id FROM dual;
    END IF;
END;
/

--5. USER ADDRESSES
CREATE TABLE user_addresses (
    address_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    name VARCHAR2(200),
    phone VARCHAR2(15),
    pincode VARCHAR2(10),
    address_line CLOB,
    city VARCHAR2(100),
    state VARCHAR2(100),
    landmark VARCHAR2(200),
    type VARCHAR2(10) CHECK (type IN ('home','work','other')),
    CONSTRAINT fk_addr_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE SEQUENCE user_addresses_seq START WITH 1;
CREATE OR REPLACE TRIGGER user_addresses_trg
BEFORE INSERT ON user_addresses
FOR EACH ROW
BEGIN
    IF :NEW.address_id IS NULL THEN
        SELECT user_addresses_seq.NEXTVAL INTO :NEW.address_id FROM dual;
    END IF;
END;
/

--6. PRODUCTS
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    seller_id NUMBER,
    brand_id NUMBER,
    category_id NUMBER,
    product_name VARCHAR2(300),
    description CLOB,
    mrp NUMBER(10,2),
    price NUMBER(10,2),
    stock NUMBER DEFAULT 0,
    rating NUMBER(3,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_prod_seller FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    CONSTRAINT fk_prod_brand FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    CONSTRAINT fk_prod_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE SEQUENCE products_seq START WITH 1;
CREATE OR REPLACE TRIGGER products_trg
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF :NEW.product_id IS NULL THEN
        SELECT products_seq.NEXTVAL INTO :NEW.product_id FROM dual;
    END IF;
END;
/

--7. PRODUCT IMAGES
CREATE TABLE product_images (
    id NUMBER PRIMARY KEY,
    product_id NUMBER,
    image_url CLOB,
    CONSTRAINT fk_img_prod FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE SEQUENCE product_images_seq START WITH 1;
CREATE OR REPLACE TRIGGER product_images_trg
BEFORE INSERT ON product_images
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT product_images_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

--8. PRODUCT VARIANTS
CREATE TABLE product_variants (
    variant_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    color VARCHAR2(50),
    size_name VARCHAR2(50),   -- FIXED
    extra_price NUMBER(10,2) DEFAULT 0,
    stock NUMBER,
    CONSTRAINT fk_var_prod FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE SEQUENCE product_variants_seq START WITH 1;
CREATE OR REPLACE TRIGGER product_variants_trg
BEFORE INSERT ON product_variants
FOR EACH ROW
BEGIN
    IF :NEW.variant_id IS NULL THEN
        SELECT product_variants_seq.NEXTVAL INTO :NEW.variant_id FROM dual;
    END IF;
END;
/


--9. OFFERS
CREATE TABLE offers (
    offer_id NUMBER PRIMARY KEY,
    title VARCHAR2(200),
    discount_type VARCHAR2(10) CHECK (discount_type IN ('flat','percent')),
    discount_value NUMBER(10,2),
    start_date DATE,
    end_date DATE
);

CREATE SEQUENCE offers_seq START WITH 1;
CREATE OR REPLACE TRIGGER offers_trg
BEFORE INSERT ON offers
FOR EACH ROW
BEGIN
    IF :NEW.offer_id IS NULL THEN
        SELECT offers_seq.NEXTVAL INTO :NEW.offer_id FROM dual;
    END IF;
END;
/

--10. PRODUCT OFFERS
CREATE TABLE product_offers (
    id NUMBER PRIMARY KEY,
    product_id NUMBER,
    offer_id NUMBER,
    CONSTRAINT fk_po_prod FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_po_offer FOREIGN KEY (offer_id) REFERENCES offers(offer_id)
);

CREATE SEQUENCE product_offers_seq START WITH 1;
CREATE OR REPLACE TRIGGER product_offers_trg
BEFORE INSERT ON product_offers
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT product_offers_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- 11. WISHLIST
CREATE TABLE wishlist (
    wishlist_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_wishlist_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE SEQUENCE wishlist_seq START WITH 1;

CREATE OR REPLACE TRIGGER wishlist_trg
BEFORE INSERT ON wishlist
FOR EACH ROW
BEGIN
    IF :NEW.wishlist_id IS NULL THEN
        SELECT wishlist_seq.NEXTVAL INTO :NEW.wishlist_id FROM dual;
    END IF;
END;
/

-- 12. WISHLIST ITEMS
CREATE TABLE wishlist_items (
    id NUMBER PRIMARY KEY,
    wishlist_id NUMBER,
    product_id NUMBER,
    CONSTRAINT fk_wi_wishlist FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id),
    CONSTRAINT fk_wi_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE SEQUENCE wishlist_items_seq START WITH 1;

CREATE OR REPLACE TRIGGER wishlist_items_trg
BEFORE INSERT ON wishlist_items
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT wishlist_items_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- 13. CART
CREATE TABLE cart (
    cart_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE SEQUENCE cart_seq START WITH 1;

CREATE OR REPLACE TRIGGER cart_trg
BEFORE INSERT ON cart
FOR EACH ROW
BEGIN
    IF :NEW.cart_id IS NULL THEN
        SELECT cart_seq.NEXTVAL INTO :NEW.cart_id FROM dual;
    END IF;
END;
/

-- 14. CART ITEMS
CREATE TABLE cart_items (
    cart_item_id NUMBER PRIMARY KEY,
    cart_id NUMBER,
    product_id NUMBER,
    variant_id NUMBER,
    quantity NUMBER DEFAULT 1,
    CONSTRAINT fk_ci_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    CONSTRAINT fk_ci_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_ci_variant FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

CREATE SEQUENCE cart_items_seq START WITH 1;

CREATE OR REPLACE TRIGGER cart_items_trg
BEFORE INSERT ON cart_items
FOR EACH ROW
BEGIN
    IF :NEW.cart_item_id IS NULL THEN
        SELECT cart_items_seq.NEXTVAL INTO :NEW.cart_item_id FROM dual;
    END IF;
END;
/

--15. ORDERS
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    address_id NUMBER,
    total_amount NUMBER(10,2),
    order_status VARCHAR2(20) CHECK (order_status IN ('placed','confirmed','packed','shipped','delivered','cancelled','returned')),
    payment_status VARCHAR2(10) CHECK (payment_status IN ('pending','paid','failed')),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (address_id) REFERENCES user_addresses(address_id)
);

CREATE SEQUENCE orders_seq START WITH 1;
CREATE OR REPLACE TRIGGER orders_trg
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF :NEW.order_id IS NULL THEN
        SELECT orders_seq.NEXTVAL INTO :NEW.order_id FROM dual;
    END IF;
END;
/

--16. ORDER ITEMS
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    variant_id NUMBER,
    quantity NUMBER,
    price NUMBER(10,2),
    CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_oi_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_oi_variant FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

CREATE SEQUENCE order_items_seq START WITH 1;

CREATE OR REPLACE TRIGGER order_items_trg
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
    IF :NEW.order_item_id IS NULL THEN
        SELECT order_items_seq.NEXTVAL INTO :NEW.order_item_id FROM dual;
    END IF;
END;
/

-- 17. PAYMENTS
CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_mode VARCHAR2(20) CHECK (payment_mode IN ('cod','upi','card','netbanking')),
    transaction_id VARCHAR2(200),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) CHECK (status IN ('success','failed','pending')),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE SEQUENCE payments_seq START WITH 1;

CREATE OR REPLACE TRIGGER payments_trg
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
    IF :NEW.payment_id IS NULL THEN
        SELECT payments_seq.NEXTVAL INTO :NEW.payment_id FROM dual;
    END IF;
END;
/

-- 18. SHIPMENT
CREATE TABLE shipment (
    shipment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    courier_name VARCHAR2(200),
    tracking_number VARCHAR2(200),
    shipped_date TIMESTAMP,
    delivery_date TIMESTAMP,
    status VARCHAR2(30) CHECK (status IN ('shipped','in_transit','out_for_delivery','delivered','lost','returned')),
    CONSTRAINT fk_ship_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE SEQUENCE shipment_seq START WITH 1;

CREATE OR REPLACE TRIGGER shipment_trg
BEFORE INSERT ON shipment
FOR EACH ROW
BEGIN
    IF :NEW.shipment_id IS NULL THEN
        SELECT shipment_seq.NEXTVAL INTO :NEW.shipment_id FROM dual;
    END IF;
END;
/

--19. REFUNDS
CREATE TABLE refunds (
    refund_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    refund_amount NUMBER(10,2),
    refund_reason VARCHAR2(255),
    refund_status VARCHAR2(30) DEFAULT 'Pending',
    refund_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_refund_order FOREIGN KEY (order_id)
    REFERENCES orders(order_id) ON DELETE CASCADE
);

CREATE SEQUENCE refunds_seq START WITH 1;
CREATE OR REPLACE TRIGGER refunds_trg
BEFORE INSERT ON refunds
FOR EACH ROW
BEGIN
    IF :NEW.refund_id IS NULL THEN
        SELECT refunds_seq.NEXTVAL INTO :NEW.refund_id FROM dual;
    END IF;
END;
/

-- 20. REVIEWS
CREATE TABLE reviews (
    review_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    user_id NUMBER,
    rating NUMBER CHECK (rating BETWEEN 1 AND 5),
    review_text CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE SEQUENCE reviews_seq START WITH 1;

CREATE OR REPLACE TRIGGER reviews_trg
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF :NEW.review_id IS NULL THEN
        SELECT reviews_seq.NEXTVAL INTO :NEW.review_id FROM dual;
    END IF;
END;
/




----------------------mysql-------------------------------


----1. BRAND TABLE
--CREATE TABLE brands (
--    brand_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
--    brand_name    VARCHAR(200) UNIQUE
--);
--
----2. SELLERS TABLE
--CREATE TABLE sellers (
--    seller_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
--    seller_name   VARCHAR(200),
--    email         VARCHAR(200),
--    phone         VARCHAR(15),
--    gst_number    VARCHAR(30),
--    address       TEXT,
--    rating        DECIMAL(3,2) DEFAULT 0
--);
--
----3. CATEGORY TABLE (MULTI-LEVEL)
--CREATE TABLE categories (
--    category_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
--    category_name          VARCHAR(200),
--    parent_id     BIGINT,
--    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
--);
--
----4. PRODUCTS TABLE
--CREATE TABLE products (
--    product_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
--    seller_id       BIGINT,
--    brand_id        BIGINT,
--    category_id     BIGINT,
--    product_name          VARCHAR(300),
--    description     TEXT,
--    mrp             DECIMAL(10,2),
--    price           DECIMAL(10,2),
--    stock           INT DEFAULT 0,
--    rating          DECIMAL(3,2) DEFAULT 0,
--    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
--    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
--    FOREIGN KEY (category_id) REFERENCES categories(category_id)
--);
--
----5. PRODUCT IMAGES
--CREATE TABLE product_images (
--    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
--    product_id   BIGINT,
--    image_url    TEXT,
--    FOREIGN KEY (product_id) REFERENCES products(product_id)
--);
--
----6. PRODUCT OFFERS / DISCOUNTS
--CREATE TABLE offers (
--    offer_id       BIGINT PRIMARY KEY AUTO_INCREMENT,
--    title          VARCHAR(200),
--    discount_type  ENUM('flat','percent'),
--    discount_value DECIMAL(10,2),
--    start_date     DATE,
--    end_date       DATE
--);
--
----7. PRODUCT_OFFERS
--CREATE TABLE product_offers (
--    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
--    product_id   BIGINT,
--    offer_id     BIGINT,
--    FOREIGN KEY (product_id) REFERENCES products(product_id),
--    FOREIGN KEY (offer_id) REFERENCES offers(offer_id)
--);
--
----8. PRODUCT VARIANTS (Size/Color etc.)
--CREATE TABLE product_variants (
--    variant_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
--    product_id      BIGINT,
--    color           VARCHAR(50),
--    size            VARCHAR(50),
--    extra_price     DECIMAL(10,2) DEFAULT 0,
--    stock           INT,
--    FOREIGN KEY (product_id) REFERENCES products(product_id)
--);
--
----9. USERS TABLE
--CREATE TABLE users (
--    user_id        BIGINT PRIMARY KEY AUTO_INCREMENT,
--    name           VARCHAR(200),
--    address           VARCHAR(200)
--    email          VARCHAR(200) UNIQUE,
--    phone          VARCHAR(15) UNIQUE,
--    password_hash  VARCHAR(255),
--    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
--);
--
----10. WISHLIST
--CREATE TABLE wishlist (
--    wishlist_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
--    user_id       BIGINT,
--    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (user_id) REFERENCES users(user_id)
--);
--
----11. WISHLIST ITEMS
--CREATE TABLE wishlist_items (
--    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
--    wishlist_id  BIGINT,
--    product_id   BIGINT,
--    FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id),
--    FOREIGN KEY (product_id) REFERENCES products(product_id)
--);
--
----12. ORDERS TABLE
--CREATE TABLE orders (
--    order_id        BIGINT PRIMARY KEY AUTO_INCREMENT,
--    user_id         BIGINT,
--    address_id      BIGINT,
--    total_amount    DECIMAL(10,2),
--    order_status    ENUM('placed','confirmed','packed','shipped','delivered','cancelled','returned'),
--    payment_status  ENUM('pending','paid','failed'),
--    order_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (user_id) REFERENCES users(user_id),
--    FOREIGN KEY (address_id) REFERENCES user_addresses(address_id)
--);
--
----13. ORDER ITEMS
--CREATE TABLE order_items (
--    order_item_id  BIGINT PRIMARY KEY AUTO_INCREMENT,
--    order_id       BIGINT,
--    product_id     BIGINT,
--    variant_id     BIGINT,
--    quantity       INT,
--    price          DECIMAL(10,2),
--    FOREIGN KEY (order_id) REFERENCES orders(order_id),
--    FOREIGN KEY (product_id) REFERENCES products(product_id),
--    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
--);
--
----14. PAYMENT TABLE
--CREATE TABLE payments (
--    payment_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
--    order_id        BIGINT,
--    payment_mode    ENUM('cod','upi','card','netbanking'),
--    transaction_id  VARCHAR(200),
--    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    status          ENUM('success','failed','pending'),
--    FOREIGN KEY (order_id) REFERENCES orders(order_id)
--);
--
----15. SHIPMENTS / DELIVERY
--CREATE TABLE shipment (
--    shipment_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
--    order_id         BIGINT,
--    courier_name     VARCHAR(200),
--    tracking_number  VARCHAR(200),
--    shipped_date     TIMESTAMP NULL,
--    delivery_date    TIMESTAMP NULL,
--    status           ENUM('shipped','in_transit','out_for_delivery','delivered','lost','returned'),
--    FOREIGN KEY (order_id) REFERENCES orders(order_id)
--);
--
----16. REFUND TABLE
--CREATE TABLE refunds (
--    refund_id     INT PRIMARY KEY AUTO_INCREMENT,
--    order_id      INT NOT NULL,
--    refund_amount DECIMAL(10,2) NOT NULL,
--    refund_reason VARCHAR(255),
--    refund_status VARCHAR(30) DEFAULT 'Pending',
--
--    refund_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--
--    CONSTRAINT fk_refund_order
--        FOREIGN KEY (order_id)
--        REFERENCES orders(order_id)
--        ON DELETE CASCADE
--);
--
----17. ADDRESS TABLE
--CREATE TABLE user_addresses (
--    address_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
--    user_id        BIGINT,
--    name           VARCHAR(200),
--    phone          VARCHAR(15),
--    pincode        VARCHAR(10),
--    address_line   TEXT,
--    city           VARCHAR(100),
--    state          VARCHAR(100),
--    landmark       VARCHAR(200),
--    type           ENUM('home','work','other'),
--    FOREIGN KEY (user_id) REFERENCES users(user_id)
--);
--
----18. CART TABLE
--CREATE TABLE cart (
--    cart_id       BIGINT PRIMARY KEY AUTO_INCREMENT,
--    user_id       BIGINT,
--    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (user_id) REFERENCES users(user_id)
--);
--
----19. CART ITEMS
--CREATE TABLE cart_items (
--    cart_item_id BIGINT PRIMARY KEY AUTO_INCREMENT,
--    cart_id      BIGINT,
--    product_id   BIGINT,
--    variant_id   BIGINT,
--    quantity     INT DEFAULT 1,
--    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
--    FOREIGN KEY (product_id) REFERENCES products(product_id),
--    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
--);
--
----20. PRODUCT REVIEWS
--CREATE TABLE reviews (
--    review_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
--    product_id    BIGINT,
--    user_id       BIGINT,
--    rating        INT CHECK (rating BETWEEN 1 AND 5),
--    review_text   TEXT,
--    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (product_id) REFERENCES products(product_id),
--    FOREIGN KEY (user_id) REFERENCES users(user_id)
--);
--
--
--
--
--
--
--
