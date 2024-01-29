//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/27/24.
//

import Foundation

class Bank {
    var customerQueue: LinkedListQueue<Customer>
    var totalCustomers: Int = 0
    var consoleMessage: ConsoleMessages
    
    init() {
        self.customerQueue = LinkedListQueue<Customer>()
        self.consoleMessage = ConsoleMessages()
    }
    
    func open() {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            let customer = Customer(number: number)
            customerQueue.enqueue(customer)
        }
        totalCustomers = numberOfCustomers
        processCustomer()
    }
    
    func processCustomer() {
        while let customer = customerQueue.dequeue() {
            consoleMessage.customerStart(customerNumber: customer.number)
            Thread.sleep(forTimeInterval: 0.7)
            consoleMessage.customerEnd(customerNumber: customer.number)
        }
        closed()
    }
    
    func closed() {
        let tottalTime = Double(totalCustomers) * 0.7
        consoleMessage.bankClosure(totalCustomers: totalCustomers, time: tottalTime)
    }
}
