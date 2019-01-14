"""
This class delete item from the table Reservation of the database adventures.
It first shows the user what data is in the table, and then prompts the user if
the would like data to be deleted based on the id number.
"""
import mysql.connector
from mysql.connector import connect, cursor

class Delete(object):
    #function to delete data from the database
    def deleteTour(self, tour_id):
        query = "DELETE FROM reservation WHERE rid = %s"
        try:
            #start coonnection
            self.db = mysql.connector.connect(user='root', database='adventure', password="Paradis10")
     
            # execute the query
            cursor = self.db.cursor()
            cursor.execute(query, (tour_id,))
     
            # accept the change
            self.db.commit()
            print("Costumer has been successfully removed")
            
        except mysql.connector.Error as error:
            print(error)
        finally:
            cursor.close()
            self.db.close()

    #function to diplay the item within the tour table
    def displayTourTable(self):
            query = "SELECT * FROM reservation"
            try: 
                #start coonnection
                self.db = mysql.connector.connect(user='root', database='adventure', password="Paradis10")
         
                # execute the query
                cursor = self.db.cursor()
                cursor.execute(query)
         
                # display tour table
                row = cursor.fetchone()
                while row is not None:
                  print(row)
                  row = cursor.fetchone()

                #ask the user if they want to delete a reservation
                self.deleteTourInput()                                
            except mysql.connector.Error as error:
                print(error)

    #function to prompt the user if the would like to delete data from the
    #table
    def deleteTourInput(self):
        try:
            delTour = input("\nWould you like to delete a Reservation?: ")
            delTour = delTour.lower()
            #if yes then pick which Reservation
            if delTour == 'yes' or delTour == 'y':
                tour = input("\nEnter the Reservation's Id: ")
                self.deleteTour(tour)
            elif delTour == 'no' or delTour == 'n':
                return
            else:
                print("Not valid input. Enter 'Y' or 'N'")
                self.deleteTourInput()           
        except mysql.connector.Error as error:
            print(error)

    #main function which calls the displayTourTable() in order for the user to check
    #whats on the database
    def checkTour(self):
        try:
            input('\nPress Enter to check all the Reservations ')
            self.displayTourTable()
        except mysql.connector.Error as error:
            print(error)
            
"""
b = Delete()
b.checkTour()
"""

