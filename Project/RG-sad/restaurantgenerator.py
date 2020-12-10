import sqlite3
from sqlite3 import Error
from datetime import datetime
signedin = False
current_user = "guest"
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


def view_history(_conn):
    c = _conn.cursor()
    print("Whose History would you like to check? ")
    print("1    yours (" + current_user + ")")
    print("2    guest")
    user = input()
    if user == "1":
        user = current_user
    else:
        user = "guest"

    sql = "SELECT * FROM user_history WHERE user = ?"
    c.execute(sql, [user,])
    for row in c.fetchall():
        print(row)


def addToHistory(_restkey, _feedbackkey, _conn):
    try:
        datetime.today().strftime('%Y-%m-%d')
        sql = """INSERT INTO user_history (user, date, restaurant_key, feedback_key)
                VALUES (?,?,?,?)"""
        args = [curr_user, datetime.today().strftime('%Y-%m-%d'), _restkey, _feedbackkey]
        cur = _conn.cursor()
        cur.execute(sql, args)
        _conn.commit()
        print("Updated your history")


    except Error as e:
        print (e)


def giveFeedback(_restKey,_conn):
    try:
        sql = """SELECT MAX(feedback_key) FROM user_feedback"""
        cur = _conn.cursor()
        cur.execute(sql)


        row = cur.fetchone()
        row_id = row[0]

        if row_id == None:
            row_id = 0

        user_rating = input("What rating would you give this restaurant? ")
        user_note = input("Do you have any notes about the restaurant? ")

        sql = """INSERT INTO user_feedback (feedback_key, user, restaurant_key, rating, note)
        VALUES(?,?,?,?,?)"""
        args = [row_id+1, current_user, _restKey, user_rating, user_note]

        cur.execute(sql,args)
        _conn.commit()
        print("saved your feedback")
        return row_id

    except Error as e:
        print(e)


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
        give_feedback = input("Would you like to leave feedback? (y/n) ")

        if give_feedback == "y":
            feedbackkey = giveFeedback(restkey,_conn)
        else:
            feedbackkey = None
        
        addToHistory(restkey, feedbackkey, _conn)
        
    except Error as e:

        print(e)

def chooseOptions():
    print("1    mexican")
    print("2    italian")
    print("3    greek")
    print("4    indian")
    print("5    thai")
    cuisine = input("Choose a cuisine: ")

    while cuisine < "1" or cuisine > "5":
        cuisine = input("Not an acceptable answer. Try again: ")

    print("Preferred  minimum restaurant rating? (Between 1 - 5) ")
    rating = input("Choose rating: ")

    while rating < "1" or rating > "5":
        rating = input("Not an acceptable answer. Try again: ")

    print("Preferred  maximum restaurant pricing? (Between 1 - 5) ")
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

def enterPassword (_conn, password):
    pw = input("Password: ")
    if pw == password:
        print("You signed in!")

    else:
        print("try again!")
        enterPassword(_conn, password)




def signin(_conn):
    current_user = input("Username: ")
    sql = "SELECT * FROM users WHERE username = ?"
    cur = _conn.cursor()
    arg = [current_user]
    cur.execute(sql, arg)


    row = cur.fetchone()
    if row == None:
        print("Would you like to try again?")
        print("1    yes")
        print("2    no, I will continue as a guest")
        tryagain = input()
        if tryagain == "1":
            signin(_conn)
        else:
            current_user = "guest"
            return
    elif row != None:
        un = row[0]
        if (current_user == un):
            # password
            enterPassword(_conn, row[1])
        else:
            print("Would you like to try again?")
            print("1    yes")
            print("2    no, I will continue as a guest")
            tryagain = input()
            if tryagain == 1:
                signin(_conn)
            else:
                return



def main():
    database = r"data.sqlite"
    conn = openConnection(database)
    
    if signedin == False:
        signin(conn)
        signedin = True

    task = menu()
    
    while task != 4:
        if task == "1":
            cuisine, rating, pricing, diningStyle = chooseOptions()
            savepref = input("Would you like to save these preferences?(y/n) ")
            if savepref == "y":
                saveUserPref(cuisine, rating, pricing, diningStyle, conn)
            generateRestaurant(cuisine, rating, pricing, diningStyle, conn)

        if task == "2":
            view_history(conn)

        if task == "4":
            break

    # delete all user history and preferences that correspond to guest  

if __name__ == '__main__':
    main()