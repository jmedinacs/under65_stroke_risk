from scipy.stats import mannwhitneyu 
import pandas as pd 



def mann_whitney_p_val(feature, df):
    """
    Calculates the Mann–Whitney U test p-value for a given numerical feature
    between stroke and no-stroke patient groups.

    Parameters:
    - feature (str): The name of the numerical feature to test (e.g., 'bmi').
    - df (DataFrame): The dataframe containing stroke status and the feature.

    Returns:
    - float: The p-value from the Mann–Whitney U test.
    """
    # Separate the feature values based on stroke status
    feature_stroke = df[df['stroke_status']== 'had stroke'][feature].dropna()
    feature_no_stroke = df[df['stroke_status']== 'no stroke'][feature].dropna()
    
    # Run Mann–Whitney U test
    stat, p_value = mannwhitneyu(feature_stroke, feature_no_stroke)
    return p_value

def main():
    """
    Main function to run the Mann–Whitney U test on BMI and glucose level features,
    comparing stroke vs. no-stroke groups.
    """
    # Load the dataset
    df = pd.read_csv("../data/mann_whitney_data.csv")
      
    # Run tests using the definition
    p_val_bmi = mann_whitney_p_val('bmi',df)
    p_val_glucose = mann_whitney_p_val('avg_glucose_level',df)
    
    # Print the test results
    print("BMI p-value: ", p_val_bmi)
    print("Glucose p-value: ", p_val_glucose)

if __name__ == "__main__":
    main()
