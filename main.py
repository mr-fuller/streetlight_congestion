import psycopg2, pandas as pd, json, zipfile, os 
from pathlib import PureWindowsPath
from sqlalchemy import create_engine
from variables import col_rename_dict_vol, col_rename_dict_idx

with open('credentials.json') as creds:
    credentials = json.load(creds)
pg_username = credentials['pg_username']
pg_password = credentials['pg_password']
pg_db = credentials['pg_db']
engine = create_engine(f'postgres://{pg_username}:{pg_password}@localhost/{pg_db}')
#create the table
# conn = psycopg2.connect(database=pg_db, user=pg_username, password=pg_password)
# cur = conn.cursor()
# createtablesqlfile = "C:/Users/fullerm/OneDrive/Documents/Work Computer Files/PycharmProjects/streetlight_congestion/createtable.sql" 
# cur.execute(open(createtablesqlfile,'r').read())
# if conn is not None:
#     conn.close()

root_path = "C:/Users/fullerm/OneDrive - Toledo Metropolitan Area Council of Governments/Documents/LRP 2020 Update/priority_projects/streetlight_congestion/priority_project_personal"
#useful snippet for unzipping files
for item in os.listdir(root_path):
    if item.endswith(".zip"):
        file_name = os.path.join(root_path,item)
        print(f"Unzipping {file_name} into {root_path} ... ",)
        with zipfile.ZipFile(file_name, 'r') as zip_ref:
            zip_ref.extractall(root_path)
        # os.remove(file_name)
        print("Done")
#do this for network data
for root, dirs, files in os.walk(root_path):
    for filename in files:
         
        # if filename.endswith('_sa_all.csv'):
        #     df = pd.read_csv(os.path.join(root, filename))
        #     tbl = "luc_woo_personal_123456_seg_all"
        #     month = filename[-18:-16]
        #     year = filename[-15:-11]
        #     #rename columns because I kept getting key errors when inserting to postgres
        #     df = df.rename(columns=col_rename_dict_vol)
        #     # alter table to have fields for month and year and then put it all in one table?
        #     df['month'] = month 
        #     df['year'] = year
        #     # print some measure of progress?
        #     print(f'Inserting {filename} for {month} {year} into {tbl}',)

        #     # can I do this? append option should put all the data in one table
        #     df.to_sql(name = tbl, con = engine, if_exists = 'append')
        #     print('Done')
        
        # use this for priority projects because I did not keep month/year order consistent
        if filename.endswith('_sa_all.csv'):
            df = pd.read_csv(os.path.join(root, filename))
            tbl = "lrp2045_priority_personal_123456_seg_all"
            month = filename[-13:-11]
            year = filename[-18:-14]
            #rename columns because I kept getting key errors when inserting to postgres
            df = df.rename(columns=col_rename_dict_vol)
            # alter table to have fields for month and year and then put it all in one table?
            df['month'] = month 
            df['year'] = year
            # print some measure of progress?
            print(f'Inserting {filename} for {month} {year} into {tbl}',)

            # can I do this? append option should put all the data in one table
            df.to_sql(name = tbl, con = engine, if_exists = 'append')
            print('Done')
        elif filename.endswith('_sa_comm.csv'):
            df = pd.read_csv(os.path.join(root, filename))
            tbl = "luc_woo_commercial_123456_seg_all"
            month = filename[-19:-17]
            year = filename[-16:-12]
            #rename columns because I kept getting key errors when inserting to postgres
            df = df.rename(columns=col_rename_dict_idx)
            # alter table to have fields for month and year and then put it all in one table?
            df['month'] = month 
            df['year'] = year
            # print some measure of progress?
            print(f'Inserting {filename} for {month} {year} into {tbl}',)

            # can I do this? append option should put all the data in one table
            df.to_sql(name = tbl, con = engine, if_exists = 'append')
            print('Done')
        # else:
        #     pass
        # 

        # # can I do this? append option should put all the data in one table
        # df.to_sql(name = tbl, con = engine, if_exists = 'append')
        # print('Done')
# do a slightly different version for the priority project data