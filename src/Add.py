"""
Class to add data to the table Tour in the database Adventure.
This prompts the data needed to succesfully insert data into the table.
Also prompt the user to add more tours.
"""
import mysql.connector
from mysql.connector import connect, cursor

#start of class
class Add(object):
    #fucntion to insert into the tour table
    def insert(self, id, name, location, state, distance, max_group_size, type, season):
        #query mysql to insert into table
        query = ("INSERT INTO tour "
                   "(tid, name, location, state, distance, maxGroupSize, type, season)"
                   "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
        args = (id, name, location, state, distance, max_group_size, type, season)

        try:
            self.db = mysql.connector.connect(user='root', database='adventure', password="Paradis10")
            cursor = self.db.cursor()
            cursor.execute(query, args)

            if cursor.lastrowid:
                print('last insert id', cursor.lastrowid)
            else:
                print("The following was added to the table: ")
                print(args)
            self.db.commit()
            self.addTour(self.db, cursor)
    
        except mysql.connector.Error as error:
            print("\n" + "There was an error")
            print(error)
            print('\n' + "Please type valid input" + "\n")
            self.usrInputForInsert()
     
    #insert tour into the tour table
    def addTour(self, db, cursor):
        inpt = input("\nAdd another tour Y or N:\n")
        inpt = inpt.lower()
        try:
            if inpt == "yes" or inpt == 'y':
                usrInputForInsert()
            elif inpt == "no" or inpt == 'n':
                print("No more things to insert.")
                cursor.close()
                self.db.close()
                
            else:
                print("No valid input. Try 'Yes' or 'No'.")
                sel.addTour(self.db, cursor)
                
        except mysql.connector.Error as error:
            print("There was an error")
            print(error)
            
    #prompts user for the data in order making it easier for the user.
    def usrInputForInsert(self):
        print("Please enter a new tour")
        tid = input("Enter id: ")
        name = input("Enter name: ")
        location = input("Enter Location: ")
        state = input("Enter State: ")
        distance = input("Enter Distance: ")
        max_size = input("Enter Max Group Size: ")
        tour_type = input("Enter Tour Type: ")
        season = input("Enter Season: ")
        self.insert(tid, name, location, state, distance, max_size, tour_type, season)

"""      
c = Add()
c.usrInputForInsert()
"""

