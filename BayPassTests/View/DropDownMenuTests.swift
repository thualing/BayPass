//
//  DropDownMenuTests.swift
//  BayPassTests
//
//  Created by Zhe Li on 3/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

@testable import BayPass
import XCTest
import SnapKit

class DropDownMenuTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitleUpperCase() {
        let dropDown = DropDownMenu(title: "Payment method", items: ["Apple Pay", "Credit/Debit", "Paypal"])
        XCTAssertEqual(dropDown.titleLbl.text, "PAYMENT METHOD")
    }
    
    func testDropDownTableView() {
        let dropDown1 = DropDownMenu(title: "Payment method", items: ["Apple Pay", "Credit/Debit"])
        XCTAssertEqual(dropDown1.dropView.tableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(dropDown1.dropView.tableView.isScrollEnabled, false)
        XCTAssertEqual(dropDown1.dropView.tableView.dataSource?.tableView(dropDown1.dropView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).textLabel?.text, "Apple Pay")
        XCTAssertEqual(dropDown1.dropView.tableView.dataSource?.tableView(dropDown1.dropView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).textLabel?.font, UIFont.systemFont(ofSize: 20, weight: .bold))
        
        let dropDown2 = DropDownMenu(title: "Payment method",
                                     items: ["Apple Pay", "Credit/Debit", "Paypal", "Venmo", "Cash"])
        XCTAssertEqual(dropDown2.dropView.tableView.numberOfRows(inSection: 0), 5)
        XCTAssertEqual(dropDown2.dropView.tableView.isScrollEnabled, true)
        XCTAssertEqual(dropDown2.dropView.tableView.dataSource?.tableView(dropDown2.dropView.tableView, cellForRowAt: IndexPath(row: 2, section: 0)).textLabel?.text, "Paypal")
        XCTAssertEqual(dropDown2.dropView.tableView.dataSource?.tableView(dropDown2.dropView.tableView, cellForRowAt: IndexPath(row: 2, section: 0)).backgroundColor, UIColor.white)
    }
    
    func testSelectedItem() {
        let dropDown = DropDownMenu(title: "Payment method", items: ["Apple Pay", "Credit/Debit"])
        XCTAssertEqual(dropDown.getSelectedItem(), "Apple Pay")
    }
    
    func testHeight() {
        //let dropDown1 = DropDownMenu(title: "Payment method", items: ["Apple Pay", "Credit/Debit"])
        
        //XCTAssertEqual(dropDown1.dropView.tableView.numberOfRows(inSection: 0), 2)
        //XCTAssertEqual(dropDown1.dropView.tableView.isScrollEnabled, false)
        
        let dropDown2 = DropDownMenu(title: "Payment method",
                                     items: ["Apple Pay", "Credit/Debit", "Paypal", "Venmo", "Cash"])
        XCTAssertEqual(dropDown2.height.constant, 0)
    }
    
}
