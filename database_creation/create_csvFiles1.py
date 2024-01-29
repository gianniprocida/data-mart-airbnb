from faker import Faker
import random
import os
import csv 


# This script creates five CSV files - ListingsAvailabilities, Availabilites, and Cancellation_policies


def generate_fake_availabilities():
    """Create a csv file named Availabilities.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """

    combined = f"id,listing_id,start_date,end_date,created_at,updated_at\n"
    mylisting_id = [6,1,2,3,4,5,7]

    with open("Availabilities.csv","w") as f:
      f.write(combined)

    for i in range(7):
      id = i+1
      fake = Faker()
      listing_id = mylisting_id.pop()  
      start_date = fake.date_time_between(start_date='-5y', end_date='now')
      end_date= fake.date_time_between(start_date=start_date, end_date='now')
      created_at = fake.date_time_between(start_date='-5y', end_date='now')
      updated_at= fake.date_time_between(start_date=created_at, end_date='now')
      combined = f"{id},{listing_id},{start_date},{end_date},{created_at},{updated_at}\n"
      with open("Availabilities.csv","a") as f:
        f.write(combined)





def generate_fake_ListingsAvailabilities():
   """Create a csv file named ListingsAvailabilities.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """
   combined = f"id,listing_id,availability_id\n"

   with open("ListingsAvailabilities.csv","w") as f:
      f.write(combined)
   
   myavailability_id = [6,1,2,3,4,5,7]
   for i in range(7):
      id = i + 1
      listing_id = id + 1
      availability_id = myavailability_id.pop()
      combined = f"{id},{listing_id},{availability_id}\n"
      with open("ListingsAvailabilities.csv","a") as f:
        f.write(combined)   



if __name__=='__main__':
   
   try:
      os.remove("ListingsAvailabilities.csv")
      os.remove("Availabilities.csv")
   except FileNotFoundError as e:
      print(f"{e} already deleted")
   finally:
      generate_fake_ListingsAvailabilities()
      generate_fake_availabilities()