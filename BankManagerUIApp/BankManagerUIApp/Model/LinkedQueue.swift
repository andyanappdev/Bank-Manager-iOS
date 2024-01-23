//
//  LinkedQueue.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
//

struct LinkedQueue<T>: Queue {
    private var linkedList: LinkedList<T>
    
    init() {
        self.linkedList = LinkedList<T>()
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }

    mutating func dequeue() -> T? {
        return linkedList.dequeue()
    }

    mutating func clear() {
        linkedList.clear()
    }

    func peek() -> T? {
        return linkedList.peek()
    }

    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
