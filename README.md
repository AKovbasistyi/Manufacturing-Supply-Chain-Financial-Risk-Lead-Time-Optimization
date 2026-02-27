**Manufacturing Supply Chain: Financial Risk & Lead-Time Optimization**
**Project Overview**
In a "Just-In-Time" (JIT) manufacturing environment, a late shipment is more than a delay—it is a production bottleneck. When critical components are missing, assembly lines stall, but fixed costs like labor and overhead continue to accumulate.
This project engineers a Financial Risk Model to quantify the "Economic Bleed" caused by logistics failures. By integrating shipping data with manufacturing criticality, I identified the Top 10 "Profit Killers" and pinpointed the root cause of systemic delays.

**Business Questions** 
**The Financial Impact**: What is the actual USD cost of shipping delays when accounting for idle factory labor ($300/day) and part criticality?
**The Pareto Focus:** Which 10 product categories are responsible for the majority of our production loss?
**The Root Cause:** Are these losses driven by specific product types or by failures in certain shipping modes (e.g., Second Class vs. First Class)?
**Technical Stack** 
SQL (T-SQL/MS SQL Server): For Feature Engineering, calculating the production_loss_usd using complex conditional logic.
Python (Pandas/Seaborn/Matplotlib): For diagnostic analysis, Pareto visualization, and multidimensional heatmapping.
Data Source: DataCo Smart Supply Chain Dataset.
**Methodology & Logic**
1. Financial Risk Engineering (SQL)
I developed a weighted cost formula to transform "days late" into "dollars lost":
Fixed Cost: $300/day (Idle Labor & Factory Overhead).
Variable Cost: 2% of component value per day.
Criticality Multiplier: Scaled impact (1x to 5x) based on part complexity (e.g., Tech/Electronics vs. Raw Materials).
2. Diagnostic Pipeline (Python)
Pareto Analysis: Applied the 80/20 rule to filter out the "noise" and focus on the 10 categories causing ~90% of the financial bleed.
Root Cause Heatmapping: Pivoted the Top 10 categories against shipping_mode to identify logistics bottlenecks.

**Key Insights**
The "Second Class" Trap: Analysis revealed that Second Class shipping consistently averages a 2.5-day delay, which is actually worse than the lower-cost Standard Class (1.5 days).
The Profit Killers: Categories like Electronics and Heavy Industrial Equipment carry the highest risk due to their high "Criticality Multiplier."
Strategic Recovery: Moving the Top 10 categories from "Second Class" to "First Class" reduces delay by 60%, potentially recovering millions in idle labor costs.
