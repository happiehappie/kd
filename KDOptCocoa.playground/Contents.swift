//: KDOptCocoa
// Includes Spry and XCTest

import UIKit
import XCTest

let testObserver = TestObserver()
XCTestObservationCenter.shared().addTestObserver(testObserver)

class EntryTest: XCTestCase {
    func testConstructor() {
        let entry = Entry(credits: 1)
        XCTAssertEqual(entry.credits, 1)
    }
}


class CreditManagerTest: XCTestCase {
    let manager = CreditManager()

    func testConstructor() {
        XCTAssertEqual(manager.balance, 0)
    }

    func testAddChangesBalance() {
        let entry = Entry(credits: 5)
        let _  = manager.add(entry: entry)
        XCTAssertEqual(manager.balance, 5)
    }

    func testAddReturnsTuple() {
        let entry = Entry(credits: 5)
        XCTAssertTrue(manager.add(entry: entry) == (true, 5))
    }
    
    func testDeductChangesBalance() {
        manager.balance = 11
        let entry = Entry(credits: 5)
        let _  = manager.deduct(entry: entry)
        XCTAssertEqual(manager.balance, 6)
    }
    
    func testDeductReturnsTuple() {
        manager.balance = 11
        let entry = Entry(credits: 5)
        XCTAssertTrue(manager.deduct(entry: entry) == (true, 6))
    }

    func testDeductReturnsFalseAndCurrentBalanceForNegativeBalance(){
        manager.balance = 5
        let entry = Entry(credits: 6)
        XCTAssertTrue(manager.deduct(entry: entry) == (false, 5))
    }
    
    
    
}


class Entry {
    let description: String
    let credits: Int
    
    init(credits: Int, description: String = "") {
        self.credits = credits
        self.description = description
    }
}

class CreditManager {
    var balance: Int
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func add(entry: Entry) -> (result: Bool, balance: Int) {
        return (balance + entry.credits > 0 ? true : false, balance + entry.credits)
    }
    
    func deduct(entry: Entry) -> (result: Bool, balance: Int ){
        return (balance + entry.credits > 0 ? true : false, balance)
    }
    
    func operate(entry: Entry, isAddition: Bool) -> (result: Bool, balance: Int ) {
        //simply for readability
        let newBalance = entry.credits - (isAddition ? -balance : balance)
        return (newBalance > 0 ? true : false, newBalance > 0 ? newBalance : balance)
    }
    
}
EntryTest.defaultTestSuite().run()
CreditManagerTest.defaultTestSuite().run()
