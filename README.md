# Project Summary
This project builds a complete analytics foundation for an e‑commerce business with Kaggle data from Maven Analytics website, by transforming raw transactional and web‑behavior data into a structured, insight‑driven model. Using six core datasets; orders, order items, refunds, products, website sessions, and pageviews, the project designs a tailored star schema and develops clean fact and dimension tables that unify the customer journey from first website visit to purchase and potential refund. A full SQL analytics roadmap guides the creation of revenue, product, marketing, funnel, and customer‑behaviour analyses. The project also delivers reusable SQL views to support dashboards and ongoing KPI monitoring, enabling clear visibility into traffic quality, conversion performance, product profitability, and refund impact. The result is a scalable, end‑to‑end analytics layer that supports decision‑making across marketing, product, finance, and operations.

### Average Order Value
<img width="1354" height="699" alt="image" src="https://github.com/user-attachments/assets/44db7f8f-00c0-41fd-8f56-bcb2dd5cbe28" />

### Gross Profit analysis per product line
<img width="1357" height="698" alt="image" src="https://github.com/user-attachments/assets/40997ec2-7b0d-4a62-931e-067b600169f5" />
The results indicate that while some products generate high total revenue, profitability varies 
significantly across the portfolio. Products with strong sales volumes tend to drive overall revenue, 
but not all translate into equally high gross profit per product, suggesting differences in cost structures. 
This highlights the importance of focusing not just on top-selling items, but also on those with higher 
profit efficiency to optimise overall business performance.

### Revenue and Orders
<img width="1358" height="699" alt="image" src="https://github.com/user-attachments/assets/0eac0aff-350d-4c0a-bb64-bab4cf1b39e7" />
The highest number of orders were placed on the 28th of November 2014 valued at 27,404

### Revenue by product
<img width="1364" height="703" alt="image" src="https://github.com/user-attachments/assets/331827f5-cb8e-45de-890f-0e346a3dfac1" />
The Original Mr. Fuzzy is the product responsible for most of the firm's revenue

### Session to Order conversion
<img width="1361" height="698" alt="image" src="https://github.com/user-attachments/assets/ecf9fdaa-a666-468f-997a-ce795e1e4126" />
Out of 472,871 web sessions, there were 32,313 orders, giving a conversion rate of ~6.83%.
This means roughly 7 out of every 100 visitors completed a purchase.
Overall, this indicates a solid conversion performance, suggesting effective user experience 
and/or strong purchase intent from traffic.

### Bounce rate
<img width="1361" height="697" alt="image" src="https://github.com/user-attachments/assets/7be7ce2d-46b0-43d1-934b-6bc528de584a" />
A bounce rate of 44.76% means that approximately 45 out of every 100 visitors 
left the website after viewing only one page without any further interaction. 
This indicates a moderate level of engagement, suggesting that while many users are 
exploring the site, a significant portion are not finding enough value to continue browsing.

### Refund rate by product
<img width="1363" height="702" alt="image" src="https://github.com/user-attachments/assets/700c2fc1-6692-454f-9430-36fa577e569b" />
The Birthday Sugar Panda has the highest refund rate (6.04%), indicating potential issues with product 
quality, expectations, or customer satisfaction despite moderate sales volume.The Original Mr. Fuzzy drives 
the highest sales (24,226 units) but also has a relatively high refund rate (5.11%), which could significantly 
impact revenue due to volume.The Forever Love Bear shows a moderate refund rate (2.23%), suggesting better 
product performance and customer satisfaction.The Hudson River Mini Bear has the lowest refund rate (1.28%), 
making it the most reliable product in terms of customer retention and satisfaction.
#### Key Insight
High-volume products with high refund rates (Mr. Fuzzy) present the biggest financial risk, while low refund 
rate products (Hudson River Mini Bear) indicate strong product-market fit.

### Refund Impact on Profitability, Net margin after refunds (order-level)
<img width="1363" height="702" alt="image" src="https://github.com/user-attachments/assets/157c976d-3ad4-4aea-904e-bb43bd1e33bc" />
Refunds have a significant negative impact on profitability in this dataset. 
In multiple cases, total refunds equal the gross revenue, completely eroding 
revenue and resulting in negative net margins. Even where revenue is generated, 
high refund values consistently outweigh gross margins, leading to losses per order. 
Only orders with zero refunds remain profitable. Overall, the data highlights that 
refund volume is the primary driver of loss in profitability and requires closer control

### Channel Performance over Time, Daily sessions, orders, and conversion rate by UTM source
<img width="1364" height="701" alt="image" src="https://github.com/user-attachments/assets/e071cf51-4847-4b9b-8c58-ed8ace2fcb0b" />

### Channel performance summary - Overall conversion rate per utm source
<img width="1361" height="703" alt="image" src="https://github.com/user-attachments/assets/a10788f4-c838-4899-803b-fa5e69a96d33" />
Conversion performance varies notably by UTM source between socialbooks and others with direct traffic (NULL) 
showing a meaningful share of conversions, indicating strong brand recognition or repeat users accessing the site 
directly. However, certain tracked channels also deliver marginally lower conversion rates than direct traffic, 
suggesting that targeted marketing efforts outperform passive traffic. Overall, while direct access contributes 
volume, optimized campaigns via bing and google search can drive higher conversion efficiency.
