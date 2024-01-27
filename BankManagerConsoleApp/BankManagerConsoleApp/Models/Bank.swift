//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/27/24.
//

class Bank {
    var customerQueue = LinkedListQueue<Customer>()
    var totalCustomers: Int = 0
    
    func open() {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            let customer = Customer(number: number)
            customerQueue.enqueue(customer)
        }
        totalCustomers = numberOfCustomers
    }
}
