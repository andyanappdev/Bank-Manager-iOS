//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 1/23/24.
//

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
