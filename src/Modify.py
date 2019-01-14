"""
This class modifies the Reservation table in the database Adventure.
Prompts the user id the would like to modify their adventure and allows the user
enter the new data to modify the table.
"""
import mysql.connector
from mysql.connector import connect, cursor

class Modify(object):
    #fucntion to update the reservation table 
    def update(self, date, rid):
        #query mysql to update a table
        query = """ UPDATE reservation
                SET tourDate = %s
                WHERE rid = %s """
        data = (date, rid)
        try:
            self.c = connect(user="root", db="adventure", password="Paradis10")
            cur = self.c.cursor()
            cur.execute(query, data)
            self.c.commit()
            print("Your reservation date has been changed")
            
        except mysql.connector.Error as err:
            print(err)
            self.updateInput()
            
        finally:
            cur.close()
            self.c.close()
            
    #prompts user for data in order to modify the table
    def updateInput(self):
        change = input("Would you like change the date of your adventure? ")
        change = change.lower()
        if change == "yes" or change == 'y':
            date = input("What is the new date? Format('YYYY-MM-DD') ")
            id = input("What is the ID of your reservation? ")
            self.update(date, id)
        elif change == 'no' or change == 'n':
            return
        else:
            print("Invalid input. Enter 'Y' or 'N'")
            change = input("Would you like change the date of your adventure? ")

"""
d = Modify()
d.updateInput()
"""
