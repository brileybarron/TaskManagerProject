//
//  MenuClass.swift
//  TaskManagerProject
//
//  Created by Briley Barron on 9/17/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation


class Menu{//creates a Menu Class
    //with all properties already initialized so there is no need for the initializer
    var shouldQuit = false
    var taskLibrary = AllTasks() //this is added to be able to call functions from within the AllTasks Class
    var utilities = Utilities() //And the Utilities Class
    
    
    func go(){//This function will always be running no matter what is going on.  Everything will be done through here.
        
        repeat{//runs at least once
            taskLibrary.orderTasks()// this orders the task array everytime no matter what the user does
            printMenu() // then prints the menu
            let input = validateInput() // and validates user input
            handleInput(userInput: input) // and uses the switch statement below to handle what happens next
            shouldQuit = utilities.wouldYouLikeToQuit()//asks the user if he/she wants to quit between each menu.
            
        }while !shouldQuit//runs until shouldQuit == true
    }
    
    func quit(){//This will be called when the user wants to quit which is why shouldQuit becomes true.
        print("Thank you for using this application")
        print("Please come again")
        shouldQuit = true//This will pull the user out of the go() function because the go() function uses a repeat while loop that continues as long as shouldQuit is not true
    }
    
    func printMenu(){//This is the menu screen that will be used throughout the function.
        print("""

    The following is everything you can do through this application:
    1: Add a task
    2: List all tasks
    3: list only completed tasks
    4: List only inclompleted tasks
    5: Mark a task as complete
    6: Mark a task as incomplete
    7: Delete a Task
    8: Exit the Program
    Please enter the number of what you would like to do

    """)
    }
    
    func validateInput() -> Int{//This function will return an integer so that when The switch statement is ran later.  The switch can be made to accept only certain values.
        let userInput = readLine()//take the user input
        if let input = Int(userInput!){//determine if the input can be an integer
            return input
        }else{//if not
            print("You have entered an invalid response")
            print("Please try Again")
            printMenu()
            return validateInput()//then return validate input which will return an integer
        }
    }
    
    func handleInput(userInput: Int){
        switch userInput{ //switches based on the userInput
        case 1:
            //Add a Task
            print("You chose to add a task")
            taskLibrary.addTask() //calls addTask
        case 2:
            //List all Tasks
            print("You chose to list all tasks")
            taskLibrary.listAllTasks()//calls listAllTasks
        case 3:
            //List only completed tasks
            print("You chose to list all completed tasks")
            taskLibrary.listAllCompletedTasks()// calls listAllCompletedTasks
        case 4:
            //List uncompleted tasks
            print("You chose to list all uncompleted tasks")
            taskLibrary.listAllUncompletedTasks()//calls listAllUncompletedTasks
        case 5:
            //Mark a task as complete
            print("You chose to mark a task as complete")
            taskLibrary.markTaskAsComplete()//calls markTaskAsComplete
        case 6:
            //mark a task as incomplete
            print("You chose to mark a task as incomplete")
            taskLibrary.markTaskAsUncomplete()//calls markTaskAsUncomplete
        case 7:
            //Delete a task
            print("You chose to delete a task")
            taskLibrary.deleteATask()//calls deleteATask
        case 8:
            //Exit the program
            print("You chose to exit the program")
            quit()//Calls the quit function
        case 8663: //Easter Egg
            print("Congrats you have found a secret.")//found a secret
            var space = "" //gives a variable
            for _ in 0..<8663{//gives a loop for 8663 times
                print("\(space)Apple Orchard Banana Cat Dance 8663")//gives an aesthetically pleasing look
                space += " "
                if space.count == 90{//every 90 iterations start space back to nothing.
                    space = ""
                }
            }
        default:
            //If all else fails then rerun the go() function
            print("You entered invalid an input")
            print("Please try again")
            go()
            
        }
    }
}
