# Adventure Time: Database Application with Python

The databases keeps track of the thrill seeking adventures for all the outdoorsy customers who like to enjoy nature.

### Goals
- Inserting new and exciting tours
- Deleting any cancelled reservations
- Reporting our customer’s reservations
- Modifying any of our customer’s adventure date due to inclement weather or unexpected events

### Database Structure
- Customer: This table holds all the important Customer contact information.
- Reservation: </br>
  • This table indicates :
    - The date of the adventure.
    - The number of people reserved for the adventure.
    - The price of the adventure per person.
- Tour: </br>
  • A basic term for our fun adventures where:
    - The cool name of each adventure is stored.
    - The location of each adventure.
    - The state in which each adventure takes place.
    - The distance (in miles) each adventure is.
    - The maximum group size each adventure can handle.
    - The type of adventure takes place (Hiking, Biking, or Paddling).
    - The season each adventure is offered in.
- Guide: This table holds all the necessary contact information for each adventurous guide member we have.
- TourGuide: Indicates the Guide(s) for each fun adventure.

### ERD 
This ERD shows the relationships among all the table in the database.

![](ERDiagram.png)

### Build With
Python </br>
MySQL

### Authors
Angela Raymond </br>
Darla Hongmanivanh

### License
This project is licensed under the MIT license, Copyright (c) 2018 Maximilian Stoiber. For more information see LICENSE.md.


