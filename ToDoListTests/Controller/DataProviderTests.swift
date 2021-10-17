//
//  DataProviderTests.swift
//  ToDoListTests
//
//  Created by Станислав Белоусов on 17.10.2021.
//

import XCTest
@testable import ToDoList

class DataProviderTests: XCTestCase {
    
    var sut: DataProvider!
    var tableView: UITableView!

    override func setUpWithError() throws {
        sut  = DataProvider()
        tableView = UITableView()
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSectonsIsTwo() {
   
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfSectionZeroIsTaskCount() {
        sut.taskManager = TaskManager()
        
        sut.taskManager?.add(task: Task(title: "Buz"))
        
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        
        sut.taskManager?.add(task: Task(title: "Baz"))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRousInSectionOneIsDoneTasksCount() {
        
        sut.taskManager = TaskManager()
        
        sut.taskManager?.add(task: Task(title: "Buz"))
        sut.taskManager?.checkTask(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        sut.taskManager?.add(task: Task(title: "Baz"))
        sut.taskManager?.checkTask(at: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.taskManager?.add(task: Task(title: "Baz"))
        
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
    }


}
