# Customer Segmentation using RFM Analysis and K-Means  
**Dataset:** Online Retail II (UCI Machine Learning Repository)

This project builds a customer segmentation framework using transactional data from an online retailer.  
The objective is to identify distinct customer behavioral segments based on purchasing recency, frequency, monetary value, and additional behavioral features, using unsupervised learning techniques.

The final output is a set of interpretable customer segments that can support strategic decisions in marketing, CRM, and customer value management.

## Objective

The main goal of this project is to:
- Segment customers based on purchasing behavior
- Identify high-value, dormant, and opportunity customer groups
- Provide actionable insights derived from data-driven clustering

This project is designed as a portfolio-ready example of applied machine learning for business decision-making.

## Dataset

The analysis uses the **Online Retail II dataset** from the UCI Machine Learning Repository.

The dataset contains transactional records of an online retail store, including:
- Customer ID
- Invoice dates
- Quantity and unit price
- Product identifiers

Each row represents a transaction line item.

## Feature Engineering

Customer-level features were constructed by aggregating transactional data.  
The following groups of features were created:

### RFM Features
- **Recency:** Days since the customer's last purchase
- **Frequency:** Total number of purchases per customer
- **Monetary:** Total monetary value spent by the customer

### Additional Behavioral Features
- **Average Ticket:** Average transaction value
- **Days Active:** Number of distinct days with purchases
- **Unique Products:** Number of unique products purchased
- **Average Days Between Purchases**

### Transformations
- Logarithmic transformations were applied to skewed variables (Frequency, Monetary, Unique Products, Average Days Between Purchases)
- Scaling was applied only for model training
- Interpretability was preserved by analyzing clusters on transformed but unscaled features

## Clustering Methodology

Customer segmentation was performed using **K-Means clustering**.

### Preprocessing
- Customer ID was excluded from model training
- All features were scaled prior to clustering
- The original customer index was preserved to ensure correct alignment of cluster labels

### Model Selection

Models were trained for values of K ranging from 2 to 10.
The following metrics were evaluated:
- Inertia (Within-Cluster Sum of Squares)
- Silhouette Score

Based on metric analysis and business interpretability, **K = 3 and K = 4** were selected as candidate solutions.

## Final Model Selection

Although both K = 3 and K = 4 produced stable and balanced clusters, **K = 4** was selected as the final model due to:
- Higher behavioral granularity
- Clear separation of customer profiles
- Improved business actionability

All clusters maintained sufficient size, avoiding over-segmentation.

## Cluster Profiles (K = 4)

Clusters were interpreted using transformed but unscaled features to maintain economic meaning.

**Profile:**
- Very recent purchases
- High purchase frequency
- High total spending
- Long customer lifetime
- High product diversity

**Interpretation:**  
Core customers with strong loyalty and high lifetime value.

**Business Action:**  
Retention strategies, loyalty programs, premium offers.

**Profile:**
- Moderate recency
- Consistent frequency
- High average ticket size
- Long-standing relationship
- Moderate product exploration

**Interpretation:**  
Reliable and profitable customers with potential for catalog expansion.

**Business Action:**  
Cross-selling and personalized recommendations to increase product diversity.

**Profile:**
- Low recency
- Low-to-medium frequency
- Low average ticket
- Moderate product diversity
- Intermittent purchasing behavior

**Interpretation:**  
Occasional customers sensitive to price, purchasing mainly for specific needs.

**Business Action:**  
Targeted promotions, discounts, and low-cost product recommendations.

**Profile:**
- Very high recency
- Very low frequency and spending
- Minimal engagement

**Interpretation:**  
Inactive or churned customers with low expected future value.

**Business Action:**  
Limited marketing investment or reactivation campaigns if cost-effective.

## Key Takeaways

- Customer behavior can be effectively segmented using RFM combined with additional behavioral features
- Log transformations and proper scaling are critical for clustering performance
- Interpretability should always be preserved by analyzing unscaled features
- K-Means provides strong results when combined with domain-driven validation

## Tools & Technologies

- Python
- pandas, numpy
- scikit-learn
- matplotlib / seaborn
- Jupyter Notebook
