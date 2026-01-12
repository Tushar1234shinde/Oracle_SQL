--BRAND TABLE
CREATE TABLE brands (
    brand_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    brand_name    VARCHAR(200) UNIQUE
);

--SELLERS TABLE
CREATE TABLE sellers (
    seller_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    seller_name   VARCHAR(200),
    email         VARCHAR(200),
    phone         VARCHAR(15),
    gst_number    VARCHAR(30),
    address       TEXT,
    rating        DECIMAL(3,2) DEFAULT 0
);

--CATEGORY TABLE (MULTI-LEVEL)
CREATE TABLE categories (
    category_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    category_name          VARCHAR(200),
    parent_id     BIGINT,
    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);

--PRODUCTS TABLE
CREATE TABLE products (
    product_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    seller_id       BIGINT,
    brand_id        BIGINT,
    category_id     BIGINT,
    product_name          VARCHAR(300),
    description     TEXT,
    mrp             DECIMAL(10,2),
    price           DECIMAL(10,2),
    stock           INT DEFAULT 0,
    rating          DECIMAL(3,2) DEFAULT 0,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

--PRODUCT IMAGES
CREATE TABLE product_images (
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id   BIGINT,
    image_url    TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--OFFERS / DISCOUNTS
CREATE TABLE offers (
    offer_id       BIGINT PRIMARY KEY AUTO_INCREMENT,
    title          VARCHAR(200),
    discount_type  ENUM('flat','percent'),
    discount_value DECIMAL(10,2),
    start_date     DATE,
    end_date       DATE
);

CREATE TABLE product_offers (
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id   BIGINT,
    offer_id     BIGINT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (offer_id) REFERENCES offers(offer_id)
);

--PRODUCT VARIANTS (Size/Color etc.)
CREATE TABLE product_variants (
    variant_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id      BIGINT,
    color           VARCHAR(50),
    size            VARCHAR(50),
    extra_price     DECIMAL(10,2) DEFAULT 0,
    stock           INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--USERS TABLE
CREATE TABLE users (
    user_id        BIGINT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(200),
    address           VARCHAR(200)
    email          VARCHAR(200) UNIQUE,
    phone          VARCHAR(15) UNIQUE,
    password_hash  VARCHAR(255),
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--WISHLIST
CREATE TABLE wishlist (
    wishlist_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id       BIGINT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE wishlist_items (
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    wishlist_id  BIGINT,
    product_id   BIGINT,
    FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--ORDERS TABLE
CREATE TABLE orders (
    order_id        BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id         BIGINT,
    address_id      BIGINT,
    total_amount    DECIMAL(10,2),
    order_status    ENUM('placed','confirmed','packed','shipped','delivered','cancelled','returned'),
    payment_status  ENUM('pending','paid','failed'),
    order_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (address_id) REFERENCES user_addresses(address_id)
);

--ORDER ITEMS
CREATE TABLE order_items (
    order_item_id  BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id       BIGINT,
    product_id     BIGINT,
    variant_id     BIGINT,
    quantity       INT,
    price          DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

--PAYMENT TABLE
CREATE TABLE payments (
    payment_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id        BIGINT,
    payment_mode    ENUM('cod','upi','card','netbanking'),
    transaction_id  VARCHAR(200),
    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status          ENUM('success','failed','pending'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

--SHIPMENTS / DELIVERY
CREATE TABLE shipment (
    shipment_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id         BIGINT,
    courier_name     VARCHAR(200),
    tracking_number  VARCHAR(200),
    shipped_date     TIMESTAMP NULL,
    delivery_date    TIMESTAMP NULL,
    status           ENUM('shipped','in_transit','out_for_delivery','delivered','lost','returned'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

--refund
CREATE TABLE refunds (
    refund_id     INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT NOT NULL,
    refund_amount DECIMAL(10,2) NOT NULL,
    refund_reason VARCHAR(255),
    refund_status VARCHAR(30) DEFAULT 'Pending',

    refund_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_refund_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE
);

--ADDRESS TABLE
CREATE TABLE user_addresses (
    address_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id        BIGINT,
    name           VARCHAR(200),
    phone          VARCHAR(15),
    pincode        VARCHAR(10),
    address_line   TEXT,
    city           VARCHAR(100),
    state          VARCHAR(100),
    landmark       VARCHAR(200),
    type           ENUM('home','work','other'),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--CART TABLE
CREATE TABLE cart (
    cart_id       BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id       BIGINT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--CART ITEMS
CREATE TABLE cart_items (
    cart_item_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    cart_id      BIGINT,
    product_id   BIGINT,
    variant_id   BIGINT,
    quantity     INT DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

--PRODUCT REVIEWS
CREATE TABLE reviews (
    review_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id    BIGINT,
    user_id       BIGINT,
    rating        INT CHECK (rating BETWEEN 1 AND 5),
    review_text   TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);







