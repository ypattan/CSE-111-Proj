import sqlite3
from sqlite3 import Error
from datetime import datetime

user = stawberry

def openConnection(_dbFile):
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("open success")
    except Error as e:
        print(e)

    return conn


def closeConnection(_conn, _dbFile):
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("close success")
    except Error as e:
        print(e)

# def addToHistory(_restkey){
    
# }


def generateRestaurant(_cuisine, _rating, _pricing, _diningStyle, _conn):
    
    try:
        print("Generating restaurant...")

        sql = """SELECT * 
        FROM restaurants, order_options
        WHERE restaurants.cuisine = ? 
        AND restaurants.rating = ?
        AND restaurants.pricing = ?
        AND restaurants.dining_key = order_options.order_options"""
        args = [_cuisine, _rating,_pricing]

        cur = _conn.cursor()
        cur.execute(sql, args)
        
        if _diningStyle == 1:
            options = "dine-in only"
        elif _diningStyle == 2:
            options = "take-out only"
        else:
            options = "both"
        row = cur.fetchone()
        restkey = row[0]
        print("Restaurant: " + row[1])
        print("Address: " + row[2]) 
        print("Rating: " + str(row[4]))
        print("Pricing: " + row[5]) 
        print("Dining Options: ",options) 

         # ask if they would like to leave feedback
        give_feedback = input("Would you like to leave feedback? (y/n)")

        if give_feedback == "y":



        # add to user history
        # addToHistory(restkey)

       
    except Error as e:
        print(e)

    menu()




def chooseOptions():
    print("1    mexican")
    print("2    italian")
    print("3    greek")
    print("4    indian")
    print("5    thai")
    cuisine = input("Choose a cuisine: ")

    while cuisine < "1" or cuisine > "5":
        cuisine = input("Not an acceptable answer. Try again: ")

    print("Preferred  minimum restaurant rating? (Between 1 - 5)")
    rating = input("Choose rating: ")

    while rating < "1" or rating > "5":
        rating = input("Not an acceptable answer. Try again: ")

    print("Preferred  maximum restaurant pricing? (Between $ - $$$$$)")
    pricing = input("Choose pricing: ")

    while pricing < "1" or pricing > "5":
        pricing = input("Not an acceptable answer. Try again: ")

    if pricing == "1":
        pricing = "$"
    elif pricing == "2":
        pricing = "$$"
    elif pricing == "3":
        pricing = "$$$"
    elif pricing == "4":
        pricing = "$$$$"   
    elif pricing == "5":
        pricing = "$$$$$" 
    
    print("1    Dine-in")
    print("2    Take-out")
    print("3    Both")
    diningStyle = input("Choose preferred dining style:  ")

    while diningStyle < "1" or diningStyle > "3":
        diningStyle = input("Not an acceptable answer. Try again: ")
    
    return cuisine, rating, pricing, diningStyle
    
    

    

    

def menu():
    print("Menu (type number to choose task):")
    print("1    Generate a Restaurant")
    print("2    View User History")
    print("3    View Saved User Preferences")
    print("4    Exit")
    return input("Enter choice: ")



def main():
    database = r"data.sqlite"
    conn = openConnection(database)

    task = menu()
    
    if task == "1":
        cuisine, rating, pricing, diningStyle = chooseOptions()
        generateRestaurant(cuisine, rating, pricing, diningStyle, conn)

        # if task == "2":




if __name__ == '__main__':
    main()