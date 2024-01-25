//
//  DoublyLinkedListQueue.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

struct DoublyLinkedListQueue<T>: QueueProtocol {
    
    // MARK: - Properties
    private var queue: LinkedList<T>
    private var size: Int {
        queue.size
    }
    
    init() {
        self.queue = LinkedList<T>()
    }
}


// MARK: - Extension
extension DoublyLinkedListQueue {
    func enqueue(_ element: T) {
        queue.append(value: element)
    }
    
    func dequeue() -> T? {
        return isEmpty() ? nil : queue.removeFirst()
    }
    
    func clear() {
        queue.removeAll()
    }
    
    func peek() -> T? {
        return queue.peek()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty()
    }
}
