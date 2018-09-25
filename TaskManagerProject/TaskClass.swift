//
//  TaskClass.swift
//  TaskManagerProject
//
//  Created by Briley Barron on 9/17/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation


class Task{//creates a Task Class
    //with properties of:
    var nameOfTask: String//name
    var descriptionOfTask: String?//description
    var dueDate: (date: Date?, stringDate: String) = (nil, "Not Given")//(date, string) tuple
    var completed = false//completeness
    var taskPriority: priority//priority
    
    
    //initializer
    init (nameOfTask: String, descriptionOfTask: String, taskPriority: priority){//initializes these properties that don't already have an initial value.
        self.nameOfTask = nameOfTask
        self.descriptionOfTask = descriptionOfTask
        self.taskPriority = taskPriority
    }
    //no methods
}
