//
//  TaskListViewControllerTests.swift
//  ToDoListTests
//
//  Created by Станислав Белоусов on 16.10.2021.
//

import XCTest
@testable import ToDoList

class TaskListViewControllerTests: XCTestCase {
    
    var sut: TaskListViewController!

    override func setUpWithError() throws {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(identifier: String(describing: TaskListViewController.self))
          
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
          
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataProviderIs() {
          
          XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourseIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(sut.tableView.delegate as? DataProvider, sut.tableView.dataSource as? DataProvider)
    }
    
}
