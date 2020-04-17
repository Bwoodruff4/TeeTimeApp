# Welcome to the Tee Time Scheduling App!!

### Overview:
  _This app is a CLI application built with Ruby 2.6.1 and ActiveRecord_

  _Allows data entry for making tee time reservations at golf courses saved in the database._

  _When a user makes a reservation, they are asked to enter in golfer information and enter a reservation time._
  
  #### Gems:
  ```
  "pry"
  "activerecord"
  "sinatra-activerecord"
  "rake"
  "sqlite3"
  "require_all"
  "rest-client"
  "colorize"
  ```
  
  #### API
  ```
  Open Weather API -> URL: https://openweathermap.org/api
  ```
  
  ### Features:

  #### The user has the capability to:
  ```
  - cancel reservations
  - find all of their reservations
  - change their party size and handicap information
  - find courses and information about the courses stored in the database
  - check weather conditions at the courses in the database.
  ```

  #### List of User Commands:
  ```
  - 'help' - Displays list of commands                              
  - 'make reservation' - Allows user to make Tee Time reservation 
  - 'cancel reservation' - Allows user to cancel Tee Time reservation
  - 'find reservations' - Finds golfer's reservations                
  - 'change party' - Allows user to change their party size          
  - 'change handicap' - Allows user to change their handicap         
  - 'find courses' - Displays list of available courses              
  - 'course weather' - Displays course weather given a course name  
  - 'exit'- Quits the program         
  ```

 #### List of DataBase Methods:
 ```
  - Average Golfer Age -> (Golfer.average_age)
  - Average Golfer Handicap -> (Golfer.average_handicap)
  - Average Party Size -> (Teetime.average_party_size)
 ```
 
 ## Interface
 
 
 
