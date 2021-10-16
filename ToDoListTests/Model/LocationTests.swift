//
//  LocationTests.swift
//  ToDoListTests
//
//  Created by Станислав Белоусов on 13.10.2021.
//

import XCTest
import CoreLocation

@testable import ToDoList

class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitSetsName() {
        let location = Location(name: "Baz")
        
        XCTAssertEqual(location.name, "Baz")
    }

    func testIsSetCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 100, longitude: 200)
        
        let location = Location(name: "Baz", coordinate: coordinate)
    
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
}
