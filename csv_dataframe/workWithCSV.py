import pandas as pd

df = pd.read_csv('csv_dataframe/dataframe.csv')

def dfFunc(dataframe):
    # print(dataframe)
    print(dataframe)
    cleanDF = pd.DataFrame({'EmpId': dataframe['EmpId'],'Name': dataframe['Name'], 'MidName': dataframe['MidName'], 'LastName': dataframe['LastName'],
                            'Detail': dataframe['Detail'].str[21:], 'RoundedTime' : pd.to_datetime(dataframe['Time']).dt.round("min")})
    # print(cleanDF['RoundedTime'])
    cleanDF = cleanDF.drop_duplicates(subset = ['RoundedTime'], keep='first')
    #cleanDF.sort_values(by='RoundedTime', inplace = True) 

 #help from chatgpt
 # Sort the DataFrame by 'card_id' and 'timestamp'
    df_sorted = cleanDF.sort_values(by=['EmpId', 'RoundedTime'])

# Drop consecutive duplicate entries and exits
    df_cleaned = df_sorted[df_sorted['EmpId'] != df_sorted['RoundedTime'].shift(1)]
    
# df_cleaned will have only the records where the entry and exit are not consecutive




    cleanDF['RoundedTime'] = cleanDF['RoundedTime'].dt.tz_localize(None) #remove timezone to export dataframe



    df_pivot = cleanDF.pivot(index = ['EmpId','Name','MidName','LastName', 'RoundedTime'], columns='Detail', values='RoundedTime')

    # print(df_pivot['Вход'])

    def exportDF(df):
        try:
            df.to_excel(r'C:\envs\dvsr\xl\export_dataframe.xlsx', index=True)
            print('Export done')
        except:
            print('Export failed')
 

    # exportDF(df_pivot)
    return 1

dfFunc(df)


