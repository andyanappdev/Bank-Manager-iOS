//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    
    func testQueueOperations() {
        var queue = LinkedQueue<Int>()
        
        XCTAssertTrue(queue.isEmpty())
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertFalse(queue.isEmpty())
        XCTAssertEqual(queue.peek(), 1)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.peek())
        XCTAssertNil(queue.dequeue())
    }
    
    func testClearQueue() {
        var queue = LinkedQueue<String>()
        
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")
        
        XCTAssertFalse(queue.isEmpty())
        
        queue.clear()
        
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.peek())
        XCTAssertNil(queue.dequeue())
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
