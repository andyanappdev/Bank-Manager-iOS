//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
//

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    func append(_ value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    
    func dequeue() -> T? {
        guard let headNode = head else {
            return nil
        }
        head = headNode.next
        if head == nil {
            tail = nil
        }
        return headNode.value
    }
    
    func clear() {
        head = nil
        tail = nil
    }
    
    func peek() -> T? {
        return head?.value
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
}
