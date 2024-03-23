# hollywood-regression

## Overview

This project delves into the relationships between various movie attributes and their domestic gross earnings. Leveraging advanced statistical analysis, machine learning practices, and regression based modeling techniques, we aimed to uncover the determinants of financial success for movies in the domestic market. Our approach not only reveals the pivotal factors associated with movie earnings but also showcases our expertise in handling complex datasets and employing robust statistical methodologies.

## Team Contributors

- Takumi Horiba
- Arul Howard
- Saumya Jain
- Dinghang Xie

## Project Highlights

### Rigorous Data Preprocessing
- The project involves a meticulous data cleaning process, addressing missing values, irrelevant variables and outliers from a dataset containing over 35 variables related to movie features and financial performance.
- Involves using methods such as Cook's distance to identify influential data points
- Our data preparation phase set the groundwork for accurate and reliable statistical analysis, emphasizing the critical role of data integrity in statistical modeling.

### Sophisticated Statistical Analysis
- We employed a variety of data visualization tools (scatter plots, heatmaps, boxplots) to conduct a preliminary analysis, identifying potential correlations and patterns that warranted further investigation as well as problems such as collinearity.
- We explored the effect of polynomial transformations of the explanatory and response variables to deal effectively with non-linear relationships and variance heterogeneity.
- Employed Residuals vs. Fitted and QQ plots for comprehensive residual analysis, rigorously checking for deviations from key model assumptions such as linearity, homoscedasticity, and normality, thereby validating the integrity and accuracy of our statistical model.

### Model Selection and Validation
- Through exhaustive search methods, including the "regsubsets" function, we identified the most statistically significant variables affecting domestic gross earnings: budget, IMDb rating, and distributor.
- Our model selection process was guided by criteria such as the Cp statistic and BIC (Bayesian Information Criterion), ensuring that we chose a model that balanced complexity with explanatory power, avoiding overfitting.

### Final Model
The final regression model demonstrates the relationship between domestic gross earnings and selected movie attributes:

log(Domestic Gross) = -0.955 + + 0.432(IMDb Rating) + 0.0144(Budget) + 0.650(Paramount) + 1.39(Sony) + 0.900(Universal) + 0.222(Disney) + 0.531(Warner Bros) + ε

- The baseline for distributor is 'other'

### Insights and Contributions
- The final model suggested a positive impact of budget and IMDb ratings on domestic gross earnings, alongside the strategic importance of movie distributors.
- Our findings contribute to the broader understanding of movie market dynamics, potentially offering actionable insights for production companies.

## Concluding Thoughts

This project exemplifies the application of advanced statistical techniques to real-world data, demonstrating our team's ability to navigate complex datasets and extract meaningful insights. Through rigorous data cleaning, thoughtful model selection, and insightful analysis, we have highlighted key factors that can significantly impact a movie's domestic financial success. Our findings highlight the value of data-driven decision-making in enhancing the profitability of film projects.






