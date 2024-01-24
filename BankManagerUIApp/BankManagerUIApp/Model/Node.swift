//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
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
