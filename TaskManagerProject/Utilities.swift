//
//  Utilities.swift
//  TaskManagerProject
//
//  Created by Briley Barron on 9/18/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Utilities{//creates a Utilities class to store other functions that don't really go anywhere else
    
    
    func yesNoInput() -> String{//This will be used a lot to validate input and return a value that is what the user entered.
        let userInput = readLine()! //takes userInput no matter the question so long as it can be answered with yess or no
        if userInput.uppercased() == "YES"{ //If the user enters any for of yes then this function automatically returns a yes string as a value
            return "yes"
        }else if userInput.uppercased() == "NO"{//The same thing can be said about the input of No
            return "no"
        }else{  //But if the input is wrong then recursion is used until an answer that is either yes or no is used
            print("\nPlease enter either yes or no.\n")
            return yesNoInput() //returns the function which will eventually return a string of either "yes" or "no"
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func integerValidation() -> Int{//This will return an integer value
        let userInput = readLine()!//takes user input
        if let integer = Int(userInput){//and determines if the value can be an integer.  if it can then return the integer.
            return integer
        }else{//if the user input isn't an integer then return the function until an integer is entered.
            print("Sorry, but you must enter a number.")
            return integerValidation() //returns itself which will eventually return an integer.
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func wouldYouLikeToQuit() -> Bool{ // this will be used only in the beginning to ensure the user wants to continue
        print("Would you like to continue in this application?(yes/no)")
        let answer = yesNoInput()//takes the yes or no input
        if answer == "yes"{//this will assign the returned value to shouldQuit which keeps the application running
            return false
        }else{
            return true
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func determineIfAValueIsWithinRange(taskArray: [Task]) -> Int{//takes an array as a parameter so the count function can be used to make sure the entered value is within the index.
        let userInput = readLine()//takes user input in the function
        if let intUserInput = Int(userInput!){//then makes sure the value can be an integer
            if intUserInput <= taskArray.count && intUserInput > 0{//if the value is an integer then check to see if it is within the range of 0 and the amount of items in the array.
                return intUserInput // then returns the integer
            }else{//if the user's number isn't in that range then continue to run the function until it is.
                return determineIfAValueIsWithinRange(taskArray: taskArray)
            }
        }else{//if the user input isn't a number then run the finction until it is.
            print("Please enter a valid input!")//notifies the user that the input is wrong
            return determineIfAValueIsWithinRange(taskArray: taskArray)
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func prioritySwitch () -> priority{//this function will be used when assigning a priority to a task
        print("""

What would you like to be the priority of this task?
1: Very High
2: High
3: Medium
4: Low
5: Very Low

""")//prints all the options for priority
        let priority = readLine()!//then switches on them based on what is entered.
        switch priority{
        case "1":
            return .veryHigh
        case "2":
            return .high
        case "3":
            return .medium
        case "4":
            return .low
        case "5":
            return .veryLow
        default://if the user enters something that isn't an option then prompt the user that an invalid response has been entered and return the function to eventually get a value
            print("Please enter a valid response")
            return prioritySwitch()
            
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func dateDone() -> Date?{//This function will be used to determine how long until the user wants the task to be completed.
        let howManyDays = integerValidation()//takes an integer and validates it
        let currentDate = Date()//creates a date value that is teh current date
        let calendar = Calendar.current//then makes a calendar that will be used to add days to the current date
        return calendar.date(byAdding: .day, value: howManyDays, to: currentDate)//returns the date that is how ever many days away that the user entered.
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func formatDate(from date: Date) -> String?{//This will take a date object and turn it into a string.
        let dateFormatter = DateFormatter()//This is dine by making a date formatter
        dateFormatter.dateFormat = "MMMM dd, yyyy"//and setting the value for which all strings will be converted(MonthCompleteName TwoDigitDate, FourDigitYear)
        return dateFormatter.string(from: date)//returns the string version of the date that is the parameter
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func printInfo(task: Task, counter: Int){//takes in a counter to use string interpolation.  the same goes for why a task is taken in.
        var counter = counter
        counter += 1
        print("""
            
            \(counter):
            Name: \(task.nameOfTask)
            Description: \(task.descriptionOfTask ?? "Not Needed")
            Priority: \(task.taskPriority)
            """)//prints all the info above(name, description(if there is one), and priority.
        if task.completed == true{//This will vary depending on if the task is complete or not
            print("This task is complete")
        }else{
            print("This task is incomplete")
        }
        
        print("""
            Due Date: \(task.dueDate.stringDate)
            
            """)//This is what I would like to be seen last.
    }
    
    //------------------------------------------------------------------------------------------------------------------------
    
    func handleTaskNumberInput(taskArray: [Task]) -> (completed: Bool, userInput: Int){//This function will return a Bool value to determine if the user's input falls within a certain range of numbers.  This is different from the determineIfAValueIsWithinRange because this will return a true or false statement.
        let userInput = integerValidation() - 1// This takes user input as an integer each time the function is called.
        if userInput >= 0 && userInput < taskArray.count{//As long as the user's input is within the range then the function will return true.
            return (true, userInput)
        }else{//otherwise
            print("Please give a valid number")//It will prompt the user that something has been entered wrong
            return handleTaskNumberInput(taskArray:taskArray) //and return the functionwith the new userInput.  This will eventually result in the return of a Bool value.
        }
    }
}
