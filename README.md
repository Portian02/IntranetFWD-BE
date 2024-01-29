Forward Costa Rica Project - Backend
Educational management application focused on providing quality education in frontend and backend programming. The application is built with Ruby on Rails and uses various gems for authentication, model management, and JWT token security.
Steps to Clone and Improve the Project
Clone the Repository:
Clone this repository to your local machine using the following command:
Bash

git clone https://github.com/Portian02/IntranetFWD-BE.git
Install Dependencies:
Make sure you have Ruby and Rails installed on your system.
Navigate to the project directory and run the following command to install the project dependencies:
Copy code

bundle install
Database Configuration:
Configure the database on your local environment according to the specifications in config/database.yml.
Run the migrations to create the tables in the database:

rails db:migrate
Run the Server:
Once the database is configured, run the Rails server with the following command:
rails s
The server will be available at http://localhost:3000 by default.
