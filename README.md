# Project Summary
This project builds a complete analytics foundation for an e‑commerce business (Fuzzy Factory), by transforming raw transactional and web‑behavior data into a structured, insight‑driven model. Using six core datasets; orders, order items, refunds, products, website sessions, and pageviews, the project designs a tailored star schema and develops clean fact and dimension tables that unify the customer journey from first website visit to purchase and potential refund. A full SQL analytics roadmap guides the creation of revenue, product, marketing, funnel, and customer‑behaviour analyses. The project also delivers reusable SQL views to support dashboards and ongoing KPI monitoring, enabling clear visibility into traffic quality, conversion performance, product profitability, and refund impact. The result is a scalable, end‑to‑end analytics layer that supports decision‑making across marketing, product, finance, and operations.

## Contents
### SQL Queries and Insights
### Power BI Dashboard and Insights
### Business Recommendations

## SQL Queries
#### Average Order Value
<img width="1354" height="699" alt="image" src="https://github.com/user-attachments/assets/44db7f8f-00c0-41fd-8f56-bcb2dd5cbe28" />

#### Gross Profit analysis per product line
<img width="1357" height="698" alt="image" src="https://github.com/user-attachments/assets/40997ec2-7b0d-4a62-931e-067b600169f5" />
The results indicate that while some products generate high total revenue, profitability varies 
significantly across the portfolio. Products with strong sales volumes tend to drive overall revenue, 
but not all translate into equally high gross profit per product, suggesting differences in cost structures. 
This highlights the importance of focusing not just on top-selling items, but also on those with higher 
profit efficiency to optimise overall business performance.

#### Revenue and Orders
<img width="1358" height="699" alt="image" src="https://github.com/user-attachments/assets/0eac0aff-350d-4c0a-bb64-bab4cf1b39e7" />
The highest number of orders were placed on the 28th of November 2014 valued at 27,404

#### Revenue by product
<img width="1364" height="703" alt="image" src="https://github.com/user-attachments/assets/331827f5-cb8e-45de-890f-0e346a3dfac1" />
The Original Mr. Fuzzy is the product responsible for most of the firm's revenue

#### Session to Order conversion
<img width="1361" height="698" alt="image" src="https://github.com/user-attachments/assets/ecf9fdaa-a666-468f-997a-ce795e1e4126" />
Out of 472,871 web sessions, there were 32,313 orders, giving a conversion rate of ~6.83%.
This means roughly 7 out of every 100 visitors completed a purchase.
Overall, this indicates a solid conversion performance, suggesting effective user experience 
and/or strong purchase intent from traffic.

#### Bounce rate
<img width="1361" height="697" alt="image" src="https://github.com/user-attachments/assets/7be7ce2d-46b0-43d1-934b-6bc528de584a" />
A bounce rate of 44.76% means that approximately 45 out of every 100 visitors 
left the website after viewing only one page without any further interaction. 
This indicates a moderate level of engagement, suggesting that while many users are 
exploring the site, a significant portion are not finding enough value to continue browsing.

#### Refund rate by product
<img width="1363" height="702" alt="image" src="https://github.com/user-attachments/assets/700c2fc1-6692-454f-9430-36fa577e569b" />
The Birthday Sugar Panda has the highest refund rate (6.04%), indicating potential issues with product 
quality, expectations, or customer satisfaction despite moderate sales volume.The Original Mr. Fuzzy drives 
the highest sales (24,226 units) but also has a relatively high refund rate (5.11%), which could significantly 
impact revenue due to volume.The Forever Love Bear shows a moderate refund rate (2.23%), suggesting better 
product performance and customer satisfaction.The Hudson River Mini Bear has the lowest refund rate (1.28%), 
making it the most reliable product in terms of customer retention and satisfaction. High-volume products with 
high refund rates (Mr. Fuzzy) present the biggest financial risk, while low refund rate products (Hudson River Mini Bear) 
indicate strong product-market fit.

#### Refund Impact on Profitability, Net margin after refunds (order-level)
<img width="1363" height="702" alt="image" src="https://github.com/user-attachments/assets/157c976d-3ad4-4aea-904e-bb43bd1e33bc" />
Refunds have a significant negative impact on profitability in this dataset. 
In multiple cases, total refunds equal the gross revenue, completely eroding 
revenue and resulting in negative net margins. Even where revenue is generated, 
high refund values consistently outweigh gross margins, leading to losses per order. 
Only orders with zero refunds remain profitable. Overall, the data highlights that 
refund volume is the primary driver of loss in profitability and requires closer control

#### Channel Performance over Time, Daily sessions, orders, and conversion rate by UTM source
<img width="1364" height="701" alt="image" src="https://github.com/user-attachments/assets/e071cf51-4847-4b9b-8c58-ed8ace2fcb0b" />

#### Channel performance summary - Overall conversion rate per utm source
<img width="1361" height="703" alt="image" src="https://github.com/user-attachments/assets/a10788f4-c838-4899-803b-fa5e69a96d33" />
Conversion performance varies notably by UTM source between socialbooks and others with direct traffic (NULL) 
showing a meaningful share of conversions, indicating strong brand recognition or repeat users accessing the site 
directly. However, certain tracked channels also deliver marginally lower conversion rates than direct traffic, 
suggesting that targeted marketing efforts outperform passive traffic. Overall, while direct access contributes 
volume, optimized campaigns via bing and google search can drive higher conversion efficiency.

# Power BI Dashboard
These dashboards provide an overview of the e-commerce store's sales performance, highlighting revenue generation, product contribution, customer purchasing behaviour, sales trends and refunds. It brings together key performance indicators (KPIs), visualisations and a detailed transaction summary to support business performance evaluation to inform decision-making.

## Overview of KPIs
<img width="1327" height="732" alt="Screenshot 2026-11-07 231545" src="https://github.com/user-attachments/assets/756d7e5a-1f08-4e40-b424-4cd42395e270" />

Revenue is heavily concentrated in The Original Mr. Fuzzy. This suggests a strong dependence on one flagship product. The business should explore opportunities to grow sales of the other products and reduce its reliance on a single product.
#### Revenue trend
The business experienced significant revenue growth between 2012 and 2014, with 2014 representing its strongest year. However, revenue declined considerably in 2015. This requires further investigation into the root-cause e.g. possible changes in demand, marketing effectiveness, product availability or customer purchasing behaviour. 
#### Refund performance
The business recorded approximately $85.34K in refunds against $1.94M in gross revenue. This represents approximately 4.4% of gross revenue.
Although refunds are relatively small compared with total revenue, they represent a potential opportunity to improve profitability. The refund value is largely a function of sales volume rather than necessarily poor product quality. 
#### Detailed financial performance
The table provides a product-level breakdown of gross revenue, cost of goods sold (COGS), refunds, net revenue and net margin. Although The Original Mr. Fuzzy generates the highest revenue, the smaller products demonstrate competitive margins. This suggests that increasing the sales volume of these products could improve the overall product portfolio's profitability.

## Marketing Performance
This dashboard provides an overview of the marketing performance of Fuzzy Factory Store, focusing on website traffic, customer engagement, traffic acquisition channels, campaign performance, device usage and advertising effectiveness. It helps assess where website visitors originate, how they interact with the website and which marketing sources and campaigns generate the most traffic and revenue.
<img width="1330" height="737" alt="Screenshot 2026-11-07 231849" src="https://github.com/user-attachments/assets/412f3283-b858-45b4-8093-50061089793d" />

#### Revenue by traffic source
Google search is the dominant revenue acquisition channel, accounting for a substantial proportion of total revenue. This highlights the importance of search visibility and organic search performance. The business should continue investing in SEO while exploring opportunities to improve revenue from social media and other acquisition channels. In terms of Source of traffic Google search also dominates website traffic generation, accounting for approximately 67% of total sessions. This reinforces its importance as a major customer acquisition channel. However, the relatively low contribution from social media suggests an opportunity to strengthen social media campaigns and audience engagement.
#### Traffic by campaign
Non-brand campaigns generate the highest traffic, suggesting that the business is attracting customers beyond those already familiar with its brand. However, the 83K sessions attributed to NULL campaigns highlight a potential tracking and attribution gap. Improving campaign tagging and UTM consistency would provide better visibility into marketing effectiveness.
#### Traffic by device type
Desktop accounts for the majority of website traffic. The business should therefore maintain a strong desktop shopping experience while improving mobile usability, navigation and checkout processes to capitalise on the significant proportion of mobile visitors.
## Refund & Product Performance
This dashboard demonstrates that while The Original Mr. Fuzzy remains the dominant revenue driver, it is also the largest source of refunds. The overall refund rate of 4.40% is relatively low compared with total revenue, indicating generally healthy product performance. However, the concentration of both revenue and refunds around a single product presents a risk to long-term profitability and revenue stability.
<img width="1325" height="722" alt="Screenshot 2026-11-07 231946" src="https://github.com/user-attachments/assets/b1f936aa-4c47-4112-8089-4ff6df568bb7" />
#### Smaller products deliver stronger margins
The bubble chart shows that The Birthday Sugar Panda and The Hudson River Mini Bear achieve the highest net margins. The most profitable products are not necessarily the highest-selling products. Increasing sales volumes of the higher-margin products could improve overall profitability without requiring equivalent revenue growth.
#### Refund Rate
Overall refund rate of 4.40% indicates that approximately 95.6% of sales are retained, suggesting generally positive customer satisfaction and product quality. While not alarming, opportunities still exist to reduce refund-related losses and improve profit retention. The higher refund value for The Original Mr. Fuzzy is largely a function of sales volume rather than necessarily poor product quality. However, because the product represents the majority of sales, even small improvements in its refund rate could deliver significant profitability gains.
#### Seasonal Refund Pattern
Refund activity remains relatively stable throughout most months, ranging from approximately $4K-$8K. A significant spike occurs in September (approximately $14K) declining sharply in October before rising again toward year-end. The September peak warrants investigation. Possible causes may include product quality issues associated with a particular batch, seasonal sales promotions leading to increased returns or delayed returns from purchases made during a prior high-sales period. Understanding the drivers behind this spike could help reduce future refund costs.

## Business Recommendations
#### Product Portfolio Optimisation
Prioritise stock availability for high-demand products, particularly The Original Mr. Fuzzy.
Increase promotional activity for The Birthday Sugar Panda and The Hudson River Mini Bear, as they deliver superior margins and could improve overall profitability.
#### Refund Reduction Programme
Review customer feedback, return reasons and quality control processes.
Focus particularly on transactions leading up to the September refund spike.
#### Product Diversification
Reduce revenue dependence on a single flagship product by expanding visibility of other products through bundles, cross-selling and targeted promotions.
#### Improve conversion 
Investigate the customer journey, website experience and checkout process to identify opportunities to convert more website sessions into orders.
### Strengthen Marketing Effectiveness
Strengthen SEO by maintaining investment in Google search, given its dominant contribution to traffic and revenue.
#### Social Media
Improve social media acquisition: Develop targeted social media campaigns to increase traffic and revenue from social channels.
#### Loyalty-driven Strategies
Introduce remarketing, email automation and loyalty initiatives to encourage repeat visits and purchases.
#### Improve campaign attribution
Address NULL campaign records and ensure consistent UTM tagging to improve marketing reporting accuracy.
#### Optimise mobile experience 
Improve mobile website navigation and checkout functionality to increase engagement and conversion.
