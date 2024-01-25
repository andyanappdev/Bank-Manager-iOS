//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

final class Node<T> {
    var value: T
    var previous: Node?
    var next: Node?
    
    init(value: T, previous: Node? = nil, next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}
