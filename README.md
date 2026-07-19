# Restaurant Operational Efficiency & Business Intelligence Pipeline 🍽️📊

An advanced operational data engineering and business intelligence repository designed for high-volume enterprise restaurant chains. This project models live operations—fusing **17,000+ transaction flows**, supply-chain cost indices, sentiment logs, and external weather contexts—to diagnose efficiency vulnerabilities, optimize staff schedules, and elevate net financial margins.

## 📈 Executive Summary & 2024 Financial Highlights
Based on production audits of historical performance logs, operations achieved the following landmarks:
* **Gross Revenue Capture:** 12.4M+ Total Revenue generated with a robust **38% Net Profit Margin**[cite: 3].
* **Efficiency Engine:** **Cold Beverages** served as the core optimization catalyst yielding a **72% Gross Margin**[cite: 3].
* **Star Performers:** Menu engineering analysis identified **Ice Latte (148.8K TL Net Profit)** and **Burger (145.7K TL Net Profit)** as premium-tier cash drivers[cite: 3].
* **Operational Bottlenecks:** Resource constraint audits exposed critical operational traffic spikes at **10:00, 15:00, and 20:00** (~1,750 orders) alongside a severe capacity deficit drop at **13:00**[cite: 3].

---

## 🏗️ Relational Architecture & Data Warehouse Structure
The data infrastructure moves away from elementary flat schemas by segregating data blocks across targeted operational fields:
* `dim_menu_products`: Inventory valuation table managing pricing parameters, live supplier unit costs, and automated margin distributions.
* `env_daily_context`: Environmental log tracking temperature matrices, weekends, and public holidays to predict external foot-traffic swings.
* `fact_sales`: Enterprise transactional core ledger tracking itemizations, fulfillment channels (Dine-In, Takeaway, Delivery), and payment methods.
* `fact_customer_reviews`: Natural Language Processing and sentiment input storage evaluating consumer feedback patterns across public spaces.

---

## 🔍 Data-Driven Strategic Roadmap (2025 Targets)
1. **Shift Optimization:** Re-structuring labor rotations based on hourly traffic metrics to eliminate the 13:00 efficiency lag and reinforce the 20:00 rush hours[cite: 3].
2. **Dynamic Menu Engineering:** Packing high-margin coffee categories with low-velocity assets (e.g., Turkish Coffee marketing overhaul) to drive average basket value up[cite: 3].
3. **Core Cost Reduction:** Optimizing Main Course supplier agreements to curb the ~290K TL production expense line while holding baseline item quality intact[cite: 3].
