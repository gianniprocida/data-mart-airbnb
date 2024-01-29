from faker import Faker
import random
import os
import csv 
import datetime
from datetime import date, timedelta

# This script creates five CSV files - Listings, ListingsAmenities, Amenities, Payments, and Reservations.


def generate_fake_amenities():
    """Create a csv file named Amenities.csv with fake data
    
    Args: 
        None

    Returns:
        None            
    """
    combined = f"id,name,listing_id,description\n"
    mynames = ["Wi-Fi","Kitchen","Pool","Free parking","Air conditioning","Rooftop pool","Private beach access",
               "Fitness center","Sauna and steam room","On-site restaurant or cafe","Spa services"]
    mydescriptions = ["High-speed internet access throughout the property",
    "Fully equipped kitchen",
    "Private outdoor pool for guest use only",
    "Designated parking spot on property for guest use",
    "Central air conditioning system in all rooms",
    "Enjoy a refreshing dip in our rooftop pool with a stunning view of the city",
    "Escape to our private beach and soak up the sun with a tropical cocktail in hand",
    "Stay fit and healthy during your stay with our fully-equipped fitness center",
    "Relax and unwind in our sauna and steam room after a long day of sightseeing",
    "Savor delicious local cuisine without leaving the comfort of your hotel",
"Pamper yourself with a relaxing massage or facial at our on-site spa",
    ]
    mylistingid = [2,1,3,4,5,7,6,8,9,11,10]
    with open("Amenities.csv","w") as f:
      f.write(combined)
  
    for i in range(11):
       id = i + 1
       name = mynames.pop()
       listing_id = mylistingid.pop()
       description = mydescriptions.pop()
       combined = f"{id},{name},{listing_id},{description}\n"
      
       with open("Amenities.csv","a") as f:
         f.write(combined)


def generate_fake_ListingsAmenities():
   """Create a csv file named ListingsAmenities.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """
   combined = f"id,listing_id,amenities_id\n"

   with open("ListingsAmenities.csv","w") as f:
      f.write(combined)
   myamenity_id = [2,5,7,7,7,7,2,3,9,10,6]
   mylisting_id = [10,10,10,4,5,11,2,4,8,8]
   for i in range(10):
      id = i + 1
      amenity_id = myamenity_id.pop()
      listing_id = mylisting_id.pop()
      combined = f"{id},{listing_id},{amenity_id}\n"
      with open("ListingsAmenities.csv","a") as f:
        f.write(combined)


def generate_fake_listings():
    """Create a csv file named Listings.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """
    combined = f"id,user_id,title,property_type,room_type,accommodates,bedrooms,bathrooms,price_per_night,address_id\n"
    myaddress_id = [1,2,3,4,5,6,7,8,9,10,11]
    myuser_id = [4,3,2,1,5,6,7,8,9,11,10]
    mytitle = ['Grand Hotel','Serenity Spa & Resort','Hotel de Paris','The Four Seasons',\
               'Hilton Hotels & Resorts','The Waldorf Astoria','The Plaza Hotel','The Mandarin Oriental',\
                'The Peninsula','Park Hyatt','Hilltop Hideaway']
   
    with open("Listings.csv","w") as f:
      f.write(combined)
  

    for i in range(11):
       fake = Faker()
       id = i + 1
       user_id = myuser_id.pop()
       title = mytitle.pop()
       property_type = random.choice(['apartment', 'house', 'villa'])
       room_type = random.choice(['private room', 'shared room', 'entire home/apt'])
       accommodates = random.randint(1, 10)
       bedrooms = random.randint(1, 6)
       bathrooms = random.randint(1, 3)
       price_per_night = random.randint(50, 500)
       address_id = myaddress_id.pop()

       combined = f"{id},{user_id},{title},{property_type},{room_type},{accommodates},{bedrooms},{bathrooms},{price_per_night},{address_id}\n"
       with open("Listings.csv","a") as f:
         f.write(combined)



def generate_fake_reservations():
    """Create a csv file named Reservation.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """
    
    combined = f"id,guest_id,listing_id,check_in_date,check_out_date,total_cost\n"
    mylisting_id = [10,1,2,3,4,5,8]
    myguest_id = [13,13,13,12,15,18,12]

    with open("Reservations.csv","w") as f:
      f.write(combined)

    for i in range(7):
      id = i + 1

      fake = Faker()
    
      guest_id = myguest_id.pop()
    
      listing_id = mylisting_id.pop()  
      
      # Generate check-in date between 5 years ago and today
      check_in_date = fake.date_time_between(start_date='-5y', end_date='now')

      # Generate check-out date between check-in date and today
      check_out_date = fake.date_time_between(start_date=check_in_date, end_date='now')

      total_cost = random.randint(2000, 9000)

      combined = f"{id},{guest_id},{listing_id},{check_in_date},{check_out_date},{total_cost}\n"
   
      with open("Reservations.csv","a") as f:
        f.write(combined)


def generate_fake_payments():
    """Create a csv file named Payments.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """
    combined = f"id,payment_method,payment_date,amount\n"
  
    start_date = datetime.date(2020, 1, 1)
    end_date = datetime.date(2023, 5, 1)
    delta = end_date - start_date
    

    with open("Payments.csv","w") as f:
      f.write(combined)

    for i in range(7):
      id = i + 1

      fake = Faker()
      
      payment_method = random.choice(['Visa', 'Mastercard', 'American Express'])
  
      random_date = start_date + datetime.timedelta(days=random.randint(0, delta.days))

      payment_date = random_date.strftime('%Y-%m-%d')


      amount = random.randint(2000, 15000)
      
      combined = f"{id},{payment_method},{payment_date},{amount}\n"
   
      with open("Payments.csv","a") as f:
        f.write(combined)


if __name__=='__main__':
   
    try:
       os.remove("Reservations.csv")
       os.remove("Payments.csv")
       os.remove("ListingsAmenities.csv")
       os.remove("Listings.csv")
       os.remove("Amenities.csv")
    except FileNotFoundError as e:
       print(f"{e} already deleted")
    finally:
       generate_fake_payments()
       generate_fake_reservations()
       generate_fake_ListingsAmenities()
       generate_fake_listings()
       generate_fake_amenities()