### DB setup
1. psql -U postgres
2. create role myapp with createdb login password 'password1';

###### reference: https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres

### how to run app
1. Make sure that Postgres is running
2. Make sure you are inside iTravel directory
3. type ``` rails s ```
4. Go to ```http://localhost:3000/``` in your browser
