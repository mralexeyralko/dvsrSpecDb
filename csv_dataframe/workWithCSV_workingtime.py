import pandas as pd
from datetime import timedelta

df = pd.read_csv('csv_dataframe/dataframe.csv')

def dfFunc(dataframe):

    dataframe['Time'] = pd.to_datetime(df['Time'])
    df_sorted = dataframe.sort_values(by='Time')
    time_threshold = timedelta(seconds=1)
    df_sorted['TimeDiff'] = df_sorted.groupby('EmpId')['Time'].diff()
    mark_duplicates = (df_sorted['TimeDiff'] <= time_threshold) & (df_sorted['TimeDiff'].notnull())
    cleaned_df = df_sorted[~mark_duplicates | df_sorted['TimeDiff'].isnull()]
    cleaned_df = cleaned_df.drop(columns='TimeDiff')

    cleanDF = pd.DataFrame({'EmpId': dataframe['EmpId'],'Name': dataframe['Name'], 'MidName': dataframe['MidName'], 'LastName': dataframe['LastName'],
                            'Detail': dataframe['Detail'].str[21:], 'Time' : pd.to_datetime(dataframe['Time'])})
    

    # Convert 'Time' column to datetime
    cleanDF['Time'] = pd.to_datetime(cleanDF['Time'])

    # Sorting DataFrame by EmpId, Detail, and Time
    cleanDF = cleanDF.sort_values(by=['EmpId', 'Time'])

    # Create a unique identifier for each entry and exit
    cleanDF['EventId'] = cleanDF.groupby('EmpId').cumcount() // 2

    # Pivot the DataFrame to separate вход and выход events
    reshapedDF = cleanDF.pivot_table(index=['EmpId', 'Name', 'MidName', 'LastName', 'EventId'],
                                columns='Detail',
                                values='Time',
                                aggfunc='first').reset_index()

    # Reshape Dataframe
    reshapedDF.columns.name = None
    reshapedDF = reshapedDF.rename(columns={'вход': 'EnterTime', 'выход': 'ExitTime'})
    reshapedDF = reshapedDF[['EmpId', 'Name', 'MidName', 'LastName', 'EnterTime', 'ExitTime']]
    reshapedDF['WorkingTime'] = reshapedDF['ExitTime'] - reshapedDF['EnterTime']
###

    reshapedDF['EnterTime'] = pd.to_datetime(reshapedDF['EnterTime'])
    reshapedDF['ExitTime'] = pd.to_datetime(reshapedDF['ExitTime'])

    # Calculate the working time
    reshapedDF['WorkingTime'] = (reshapedDF['ExitTime'] - reshapedDF['EnterTime']).dt.total_seconds() / 60

    # Fixing negative values
    reshapedDF.loc[reshapedDF['WorkingTime'] < 0, 'WorkingTime'] = 0  # Setting negative values to 0

    # Correcting 'ExitTime' earlier than 'EnterTime'
    reshapedDF.loc[reshapedDF['ExitTime'] < reshapedDF['EnterTime'], 'ExitTime'] = reshapedDF['EnterTime']  # Making 'ExitTime' same as 'EnterTime'

    # Cap the working time to a maximum of 720 minutes (12 hours)
    reshapedDF.loc[reshapedDF['WorkingTime'] > 720, 'WorkingTime'] = 720  # Cap at 12 hours

    # Display the DataFrame to check the results
    print(reshapedDF)




    def exportDF(df):
        try:
            df['EnterTime'] = df['EnterTime'].dt.tz_localize(None)
            df['ExitTime'] = df['ExitTime'].dt.tz_localize(None)
            df['WorkingTime_minutes'] = (df['ExitTime'] - df['EnterTime']).dt.total_seconds() // 60  # Calculate working time in minutes

            # Fill NaN values with zero
            df['WorkingTime_minutes'].fillna(0, inplace=True)

            # Format 'WorkingTime' as 'hours:minutes' string
            df['WorkingTime'] = df.apply(lambda row: int(row['WorkingTime_minutes']), axis=1)

            df.to_excel(r'C:\envs\dvsr\xl\pivoted22.xlsx', index=True)
            print('Export done')
        except Exception as e:
            print('Export failed:', e)




    exportDF(reshapedDF)


dfFunc(df)


