//
//  Task.swift
//  ToDoList
//
//  Created by Станислав Белоусов on 11.10.2021.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    private(set) var data: Data?
    let location: Location?
   
    
    init(title: String, description: String? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.data = Data()
        self.location = location
       
    }
}

extension Task: Equatable {
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        if
            lhs.title == rhs.title,
            lhs.description == rhs.description,
            lhs.location == rhs.location {
            return true
        }
        return false
    }
    
}
