//
//  LinkedQueue.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
//

struct LinkedListQueue<T>: Queue {
    // MARK: - Properties
    private var queue: LinkedList<T>
    
    init() {
        self.queue = LinkedList<T>()
    }
    
    
    // MARK: - Methods
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
