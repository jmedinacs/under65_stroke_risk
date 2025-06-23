# Reducing Patient Stroke Risk for Patients Under Age 65

## Tools and Skills Used
- SQL (data wrangling, cleaning, and filtering)
- Tableau (Interactive Dashboard for User Exploration)
- Excel (data exploration, Chi-Square p-value Analysis, logging, visualization, and EDA)
- Python (Mann-Whitney Statistical Analysis)
- Git and GitHub (version control and repository)
- Slide Deck (Communication of Story Through Presentation and Walkthrough)

## Quick Access
- [Watch the 3-Minute Project Walkthrough](#)
- [Explore the Interactive Tableau Dashboard](#)
- [View Full Slide Presentation](#)

## Executive Summary

![Overall Data Summary](presentation_visuals/whole_study_table_and_graph.png)  
*Figure 1. Summary of Overall Category Statistical Representations*

Did you know that nearly **90% of stroke patients under 65 are married?**  
It's a surprising association, but this highlights the importance of remembering that *correlation is not causation*.   

While **age** is a well-known predictor of stroke, this project focuses on the **risk factors that emerge well before the age of 65**, particularly the **top medically alterable risk factors** that can be addressed through early intervention.    

**Key Findings include:**
- Patients with **heart disease** had a stroke rate of **13.54%** despite being just **2.35%** of the entire population.
- **Hypertension and diabetes** appear earlier than expected, showing sharp increase by age **25 - 35**.
- Stroke risk remains **elevated even after the patient quit smoking**, emphasizing the need for early behavioral intervention.  

These patterns suggests the need for **earlier screening and education**:
- **Hypertension and smoking risk**: assess by age **18**
- **Diabetes monitoring**: begin by age **25**
- **Heart disease screening**: start by age **35**  

## Data Information

This dataset contains de-identified patient records with basic demographic info, medical history, and lifestyle habits. The goal was to identify early stroke risk factors, so we limited the analysis to patients **under age 65**.

Below is a quick overview of the dataset structure:

### Dataset Schema

| Column Name        | Description                                | Data Type     |
|--------------------|--------------------------------------------|---------------|
| id                 | Unique patient ID                          | String        |
| gender             | Patient's gender                           | Categorical   |
| age                | Age in years                               | Numeric       |
| hypertension       | Whether the patient has hypertension (1 = yes) | Binary     |
| heart_disease      | Whether the patient has heart disease (1 = yes) | Binary     |
| ever_married       | Marital status                             | Categorical   |
| work_type          | Type of employment                         | Categorical   |
| residence_type     | Urban or rural residency                   | Categorical   |
| avg_glucose_level  | Average glucose level                      | Numeric       |
| bmi                | Body Mass Index                            | Numeric       |
| smoking_status     | Patient's smoking history                  | Categorical   |
| stroke             | Stroke occurrence (1 = yes)                | Binary        |


