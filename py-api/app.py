#!/usr/bin/env python
from flask import jsonify
from flask import Flask, render_template, request
import os
from listings_filter import Filter, Filter_by_price, Filter_by_location, Filter_by_rating
import datetime

app = Flask(__name__)


@app.route('/')
def display_menu():
    return render_template('menu.html')


@app.route('/filter/rating', methods=['GET', 'POST'])
def filter_by_rating_route():
    if request.method == 'POST':
        # Validate rating
        try:
            rating = int(request.form['rating'])
            if 1 <= rating <= 10:
                print("Valid rating..")
                by_rating = Filter_by_rating()
                rows = by_rating.filter(rating)
            else:
                print("Rating must be between 1 and 10")
        except ValueError:
            print("Rating must be a valid integer..")

        dict_data = []
        for title, price_per_night, prop_type in rows:
            dict_data.append({'title': title, 'price_per_night': price_per_night,
                              'property_type': prop_type})

        return jsonify(dict_data)
    return render_template('filter_rating.html')


@app.route('/filter/price', methods=['GET', 'POST'])
def filter_by_price_route():
    if request.method == 'POST':

        try:
            min_price = float(request.form['min_price'])
            max_price = float(request.form['max_price'])
            if max_price > min_price:
                print("Valid min price and max price..")

                by_price = Filter_by_price()
                rows = by_price.filter(min_price, max_price)
            else:
                print("Max price must be greater than min price..")
        except ValueError:
            print("Max price and min price must be floating numbers..")

        dict_data = []
        for title, price_per_night, prop_type in rows:
            dict_data.append({'title': title, 'price_per_night': price_per_night,
                              'property_type': prop_type})

        return jsonify(dict_data)
    return render_template('filter_price.html')


@app.route('/filter/location', methods=['GET', 'POST'])
def filter_by_location_route():
    if request.method == 'POST':

        try:
            city = request.form['location']

            by_price = Filter_by_location()
            rows = by_price.filter(city)

        except ValueError:
            print("City not found in the database")

        dict_data = []
        for title, price_per_night, prop_type in rows:
            dict_data.append({'title': title, 'price_per_night': price_per_night,
                              'property_type': prop_type})

        return jsonify(dict_data)
    return render_template('filter_location.html')


@app.route('/create/users', methods=['GET', 'POST'])
def create_users():
    if request.method == 'POST':
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        email = request.form['email']
        phone = request.form['phone_number']
        dob_str = request.form['DoB']
        gender = request.form['gender']
        country = request.form['country']
        user_type = request.form['user_type']

        # Validate DoB as a date format
        try:
            dob = datetime.datetime.strptime(dob_str, '%Y-%m-%d')
        except ValueError:
            return 'Invalid date format for DoB', 400

        gender = gender.lower()
        user_type = user_type.lower()

        # Validate gender
        if gender not in ["male", "female"]:
            return 'Invalid gender value', 400

        # Validate user_typr
        if user_type not in ["guest", "host"]:
            return 'Invalid user_type'

        obj = Filter()
        cur = obj.cur
        cnx = obj.cnx

        print("Ready to load data to mysql database...")

        # Query the max id in the Users table
        cur.execute("""select max(id) from Users""")
        res = cur.fetchone()
        max_id = res[0] + 1

        cur.execute("""INSERT INTO Users (id, first_name, last_name, email, phone_number, DoB, gender, country, user_type)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""", (max_id, first_name, last_name, email, phone, dob, gender, country, user_type))

        cnx.commit()

        query = "SELECT * FROM Users ORDER BY id DESC LIMIT 1"

        cur.execute(query)

        res = cur.fetchone()

        print(res)


@app.route('/quit')
def quit():
    return "Goodbye!"


# app.run(debug=True)
app.run(host="0.0.0.0")
