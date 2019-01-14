import mysql.connector
from mysql.connector import connect, cursor

class Report(object):
    def addReport(self, usr_input):
        query = "select tourDate, numPersons, price from reservation where rid = %s"

        try:
            #start conncetion
            self.c = connect(user="root", db="adventure", password="Paradis10")

            #established connection
            cur = self.c.cursor()         
            cur.execute(query, (usr_input,))
            print(cur.fetchall())
        except mysql.connector.Error as err:
            print(err)
        finally:
            cur.close()
            self.c.close()

    def reportInput(self):
        try:
            rInput = input("Would you like to know your reservation information? ")
            rInput = rInput.lower()
            if rInput == 'yes' or rInput =='y':
                resId = input("Enter your reservation ID: ")
                self.addReport(resId)
            elif rInput == 'no' or rInput =='n':
                print("Okay, thank you!")
                return
            else:
                return
        except mysql.connector.Error as err:
            print(err)

"""
a = Report()    
a.reportInput()
"""
