# Api-exercise

  - https://api-exercises.herokuapp.com/ - heroku

## Requirements
  - Ruby 2.6.1
  - Docker
  - docker-compose
## Installation
First your need to run this command in application folder
  ```
    docker-compose build
  ```
Then you could start docker with this command
   ```
    docker-compose up
  ```
In another terminal window you need to create db with this command
  ```
  docker-compose run web rake db:create
  ```
And complete its migrations with this
  ```
  docker-compose run web rake db:migrate
  ```
You could use this application on http://localhost:3000/
If its not available you(or me) did something wrong :)
##Usage
With this application you can load commits from public github repositories.
Just fill form with repository owner, its name and author of commits email.
