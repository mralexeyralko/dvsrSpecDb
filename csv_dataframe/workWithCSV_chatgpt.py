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
    

    cleanDF['Time'] = pd.to_datetime(cleanDF['Time'])

    # Sorting DataFrame by EmpId, Detail, and Time
    cleanDF = cleanDF.sort_values(by=['EmpId', 'Time'])

    # Create a unique identifier for each entry and exit
    cleanDF['EventId'] = cleanDF.groupby('EmpId').cumcount() // 2

    # Pivot the DataFrame to separate вход and выход events
    pivoted = cleanDF.pivot_table(index=['EmpId', 'Name', 'MidName', 'LastName', 'EventId'],
                                columns='Detail',
                                values='Time',
                                aggfunc='first').reset_index()

    # Rename columns and adjust column order
    pivoted.columns.name = None
    pivoted = pivoted.rename(columns={'вход': 'EnterTime', 'выход': 'ExitTime'})
    pivoted = pivoted[['EmpId', 'Name', 'MidName', 'LastName', 'EnterTime', 'ExitTime']]

    print(pivoted)

    def exportDF(df):
        try:
            df['EnterTime'] = df['EnterTime'].dt.tz_localize(None)
            df['ExitTime'] = df['ExitTime'].dt.tz_localize(None)
            df.to_excel(r'C:\envs\dvsr\xl\131223.xlsx', index=True)
            print('Export done')
        except:
            print('Export failed')
 

    # exportDF(pivot_df)
    return 1

dfFunc(df)


