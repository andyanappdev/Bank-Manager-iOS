//
//  Queue.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
//

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    mutating func clear()
    func peek() -> Element?
    func isEmpty() -> Bool
}
