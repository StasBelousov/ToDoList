//
//  ManagerTests.swift
//  ToDoListTests
//
//  Created by Станислав Белоусов on 14.10.2021.
//

import XCTest
@testable import ToDoList

class ManagerTests: XCTestCase {
    
    var sut: TaskManager!

    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddTaskWithCount() {
        let task = Task(title: "Baz")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Baz")
        sut.add(task: task)
        
        let returndTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returndTask.title)
    }
    
    func testCheckTaskAtIndexChangeCount() {
        
        let task = Task(title: "Baz")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
        
    }
    
    func testCheckTaskRemovedFromTasks() {
        let firstTask = Task(title: "Baz")
        let secondTask = Task(title: "Buz")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Baz")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedTask, task)
    }
    
    func testRemoveAllResultsCountBeZero() {
       
        sut.add(task: Task(title: "Baz"))
        sut.add(task: Task(title: "Buz"))
        sut.checkTask(at: 0)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
        
    }
    
    func testAddingSameObjDoesNotIncrementCount() {
        
        sut.add(task: Task(title: "Baz"))
        sut.add(task: Task(title: "Baz"))
        
        XCTAssertTrue(sut.tasksCount == 1)
        
    }

}
