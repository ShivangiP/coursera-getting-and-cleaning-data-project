This code book summarizes the resulting data fields in tidy.txt.

Variables :

1) X_train, y_train, X_test, y_test, subject_train and subject_test contain the data from the downloaded files.
2) all_data, all_activities and all_subjects merge the previous datasets to further analysis.
3) featuresReq.names contains the correct names for the all_data, which are applied to the column names stored in features, a numeric vector used to extract the desired data.
4) A similar approach is taken with activity names through the activity_labels variable.
5) featuresReq contains a table with the features selected
6) mergeData merges all_data, all_activities and all_subjects in a big dataset.
7) Finally, tidy contains the relevant averages which will be later stored in a .txt file. 
