import pandas as pd

# Simulating a larger dataset with multiple entry and exit records per employee
data = {
    'EmpId': [1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3],
    'Name': ['John', 'John', 'John', 'John', 'Alice', 'Alice', 'Alice', 'Bob', 'Bob', 'Bob', 'Bob'],
    'MidName': ['Doe', 'Doe', 'Doe', 'Doe', 'L', 'L', 'L', 'E', 'E', 'E', 'E'],
    'LastName': ['Smith', 'Smith', 'Smith', 'Smith', 'Johnson', 'Johnson', 'Johnson', 'Brown', 'Brown', 'Brown', 'Brown'],
    'Detail': ['Enter', 'Exit', 'Enter', 'Exit', 'Enter', 'Exit', 'Enter', 'Enter', 'Exit', 'Enter', 'Exit'],
    'Time': [
        '2023-12-01 09:00:00', '2023-12-01 12:00:00', '2023-12-01 13:00:00', '2023-12-01 17:00:00',
        '2023-12-01 09:15:00', '2023-12-01 11:30:00', '2023-12-01 14:00:00', '2023-12-01 08:30:00',
        '2023-12-01 12:30:00', '2023-12-01 14:45:00', '2023-12-01 18:00:00'
    ]
}

df = pd.DataFrame(data)

# Convert 'Time' column to datetime
df['Time'] = pd.to_datetime(df['Time'])

# Splitting dataframe into 'Enter' and 'Exit'
enter_df = df[df['Detail'] == 'Enter'].rename(columns={'Time': 'EnterTime'}).drop(columns='Detail')
exit_df = df[df['Detail'] == 'Exit'].rename(columns={'Time': 'ExitTime'}).drop(columns='Detail')

# Merging the two dataframes based on EmpId and concatenating EnterTime and ExitTime
merged_df = pd.merge(enter_df, exit_df, on=['EmpId', 'Name', 'MidName', 'LastName'], how='outer')

print(merged_df)