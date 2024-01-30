import sys
import datetime
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine, Date, Enum
import mysq
import pandas as pd
import os,socket
import mysql.connector


def getConn(host,user,password,db):
    cnx = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        db=db
    )
    return cnx

class Filter():
    def __init__(self):
       self.cnx = getConn(os.environ.get('MYSQL_HOST'),
                os.environ.get('MYSQL_USER'),
                os.environ.get('MYSQL_ROOT_PASSWORD'),
                os.environ.get('MYSQL_DATABASE'))
       self.cur = self.cnx.cursor()
    def filter(self):
        pass


class Filter_by_rating(Filter):
    # Filter listings based on a minimum rating
    def filter(self,rating):
        query = """select title,price_per_night,property_type from Listings
        where id in (select listing_id from Reviews where rating > %s) limit 4;"""
        self.cur.execute(query,(rating,))
        rows = self.cur.fetchall()
        return rows
    
class Filter_by_price(Filter):
   def filter(self,min_price,max_price):
      
        query1 = """select title,price_per_night,property_type from Listings where price_per_night between %s and %s limit 4""" 
        self.cur.execute(query1,(min_price,max_price))
        rows = self.cur.fetchall()
        return rows
     
class Filter_by_location(Filter):
   def filter(self,location):
        
        query1 = f"""select title,price_per_night,property_type from Listings a
        inner join Listing_addresses b on a.address_id = b.id
        where city like '%{location}%' limit 4""" 

        self.cur.execute(query1)
        rows = self.cur.fetchall()

        return rows

                    