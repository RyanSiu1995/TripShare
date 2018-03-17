# CSCI 3100 Software Engineering Project Usage

## Docker Setup:
This application support the docker. Please follow the instructions to build the images and run the application.

1. Turn the docker on. You may check up https://www.docker.com to setup the docker environment.

2. Navigate to the application folder:
    ```bash
    cd ./iTravel
    ```
3. Build the image of the application:
    ```bash
    sudo docker-compose build 
    ```
4. Launch the image:
    ```bash
    sudo docker-compose up
    ```
5. Open another terminal and navigate back to application folder. Send the DB reset signal to the containers:
    ```bash
    sudo docker-compose run web rails db:reset
    ```
6. You can now access the application through http://localhost:3000.

## Local Setup:

### Environment setup
1. Install Ruby and Ruby on Rails:
    ```bash
    sudo apt-get install ruby ruby-dev zlib1g-dev
    sudo gem install rails
    ```
2. Install JS interpreter. Here nodeJS is recommended:
    ```bash
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
    sudo apt-get install -y nodejs
    ```
    Please check https://nodejs.org/en/download/package-manager/ for the installation guide for other OS
http://installrails.com/ (pretty straight forward tutorial to install this framework)

### Database setup
1. Enter the PostgresSQL with admin user by following command:
```bash
psql -U postgres
```
2. Create the role for this application:
```sql
create role iTravel with createdb login password 'password1';
```
###### reference: https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres

### App setting
1. Set up the packages required and database reset:
    ```bash
        bundle install
        rails db:reset
    ```

### Running the application
1. Once you have finish all the setting up, you can launch the application by following command:
    ```bash
        rails s
    ```
2. The application will run in http://localhost:3000/

#### References:
- [1] https://www.railstutorial.org/book (Learn by doing)
- [2] [MVC in action](https://www.railstutorial.org/book/toy_app#sec-mvc_in_action)
- [3] [Search in rails] (https://stackoverflow.com/questions/12010780/search-in-rails)

- [rails db:options](https://stackoverflow.com/questions/10301794/difference-between-rake-dbmigrate-dbreset-and-dbschemaload)
