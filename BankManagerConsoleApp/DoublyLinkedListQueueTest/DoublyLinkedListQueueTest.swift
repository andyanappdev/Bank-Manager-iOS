//
//  DoublyLinkedListQueueTest.swift
//  DoublyLinkedListQueueTest
//
//  Created by Doyoung An on 1/26/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class DoublyLinkedListQueueTest: XCTestCase {
    
    func testEnqueue() {
        let queue = DoublyLinkedListQueue<Int>()
        queue.enqueue(1)
        XCTAssertEqual(queue.peek(), 1)
        XCTAssertEqual(queue.isEmpty(), false)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.isEmpty(), true)
    }
    
    func testDequeue() {
        let queue = DoublyLinkedListQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.isEmpty(), true)
        XCTAssertNil(queue.peek())
    }
    
    func testClear() {
        let queue = DoublyLinkedListQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.clear()
        XCTAssertEqual(queue.isEmpty(), true)
        XCTAssertNil(queue.peek())
    }
    
    func testPeek() {
        let queue = DoublyLinkedListQueue<Int>()
        XCTAssertNil(queue.peek())
        
        queue.enqueue(1)
        XCTAssertEqual(queue.peek(), 1)
        
        queue.enqueue(2)
        XCTAssertEqual(queue.peek(), 1)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.peek(), 2)
    }
    
    func testIsEmpty() {
        let queue = DoublyLinkedListQueue<Int>()
        XCTAssertEqual(queue.isEmpty(), true)
        
        queue.enqueue(1)
        XCTAssertEqual(queue.isEmpty(), false)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.isEmpty(), true)
    }
}
