"""
This class in the main class, and its called whenever the applicaiton runs.
A user can either insert, delete, modify, or print Report data from the adventure database.
"""
from Delete import *
from Add import *
from Modify import *
from Report import *

class Main(object):
    
    def application(self):
        toExit = input("Press ENTER to continue\n")
        q = False
        while q == False:
                #prompt the user as to what they would like to do
                print("\nWhat would you like to do?")
                usr_input = input("\nEnter: Insert - Delete - Modify - Report.\nTo Exit enter 'q'\n")
                usr_input = usr_input.lower()
                
                if usr_input == 'delete':
                    #open the delete class
                    b = Delete()
                    b.checkTour()
                elif usr_input == 'insert':
                    #open the insert class
                    c = Add()
                    c.usrInputForInsert()
                elif usr_input == 'modify':
                    #open modify class
                    d = Modify()
                    d.updateInput()
                elif usr_input == "report":
                    a = Report()    
                    a.reportInput()
                #quit the program   
                elif usr_input == 'q':
                    print("End the Program")
                    q = True
                    return
                else:
                    print('Invalid choice\n')
#                    self.application()
                    usr_input = input("\nEnter: Insert - Delete - Modify - Report.\nTo Exit enter 'q'\n")

#start application
a = Main()
a.application()

