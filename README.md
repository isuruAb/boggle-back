# Boggle Game -Backend
Boggle is a word game that is played on a 4x4 board with 16 letter tiles. 
The goal is to find as many words as possible given a time constraint.  
For this exercise, we are making one modification.  Now it is possible for one or more of the letter tiles to be blank (denoted by *).  
When a tile is blank, it can be treated as any other letter.  Note that in one game it does not have to be the same character for each word.  

## Setup - Manual

- Clone the project and move to the project directory using terminal
- Install dependencies using this command `bundle install`
- Before go to below steps you have to start 'MYSQL server' and update your database details(port, username, password etc) in 'config/database.yml'
- Create a database using this command `rails db:create` 
- Migrate tables to the database using this `rails db:migrate`
- Run the application using this command `rails s` this will run the application on port 3001 (you should have rails installed in your computer)

## If needed
- Check Routes `rails grape:routes`
- Check API Swagger [http://localhost:3001/v1/swagger_doc](http://localhost:3001/v1/swagger_doc)

## Frontend Application

- Setup Frontend application [https://github.com/isuruAb/boggle-front](https://github.com/isuruAb/boggle-front)

## Dependencies
- Install rails on mac (Refer below linnk to install rails)
 [https://gorails.com/setup/osx/10.13-high-sierra](https://gorails.com/setup/osx/10.13-high-sierra)
- Install bundler `gem install bundler`

## Docker deployment