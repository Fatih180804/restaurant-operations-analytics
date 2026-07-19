-- ============================================================================
-- ENTERPRISE RESTAURANT BUSINESS INTELLIGENCE (BI) & WAREHOUSE SCHEMA
-- Version: 1.0 | Target: Analytics & Performance Optimization
-- ============================================================================

-- 1. MENU COST & INVENTORY MANAGEMENT
CREATE TABLE dim_menu_products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category ENUM('Ana Yemek', 'Aperatif', 'Kahvaltılık', 'Sandviç/Tost', 'Soğuk İçecek', 'Sıcak İçecek', 'Tatlı') NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    unit_cost DECIMAL(10, 2) NOT NULL,
    gross_margin_pct DECIMAL(5, 2) NOT NULL
);

-- 2. ENVIRONMENTAL & GEOGRAPHICAL CONTEXT (EXTERNAL DATA)
CREATE TABLE env_daily_context (
    context_date DATE PRIMARY KEY,
    weather_condition VARCHAR(30) NOT NULL,
    temperature_c INT NOT NULL,
    is_weekend BOOLEAN NOT NULL,
    is_public_holiday BOOLEAN NOT NULL
);

-- 3. CORE TRANSACTIONAL SALES LEDGER
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(15) NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_type ENUM('Dine-In', 'Takeaway', 'Delivery') NOT NULL,
    payment_method ENUM('Nakit', 'Kredi Kartı', 'Mobil Ödeme') NOT NULL,
    FOREIGN KEY (product_id) REFERENCES dim_menu_products(product_id),
    FOREIGN KEY (order_date) REFERENCES env_daily_context(context_date)
);

-- 4. CUSTOMER EXPERIENCE & SENTIMENT LEDGER
CREATE TABLE fact_customer_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    review_date DATE NOT NULL,
    platform ENUM('Google', 'TripAdvisor', 'Yemeksepeti', 'Zomato') NOT NULL,
    rating_score INT CHECK (rating_score BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (review_date) REFERENCES env_daily_context(context_date)
);

-- ============================================================================
-- BI ARCHITECTURE OPTIMIZATION INDEXES
-- ============================================================================
CREATE INDEX idx_sales_date_time ON fact_sales (order_date, order_time);
CREATE INDEX idx_menu_category ON dim_menu_products (category);
CREATE INDEX idx_reviews_rating ON fact_customer_reviews (rating_score);
