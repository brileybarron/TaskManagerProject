//
//  AllTasksClass.swift
//  TaskManagerProject
//
//  Created by Briley Barron on 9/17/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation


class AllTasks{
    //Properties
    var taskArray = [Task]() //This will be used to store all the tasks unless the task is removed
    let utilities = Utilities()  //This is where all the added functions will come from such as the validation of many inputs from  the user
    
    func addTask(){//function to add a task.
        print("\nWhat is the name of the task")//this question will be used later on when initializing
        let taskName = readLine()!  //take user input but this requires no validation because the user can name the task whatever.
        print("\nWould you like this task to have priority?(yes/no)")
        let havePriority = utilities.yesNoInput() //this validation will automatically take user input inside of the function until an integer is used. then return that value.
        var taskPriority = priority.noPriority //this automatically gives no priority to the task, unless the user wants to add priority.  This can be changed later.
        if havePriority == "yes"{ //takes the users input and if the user wants to add priority then it can.
            taskPriority = utilities.prioritySwitch()  //this function can take input inside of the function and validate it.  then return the value.
        }
        
        
        print("\nWould you like to have a description?(yes/no)")//asks if the user wants to add a description.
        let haveDescription = utilities.yesNoInput() //once again takes user input and validates it.
        var taskDescription: String? //this is not required so the value should be an optional
        if haveDescription == "yes" { //if the user wants a description then it allows there to be a description
            print("\nWhat would you like to have for the description of this task?")
            taskDescription = readLine()//this takes the user input but requires no validation.
        }
        
        
        var dateDue: Date? //initializes another variable that will be part of the due date of the task
        print("\nHow many days from now would you like this to be done?") // this doesn't give the option to have a date or not have a date because there was an error that will not convert a date if there is not date.
        dateDue = utilities.dateDone()! // this calls the function that takes user input and adds that amount of days to the current date.
        
        let newTask = Task(nameOfTask: taskName, descriptionOfTask: taskDescription ?? "Not Needed", taskPriority: taskPriority)  // this creates the task that the user created
        newTask.dueDate.date = dateDue!  //this adds the due date to the tuple that requires a date
        newTask.dueDate.stringDate = utilities.formatDate(from: dateDue!)! //and a string, but both of those will be used anytime a date may be needed.
        
        
        print("""
            name: \(newTask.nameOfTask)
            description: \(newTask.descriptionOfTask ?? "Not Needed")
            task priority: \(newTask.taskPriority)
            due date: \(newTask.dueDate.stringDate)
            
            Is this information correct?(yes/no)
            """)//this gives the information about the task and asks for user input on if the info is correct.
        
        
        let correctInfo = utilities.yesNoInput()
        if correctInfo == "yes"{  //if the info is correct then the task is appended to the task array.
            taskArray.append(newTask) //append the task to the array
            print("\nThe new task has been added\n")  // nottifies the user that the task has been added.
        }else{ //if "no" then
            print("Are you sure, you will have to start over?(yes/no)") //tell the user if the info isn't correct then the user will have to start over.
            let sure = utilities.yesNoInput() // takes and validates input
            if sure == "yes"{  //if the user wants to start over then call the function without appending the task
                addTask()  //calls the function inside of itself
            }else{
                taskArray.append(newTask) //if the user doesn't want to restart then the task is added
                print("\nThe task has been added.\n")  //notifies the user that the task is added
            }
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    func orderTasks(){ //this function takes the task array and organizes it by priority.
        var orderedTasks = [Task]() //first by initializing an array to begin storing tasks
        for task in taskArray{//look at all tasks
            if task.taskPriority == priority.veryHigh{//if the task have a veryHigh priority
                orderedTasks.append(task)// then append to the new array.  this will be repeated throughout this function.
            }
        }
        for task in taskArray{
            if task.taskPriority == priority.high{ // if the task has a high priority this time
                orderedTasks.append(task)
            }
        }
        for task in taskArray{
            if task.taskPriority == priority.medium{//Now for the tasks with a medium priority
                orderedTasks.append(task)
            }
        }
        for task in taskArray{
            if task.taskPriority == priority.low{//And for  those with low priority
                orderedTasks.append(task)
            }
        }
        for task in taskArray{
            if task.taskPriority == priority.veryLow{//Almost done with it now.
                orderedTasks.append(task)
            }
        }
        for task in taskArray{
            if task.taskPriority == priority.noPriority{//And finally for those tasks with no prioority at all
                orderedTasks.append(task)
            }
        }
        taskArray = orderedTasks//Now sets the class's task array to the new array crated at the beginning of the function
    }
    
    //------------------------------------------------------------------------------------------------------------------
    func listAllTasks(){
        if taskArray.count == 0{ //looks at how many tasks are in the array.  If there are no tasks in the array then inform the user
            print("There are currently no tasks that need to be done")
        }else{//otherwise
            var counter = 0
            for task in taskArray {//go through each task in the array and
                utilities.printInfo(task: task, counter: counter) //print their information
                counter += 1
            }
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    func listAllCompletedTasks(){
        var completedTasks = [Task]()//creates an empty array of tasks to temporarily store only completed tasks
        for tasks in completedTasks{ // goes through all tasks and checks for completeness
            if tasks.completed == true{ //if the task is complete then
                completedTasks.append(tasks) //the task can be added to the completedTasks array.
            }
        }
        if completedTasks.count == 0 {//checks if there are any completed tasks.  if there aren't then inform the user
            print("There are currently no completed tasks.")
        }else{  //but as long as there is one item in the array
            var counter = 0
            for task in completedTasks{//go though each task and print information about the task
                utilities.printInfo(task: task, counter: counter)
                counter += 1
            }
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    func listAllUncompletedTasks(){ // this does the exact same thing as the listAllCompletedTasks ()  except with incompleted tasks
        var uncompletedTasks = [Task]()
        for tasks in taskArray{
            if tasks.completed == false{
                uncompletedTasks.append(tasks)
            }
        }
        var counter = 0
        for task in taskArray{
            utilities.printInfo(task: task, counter: counter)
            counter += 1
        }
        if uncompletedTasks.count == 0{
            print("There are currently no incomplete tasks")
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    func markTaskAsComplete(){
        var uncompletedTasks = [Task]()//creates an empty array to store all the incomplete tasks
        for tasks in taskArray{ //goes through each item in the taskArray and checks for completeness
            if tasks.completed == false{ //for all the tasks that are incomplete put them in the uncompletedTasks array
                uncompletedTasks.append(tasks)
            }
        }
        if uncompletedTasks.count == 0{
            print("There are currently no incomplete tasks")
        }else{
        var counter = 0
        for task in uncompletedTasks{ //then goes through each task that is incomplete and prints the info
            utilities.printInfo(task: task, counter: counter)
            counter += 1
        }
        print("\nWhich task would you like to mark as completed?")
        let completedTuple = utilities.handleTaskNumberInput(taskArray: uncompletedTasks)//This insures that the user's input is in range. If it is then it returns a boolean value and the integer value of the userInput that will be used to mark a task as complete.
        uncompletedTasks[completedTuple.userInput].completed = completedTuple.completed //as seen here
        print("You have successfully marked \(taskArray[completedTuple.userInput].nameOfTask) as complete.")//informs the user of what happened
        }
    }
    //------------------------------------------------------------------------------------------------------------------
    func markTaskAsUncomplete(){//does the same thing as the markTaskAsComplete() function except this marks a task as incomplete.
        var completedTasks = [Task]()
        for tasks in taskArray{
            if tasks.completed == true{
                completedTasks.append(tasks)
            }
        }
        
        if completedTasks.count == 0{
            print("There are currently no tasks that are complete")
        }else{
        var counter = 0
        for task in completedTasks{
            utilities.printInfo(task: task, counter: counter)
            counter += 1
        }
        print("\nWhich task would you like to mark as completed?")
        
            let completedTuple = utilities.handleTaskNumberInput(taskArray: completedTasks)
            completedTasks[completedTuple.userInput].completed = !completedTuple.completed // This will take the opposite value of the returned tuple.bool value.
            print("You have successfully marked \(taskArray[completedTuple.userInput].nameOfTask) as complete.")
        }
    }
    
    //------------------------------------------------------------------------------------------------------------------
    func deleteATask(){
        if taskArray.count == 0{//checks to see if there are any tasks that have been made
            print("\nThere are currently no tasks avaliable.")
        }else{//as long as there are some items in the array
            var counter = 0
            for tasks in taskArray{// loop through each task and print the information for ach one.
                utilities.printInfo(task: tasks, counter: counter)
                counter += 1
            }
            
            print("\nWhich task would you like to delete?")
            let userInput = utilities.determineIfAValueIsWithinRange(taskArray: taskArray)//This function validates that the value is within range and returns an integer value
            taskArray.remove(at: userInput - 1)//removes the task at one less than the user input
            print("The task has been removed")
        }
    }
    //------------------------------------------------------------------------------------------------------------------
}


