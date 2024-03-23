# hollywood-regression

## Overview

This project delves into the statistical relationships between various movie attributes and their domestic gross earnings. Leveraging advanced statistical analysis and regression based modeling techniques, we aimed to uncover the determinants of financial success for movies in the domestic market. Our approach not only reveals the pivotal factors associated with movie earnings but also showcases our expertise in handling complex datasets and employing robust statistical methodologies.

## Team Contributors

- Takumi Horiba
- Arul Howard
- Saumya Jain
- Dinghang Xie

## Project Highlights

### Rigorous Data Management
- The project began with a meticulous data cleaning process, addressing missing values, irrelevant variables and outliers from a dataset containing over 35 variables related to movie features and financial performance.
- Our data preparation phase set the groundwork for accurate and reliable statistical analysis, emphasizing the critical role of data integrity in statistical modeling.

### Sophisticated Statistical Analysis
- We employed a variety of data visualization tools (scatter plots, heatmaps, boxplots) to conduct a preliminary analysis, identifying potential correlations and patterns that warranted further investigation.
- The use of regression models, particularly focusing on the transformation of variables like domestic gross earnings (log transformation), allowed us to deal effectively with non-linear relationships and variance heterogeneity.

### Model Selection and Validation
- Through exhaustive search methods, including the "regsubsets" function, we identified the most statistically significant variables affecting domestic gross earnings: budget, IMDb rating, and distributor.
- Our model selection process was guided by criteria such as the Cp statistic and BIC (Bayesian Information Criterion), ensuring that we chose a model that balanced complexity with explanatory power, avoiding overfitting and collinearity.

### Insights and Contributions
- The final model suggested a positive impact of budget and IMDb ratings on domestic gross earnings, alongside the strategic importance of movie distributors.
- Our findings contribute to the broader understanding of movie market dynamics, potentially offering actionable insights for production companies.

### Final Model
The final regression model demonstrates the relationship between domestic gross earnings and selected movie attributes:
\[
\log(\text{Domestic Gross}) = -0.955 + 0.0144(\text{Budget}) + 0.650(\text{Paramount}) + 1.39(\text{Sony}) + 0.900(\text{Universal}) + 0.222(\text{Disney}) + 0.531(\text{Warner Bros}) + 0.432(\text{IMDb Rating}) + \epsilon
\]

## Concluding Thoughts

This project exemplifies the application of advanced statistical techniques to real-world data, demonstrating our team's ability to navigate complex datasets and extract meaningful insights. Through rigorous data cleaning, thoughtful model selection, and insightful analysis, we have highlighted key factors that can significantly impact a movie's domestic financial success. Our findings highlight the value of data-driven decision-making in enhancing the profitability of film projects.






