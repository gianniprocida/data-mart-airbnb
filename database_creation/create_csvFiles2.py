from faker import Faker
import random
import os
import csv 


# This script creates five CSV files - Listing_addresses, Users, Messages, User_addresses, Reviews, and
# Messages.


def generate_fake_listing_addresses():
    """Create a csv file name Listing_addresses.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """

    combined = f"id,street_name,house_number,city,country,zip_code\n"

    with open("Listing_addresses.csv","w") as f:
      f.write(combined)

    for i in range(13):
      id = i+1
      fake = Faker()
      # Generate a fake street address
      street_name = fake.street_name()

      # Generate house number
 
      house_number = fake.building_number()

      # Generate a fake city
      city = fake.city()

      # Generate a fake state
      country = fake.country()

      # Generate a fake zip code
      zip_code = fake.zipcode()

      combined = f"{id},{street_name},{house_number},{city},{country},{zip_code}\n"
      with open("Listing_addresses.csv","a") as f:
        f.write(combined)




def generate_fake_user_addresses():
    """Create a csv file name User_addresses.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """

    combined = f"id,street_name,house_number,city,country,zip_code\n"

    with open("User_addresses.csv","w") as f:
      f.write(combined)

    for i in range(20):
      id = i+1
      fake = Faker()
      # Generate a fake street address
      street_name = fake.street_name()

      # Generate house number
 
      house_number = fake.building_number()

      # Generate a fake city
      city = fake.city()

      # Generate a fake state
      country = fake.country()

      # Generate a fake zip code
      zip_code = fake.zipcode()

      combined = f"{id},{street_name},{house_number},{city},{country},{zip_code}\n"
      with open("User_addresses.csv","a") as f:
        f.write(combined)



def generate_fake_reviews():
    """Create a csv file name Reviews.csv with fake data.
    
    Args: 
        None

    Returns:
        None            
    """

    combined = f"id,listing_id,user_id,content,review_date,rating,host_response\n"
    mylisting_id = [5,1,2,3,3,4,4,10,11,8]
    myuser_id = [12,13,14,15,16,17,18,19,20,21]
    fake = Faker()

    with open("Reviews.csv","w") as f:
      f.write(combined)
  
    for i in range(9):
       id = i+1
       listing_id = mylisting_id.pop()
       user_id = myuser_id.pop()
       content = fake.sentence(nb_words=6, variable_nb_words=True, ext_word_list=None)
       review_date = fake.date_between(start_date='-5y', end_date='today')
       rating = random.randint(1,6)
       host_response = fake.sentence(nb_words=6, variable_nb_words=True, ext_word_list=None)
       combined = f"{id},{listing_id},{user_id},{content},{review_date},{rating},{host_response}\n"
       with open("Reviews.csv","a") as f:
         f.write(combined)
  


def generate_fake_users():
    """Create a csv file name Users.csv with fake data..
    
    Args: 
        None

    Returns:
        None            
    """
    combined = f"id,first_name,last_name,email,phone_number,DoB,gender,country,user_type\n"
    fake = Faker()
    guest_list =["guest"]*10
    host_list = ["host"]*11
    tot = guest_list + host_list
    with open("Users.csv","w") as f:
      f.write(combined)
  
    for i in range(21):
       id = i+1
       first_name = fake.first_name()
       last_name = fake.last_name()
       email = fake.email()
       phone_number = fake.phone_number()
       fake_dob = fake.date_of_birth(minimum_age=18, maximum_age=100)
       DoB = fake_dob.strftime('%Y-%m-%d')
       gender = random.choice(['Female', 'Male'])
       country = fake.country()
       user_type = tot.pop()

       combined = f"{id},{first_name},{last_name},{email},{phone_number},{DoB},{gender},{country},{user_type}\n"
       with open("Users.csv","a") as f:
         f.write(combined)

def generate_fake_messages():
    """Create a csv file name Messages.csv with fake data..
    
    Args: 
        None

    Returns:
        None            
    """
    combined = f"id,sender_id,recipient_id,content,date_sent\n"
    mysender_id = [12,12,12,12,12]
    myrecipient_id = [2,2,2,2,2]
    mycontent = ["\"Hi,I'm interested in your listing.Can you tell me more about it?\"",
                 "\"Sure, what would you like to know?\"","\"Is the room available from May 10\"",
                 "\"Yes, it's available. Would you like to make a reservation?\"",
                 "\"Thanks for the information. Can you tell me more about the amenities?\""]
    
    with open("Messages.csv","w") as f:
      f.write(combined)

    for i in range(5):
      id = i
      fake = Faker()      
      sender_id = mysender_id.pop()
      recipient_id = myrecipient_id.pop() 
      content = mycontent.pop()   
      date_sent = fake.date_between(start_date='-5y', end_date='today')
      combined = f"{id},{sender_id},{recipient_id},{content},{date_sent}\n"
   
      with open("Messages.csv","a") as f:
        f.write(combined)


if __name__=='__main__':
   
   try:
      os.remove("Listing_addresses.csv")
      os.remove("Reviews.csv")
      os.remove("Users.csv")
      os.remove("User_addresses.csv")
      os.remove("Messages.csv")
   except FileNotFoundError as e:
      print(f"{e} already deleted")
   finally:
      generate_fake_listing_addresses()
      generate_fake_reviews()
      generate_fake_users()
      generate_fake_user_addresses()
      generate_fake_messages()