#Install all Python dependencies required to execute the Python scripts


pip3 install SQLAlchemy
pip3 install numpy 
pip3 install pandas
pip3 install mysql-connector-python

pip3 install Faker


echo "Dependencies successfully created"

sleep 2;

python3 create_csvFiles1.py
python3 create_csvFiles2.py
python3 create_csvFiles3.py

# Displaying the list of files in the current directory
echo "$(ls)"

# Informing that CSV files have been successfully created
echo "CSV files have been successfully created."

# Pausing for 2 seconds before the next operation
sleep 2

# Informing about the process of filling MySQL tables with data from CSV files
echo "Filling MySQL tables with data from CSV files."

python3 Populate.py
