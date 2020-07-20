# Supplementary Material for "Functional clustering methods for longitudinal data with application to electronic health records"

We have put all our R code for the paper "Functional clustering methods for longitudinal data with application to electronic health records" in this repository. It contains all simulations and all data analysis code.

## Brief summary of the paper

We used Dirichlet process (DP) priors, including an enriched Dirichlet Process (EDP) prior (Wade et al (2010)), in a longitudinal linear regression model, which we used to predict missing outcomes in an electronic health records (EHR) dataset. Our goal was to calculate the incidence of Type II Diabetes among people who had newly initiated a second generation antipsychotic medication. Our EHR dataset contained diagnosis codes, medication dispensement information, and laboratory values (HbA1c, fasting glucose, random glucose). Our EDP and DP regressions predicted missing values of the laboratory values, which we included with existing diagnosis codes and medication information to calculate incidence of Type II Diabetes.

## Structure of this repository

The simulation code and data analysis code are in separate folders. The simulations are then organized into sub-folders by table number. Note: all these R scripts refer to either https://github.com/zeldow/edp-long for the EDP models and https://github.com/zeldow/dp-long for the DP models. 

