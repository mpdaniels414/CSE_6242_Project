# CSE 6242 Project: Predicting Outcomes in Clash Royale

## Overview
This project, created for the CSE 6242 course at Georgia Tech, applies advanced machine learning techniques to predict match outcomes in *Clash Royale*, a popular mobile strategy game. Using over 100,000 gameplay records, this project delivers actionable insights into player behavior, battle strategies, and card combinations. Interactive visualizations built in Power BI make the findings accessible and user-friendly.

## Project Goals
1. **Predict Match Outcomes**: Develop accurate models to forecast game results.
2. **Enhance Gameplay**: Provide data-driven insights to improve strategies.
3. **Interactive Visualizations**: Present findings through an intuitive Power BI dashboard.

---

## STEP 1: Extract the Relevant Files
1. Extract the `Team014Final` package by unzipping the `team014final.zip` file.
2. Inside the package, you will find two folders:
   - **DOC**: Contains the final poster and team report.
   - **Code**: Includes:
     - Key datasets used for analysis.
     - Code for data extraction, preparation, modeling, and visualization.

---

## Instructions Based on Your Goal

### A. Looking at the Final Visuals
1. **Open Power BI Desktop**: Start the Power BI Desktop application.
2. **Load the PBIX File**: Open `Royale-PowerBI.pbix` from the **Code** folder.
3. **Explore the Pages**:
   - *About the Game*: Overview of Clash Royale.
   - *Battle Analysis*: Analysis of battle strategies.
   - *Player Analysis*: Insights into player behavior and performance.
   - *Card Analysis*: Analysis of winning card combinations.
   - *Model Results*: Results from two tested models and the best-performing model (XGBoost). Note: A Python script runs to display the confusion matrix; allow a few seconds for this to process.
4. **Explore the Data Tables**:
   - Click the table icon (second icon on the right) to view the following:
     - `class_royale_finalpreppreML_dataset`: Battle log merged with player data.
     - `class_royale_player_dataset`: Detailed player data.
     - `class_royale_battlelog_dataset`: Battle data without player details.
     - `Decision Tree Results`: Results from the Dense Neural Network model.
     - `Regression Results`: Results from the Logistic Regression model.
     - `XGBoost_prediction_results on 20k rows`: Results from the best-performing XGBoost model.
     - `opponent card data X` and `player card data X`: Data visualized in the Power BI dashboard.

**Optional**: View Visuals on the Web  
1. Ensure you have a Free Power BI license (not provided by Georgia Tech).  
2. Publish the dashboard:
   - Click the **Publish** button in the *Home* ribbon.
   - Save when prompted.
   - Choose "My Workspace."
3. Follow the success message link to view the dashboard online. Log in using credentials with appropriate access.

---

### B. Downloading the Data from the Clash Royale API
1. **Create an API Key**:
   - Register at [Clash Royale API](https://developer.clashroyale.com/#/).
   - Log in, navigate to "My Account," and create a new key.
   - Provide a name, IP description, and IP address. Save the generated token.
2. **Run Python Scripts**:
   - Go to `Code -> Code to get data from API`.
   - Run the scripts in the following order:
     1. `CRoyale Python Notebook`: Downloads ~100,000 battle records and exports them as `class_royale_battlelog_dataset.csv`.
     2. `CRoyale Python Player Download`: Collects additional player data and exports it as `class_royale_player_dataset`.
     3. `CRoyale Python Data Check`: Merges battle and player data into `class_royale_finalpreML_dataset.csv`.
     4. `TakeCardDataandFlattenIt`: Downloads card data for Power BI visualization.
   - Open the merged dataset in Excel, remove rows with null values in the `opponent_tag` column, and add a `winner` column (`1` if Player wins, `0` if Opponent wins). Save the file as `class_royale_finalpreML_dataset_V1.csv`.

---

### C. Prepping the Raw Data for ML Models
1. Navigate to `Code -> Code to prep data for ML`.
2. Run `makeDataMLReadable`:
   - Prepares the dataset by encoding features (e.g., binary columns for each card).
   - Output: `results_ml.csv`.

---

### D. Generating Model Results
1. Go to `Code -> Code for Modeling`.
2. Run the `XGBOOST` script:
   - Trains the XGBoost model.
   - Generates a test dataset (`XGBoost_prediction_results on 20k rows`) used in Power BI visualizations.
3. **Optional**:
   - Explore other models in `Code -> Additional ML Model - Optional`.
   - Ensure `results_ml.csv` is in the correct directory for these scripts to run.

---

## Requirements
### Software
- **Microsoft Power BI Desktop** (latest version recommended)  
  [Download here](https://www.microsoft.com/en-us/download/details.aspx?id=58494)
- Python 3.8+ with libraries: Pandas, Scikit-learn, TensorFlow/Keras, etc.

---

## Key Findings
- **Best Model**: XGBoost achieved 73% accuracy.
- **Feature Importance**: Player rankings, card combinations, and game modes were most influential.
- **Scalability**: Advanced models like XGBoost and DNNs maintained performance with larger datasets.

---

## Limitations
- Data diversity and computational constraints limited real-time analysis.
- Future iterations could include real-time predictions and expanded datasets.

---

This project demonstrates how machine learning can enhance competitive gaming by offering predictive insights and strategic tools to players and developers alike.

