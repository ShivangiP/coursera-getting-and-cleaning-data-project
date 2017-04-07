This code book summarizes the resulting data fields in tidy.txt.

Variables :

X_train, y_train, X_test, y_test, subject_train and subject_test contain the data from the downloaded files.
all_data, all_activities and all_subjects merge the previous datasets to further analysis.
featuresReq.names contains the correct names for the all_data, which are applied to the column names stored in features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activity_labels variable.
featuresReq contains a table with the features selected
mergeData merges all_data, all_activities and all_subjects in a big dataset.
Finally, tidy contains the relevant averages which will be later stored in a .txt file. 
