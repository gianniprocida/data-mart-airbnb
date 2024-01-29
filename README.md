# A Use-Case of booking a hotel room:Airbnb

Refer to the document `Assignments-Portfolio_DLBDSPBDM01-2.pdf` for more info about the database development.


## Database creation using docker

If you don't want to create the databse you can skip this part and jump into the section [How to Dockerize the MySQL Database?](#how-to-dockerize-the-mysql-databaseREADME.md). Clone the repository to your local machine, then navigate to the project folder and to the 'database_creation' folder. 
Run the following command to create a Docker container named "mysql-c1" with MySQL 8.0

```
docker run -d \
  --name mysql-c1 \
  -v "$(pwd):/app" \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:8.0
```
* docker run: Initiates the creation and execution of a new Docker container.
* -d: Runs the container in detached mode, meaning it runs in the background.
* --name mysql-c1: Assigns the name "mysql-c1" to the Docker container, allowing you to reference it by this name.
* -v "$(pwd):/app": Mounts the current working directory on the host machine ($(pwd)) to the /app directory inside the container.
* -e MYSQL_ROOT_PASSWORD=secret: Sets the environment variable MYSQL_ROOT_PASSWORD inside the container to "secret". 
* -e MYSQL_DATABASE=todos: Sets the environment variable MYSQL_DATABASE inside the container to "todos". 
* mysql:8.0: Specifies the Docker image to use for creating the container. In this case, it uses the official MySQL 8.0 image from the Docker Hub.

Once the container is up and running,log into it:

```
docker exec -it mysql-c1 sh
```

Go to `app` folder and execute the SQL scripts one by one. You will prompted to
insert the password each time:

```
mysql -u root -p < create_tables.sql
```

```
mysql -u root -p < add_primary_keys.sql
```


```
mysql -u root -p < add_foreign_keys.sql
```

You can log into the data_mart_airbnb database to check whether the tables 
have been created and constraints have been added:

```
mysql -u root -p
```

```
use data_mart_airbnb;
```

```
show tables;
show create table `<yourtable>`;
```

`show tables` will list all the tables present in the `data_mart_aibnb`, while `show create table <yourtable>` will show all the information about the columns, their data types, constraints (e.g., PRIMARY KEY).

Execute the script `run_all_scripts.sh` that will do the following things:
1. Install necessary Python packages (pandas, SQLAlchemy, etc.).
2. Create the CSV files for each table
3. Fill tables using data in the csv files:

Finally, create a MySQL dump of the database: 

```
mysqldump -u root -p data_mart_airbnb > data_mart_airbnb.sql
```

The file will be visible in your current directory because we established a 
link between this directory and the directory within the container.



## Conception phase 
The definition of tables, their structures, and the constraints adhered to a well-thought-out process. If you are curious, feel free to explore the details below. 


![diagram](entity-relationship-diagram.png)

This detailed Entity-Relationship Diagram (ERD) model provides a segment of our database model designed for the Airbnb use case. The squares represent our entities, each populated with attributes relevant to the respective entities. The arrows between the squares indicate how the entities relate to one another.

![diagram](relationships.png)



## How to Dockerize the MySQL Database?


The approach of Dockerizing the Database, involves utilizing Docker CLI tools. When aiming to construct an application stack comprising multiple componentes, it is advisable to leverage Docker Compose. Below is the YAML file definition for this configuration:


```
services:
  mysqlc1:
    image: mysql
    ports:
     - "127.0.0.1:3306:3306"
    volumes: 
     - ./db/data_mart_airbnb.sql:/docker-entrypoint-initdb.d/data_mart_airbnb.sql
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: data_mart_airbnb
```

* services: This is a key indicating the start of the service definitions. In container orchestration tools like Docker Compose, a service represents a containerized application or a microservice.

* mysqlc1: This is the name of the service. 

* image: mysql: Specifies the Docker image to use for this service. 

* ports: Specifies the port mapping, indicating that port 3306 on the host machine (127.0.0.1) should be mapped to port 3306 in the container. This allows you to access the MySQL service running inside the container from your host machine.

* volumes: Mounts a local file (./db/data_mart_airbnb.sql) into the container at /docker-entrypoint-initdb.d/data_mart_airbnb.sql. This is used to initialize the MySQL database with custom SQL scripts at startup.

* environment: Sets environment variables for the MySQL container. In this case:


