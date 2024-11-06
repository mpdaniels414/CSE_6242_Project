DESCRIPTION
The Team014Final package is a comprehensive data visualization and analysis toolkit, utilizing Power BI for dynamic data interaction. It contains two key CSV datasets: class_royale_finalpreML_dataset_V1.csv and results_ml_joined_kk.csv.csv, both housed in the CODE folder. These datasets provide a base for machine learning analysis and pre-processed data. The centerpiece of the package is the Royale-PowerBI.pbix file, which offers an interactive Power BI dashboard for insightful data exploration.


IMPORTANT NOTES
Ensure a stable and uninterrupted execution environment, given the lengthy duration of the data modeling process.
The scripts may require specific libraries or dependencies, so check the documentation within each folder for installation and setup instructions.
These processes are designed for advanced users with an understanding of data science and machine learning.

INSTALLATION
Prerequisites
Microsoft Power BI Desktop (Latest version recommended)
You can download for free at this site: https://www.microsoft.com/en-us/download/details.aspx?id=58494

To post the Power BI Desktop to the web you will need to have access to a tenant where a Power BI free license is assigned to you.    If you don't have this, you can view the visuals in the Power BI Desktop application.

STEP 1- EXTRACT ALL THE RELEVANT FILES FOR YOU TO EXPLORE
1. Extract the Team014Final Package: Unzip the team014final.zip file
2. You should see 2 folders: 1) DOC 2) Code
3. Here is an overview on what is in each folder
	a. DOC - Final Poster and Team Report
	b. Code - Some of the key data that we used for our analysis, Code used to extract the data, prep it for our models, modeling, and Final Power BI Visualization

DEPENDING ON WHAT YOU WANT TO DO FOLLOW THE INSTRUCTIONS THAT INTEREST YOU

A. LOOKING AT THE FINAL VISUALS
	1. Open Power BI Desktop: Start the Power BI Desktop application.
	2. Load the PBIX File: From the Code folder, open the Royale-PowerBI.pbix file with Power BI Desktop.
	3. You will see 4 pages
		-"About the game" - Tells you about the game.
		-"Battle Analysis" - Shows you an analysis on the the battles that we downloaded
		-"Player Analysis" - Shows you an analysis on the players we downloaded
		-"Card Analysis" - Shows you an analysis on the most winning card combinations.
		-"Model Results" - Shows you an analysis on 2 of the models we tried plus the winning model.  Note that there is a python script running so it will take a few seconds to run to see the confusion matrix.
	4. If you want to look at the tables we loaded, go to the table icon on the right hand side.  It is the second icon.
	5.  You will see the following tables and you can explore them by clicking around.
		-"class_royale_finalpreppreML_dataset" - this is the battle log with player data merged
		-"class_royale_player_dataset" - this shows you all the players we looked at.
		-"class_royale_battlelog_dataset" - this shows you the battle data without the additional player data joined.
		-"Decision Tree Results" - These were the results from the Dense Neural Network results
		-"Regression Results" - These were the results from the Logistic regression model.
		-"XGBoost_prediction_results on 20k rows" - These were the results from the winning model, XGBoost.
		-"opponent card data X" and "player card data X" - these are the datasets we used to visualize the cards in the visuals.

	(Optional)
	1. If you want to see the visuals on the web, you need to have a Free Power BI license assigned to you. Ga Tech doesn't offer these licenses so you will have to use a tenant you have access to.  
	2.  If you do have access, hit the "Publish" button in the "Home" ribbon.  Click Yes if it asks you to Save.
	3. Pick the "My Workspace" option.
	4. You will get a message that says "Success."  Click the link that says 'Open "Royal-Power BI.pbix" in Power BI'.
	5. Login using the credentials for which you have access.
	6. Explore the 5 pages.
	   

*****MAKE SURE THAT WHEN THE CODE IS REFERENCING A FILE, THAT YOU HAVE THE FILE IN THE CORRECT LOCATION SO THAT THE NOTEBOOKS RUN WITHOUT ERROR ********************************

B. DOWNLOADING THE DATA FROM THE CLASH ROYALE API and Creating the RAW Datasets
	CREATING A KEY
	1. Go the following website: https://developer.clashroyale.com/#/.
	2. Create an account by following the instructions once you hit "Register"
	3. Log In by clicking "Log In"
	4. Click on the drop down by your name and click on "My Account"
	5. Click on the "Create New Key"
	6. Give it a name and IP description and make sure you add an IP address.
	7. Copy the token as you will need it to use the API once you run the python code.
	RUNNING PYTHON SCRIPTS
	1. Go to the Code -> Code to get data from API folder.
	2. Run the scripts in the following order.  Look at the code and make sure you replace the "API_KEY" variable with the token you previously saved.
		a. CRoyale Python Notebook - this will download about 100,000 records of battles and export it to class_royale_battlelog_dataset.csv
		b. CRoyale Python Player Download - this will take all the players from the 100,000 battles and get additional data from the player api.  It will export the data to a file called class_royale_player_dataset.
		c. CRoyale Python Data Check - this will make sure that all battle players have player data and it will join the Battle and player dataset into 1 called class_royale_finalpreML_dataset.csv.
		d. TakeCardDataandFlattenIt - this will dowload all the card data so that we can visualize it in Power BI.
	3.  Open the class_royale_finalpreML_dataset.csv file in Excel.   Remove the record that has a null value in the "opponent_tag" column and add a "winner" column that shows 1 if the Player won and 0 if the Opponent won.  You can determine this by using the following formula.  If "player_crowns" > "opponent_crowns" then it is 1 elsel 0.  Rename file to class_royale_finalpreML_dataset_V1 to distinguish it from the original file. 

C. PREPPING THE RAW DATASETS FOR ML MODELS.
	1. Go to Code folder, and then the "Code to prep data for ML" folder and run the python script "makeDataMLReadable"  This script preps the data for ML models by enumerating a lot of the columns.  For example, it create a column for every possible card and gives a binary number of 0 or 1. 
	2. The output of this script is a file called "results_ml.csv"


D. GENERATING THE RESULTS FOR A FEW OF THE MODELS.
*********WE RAN MULTIPLE MODELS BUT FOR THE PURPOSES OF THIS SUBMISSION TO SHOW OUR PROCESS WE SUBMITTED THE MOST SUCCESSFUL MODEL****************************
	1. Go to the "Code" folder and then the "Code for Modeling" folder.
	2. Run the "XGBOOST" script.  This script will train the XGBoost and it will also create a separate test dataset which we ran the models against to get our 73% accuracy.    
	3. This test dataset was also the "XGBoost_prediction_results on 20k rows" dataset that was loaded into Power BI for visualization.   

	(optional model code)
	1.  If you want to look at some of the other models we tried, go to the "Code--> Additional ML Model - Optional" folder.
	2.  To run these models and look at the output, make sure that the input file/data needed is coming from "results_ml.csv" and then run the notebook to generate the results from these models.



