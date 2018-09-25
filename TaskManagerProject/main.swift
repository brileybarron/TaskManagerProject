//
//  main.swift
//  TaskManagerProject
//
//  Created by Briley Barron on 9/17/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//
//
import Foundation
//
//Task Manager Guidelines
//
//Core Objectives:

//- The User should be able to create new tasks.
//- The User should be able to see a list of all tasks (Completed and Uncompleted).
//- The User should be able to see a list of only uncompleted tasks.
//- The User should be able to see a list of only completed tasks.
//- The User should be able to mark a task as complete.
//- The User should be able to mark a completed task as incomplete.
//- The User should be able to delete a task.
//- The User should be able to exit the program.
//- The program should include error handling to account for incorrect user input in all areas where user input is required.
//
//Extra Challenges:
//- Add a priority system to Tasks. Tasks should be sorted by the priority in each Task list.
//- Allow the user to set a custom complete by date for each Task.
//    - Allow the user to edit an existing Task by changing the title, task details, and complete by date.
//    - Implement persistence for the app, so that the user’s list of Tasks persists between runs of the application.
//- Add easter eggs to the Task Manager! Be creative with these. They could be triggered when a user enters in a specific input, when a user takes a specific series of actions, etc.
//- Add a login system to the Task Manager. Have the user enter a password to get into the application whenever it starts up.
//
//Task Data Model:
//- The Task Data Model should have the following properties:
//- Title
//- Details of task
//- Completion Status
//- Complete By Date
//
//
//Tips:
//- Make sure to be committing regularly and pushing those commits to GitHub! Very handy in case something happens to your computer or you want to go back to a previous version of your application.
//- Break the program down into smaller pieces! Thinking about it as “Creating a Task Manager” is a lot harder to think about than “Create a menu and display it”.
//- Make sure your code is formatted and commented well!


print("Welcome to the Task Manager\n")



let menu = Menu() //creates a menu class

menu.go() //calls the go() function which runs the entire program


