//
//  TaskTests.swift
//  ToDoListTests
//
//  Created by Станислав Белоусов on 11.10.2021.
//

import XCTest
@testable import ToDoList

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Baz")
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Baz", description: "Foo")
        
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Baz")
        
        XCTAssertEqual(task.title, "Baz")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Baz", description: "Foo")
        
        XCTAssertTrue(task.description == "Foo")
    }
    
    func testWhenDataIsSet() {
        let task = Task(title: "Baz")
        
        XCTAssertNotNil(task.data)
    }
    
    func testWhanGivenLocationSetsLocation() {
        let location = Location(name: "Bar")
        
        let task = Task(title: "Baz", description: "Foo", location: location)
        XCTAssertEqual(task.location, location)
    }

}
