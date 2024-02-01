import sys
import datetime
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine, Date, Enum
import pandas as pd
import os
import socket
import mysql.connector


def getConn(host, user, password, db):
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
        """
        Placeholder method for filtering listings.

        This method should be overridden by subclasses to implement specific
        filtering logic based on different criteria.
        """
        pass


class Filter_by_rating(Filter):
    def filter(self, rating):
        """
        Filters listings based on a minimum rating.

        Parameters:
        - rating: Minimum rating threshold.

        Returns:
        - List of tuples containing title, price_per_night, and property_type of listings.
        """
        query = """select title,price_per_night,property_type from Listings
        where id in (select listing_id from Reviews where rating > %s) limit 4;"""
        self.cur.execute(query, (rating,))
        rows = self.cur.fetchall()
        return rows


class Filter_by_price(Filter):   
    def filter(self, min_price, max_price):
        """
        Filters listings based on a price range.

        Parameters:
        - min_price: Minimum price threshold.
        - max_price: Maximum price threshold.

        Returns:
        - List of tuples containing title, price_per_night, and property_type of listings.
        """

        query1 = """select title,price_per_night,property_type from Listings where price_per_night between %s and %s limit 4"""
        self.cur.execute(query1, (min_price, max_price))
        rows = self.cur.fetchall()
        return rows


class Filter_by_location(Filter):
    def filter(self, location):
        """
        Filters listings based on a location (city).

        Parameters:
        - location: City name or part of the city name.

        Returns:
        - List of tuples containing title, price_per_night, and property_type of listings.
        """
        query2 = f"""select title,price_per_night,property_type from Listings a
        inner join Listing_addresses b on a.address_id = b.id
        where city like '%{location}%' limit 4"""

        self.cur.execute(query2)
        rows = self.cur.fetchall()

        return rows
