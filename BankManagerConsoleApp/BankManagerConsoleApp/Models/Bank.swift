//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/27/24.
//

import Foundation

final class Bank {
    private var customerQueue: LinkedListQueue<Customer>
    private let consoleMessages: ConsoleMessages
    private var totalCustomers: Int = 0
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    init() {
        self.customerQueue = LinkedListQueue<Customer>()
        self.consoleMessages = ConsoleMessages()
    }
    
    /// 고객 업무 시작
    func open() {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            let task = Bool.random() ? TaskType.deposit : TaskType.loan
            customerQueue.enqueue(Customer(waitingNumber: number, task: task))
        }
        totalCustomers = numberOfCustomers
        processCustomer()
    }
    
    /// 고객 업무 완료
    func processCustomer() {
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        
        for _ in 0..<totalCustomers {
            guard let customer = customerQueue.dequeue() else { continue }
            
            switch customer.task {
            case .deposit:
                depositSemaphore.wait()
                queue.async(group: group) {
                    self.handleCustomer(customer)
                    self.depositSemaphore.signal()
                }
            case .loan:
                loanSemaphore.wait()
                queue.async (group: group){
                    self.handleCustomer(customer)
                    self.loanSemaphore.signal()
                }
            }
        }
        
//        while let customer = customerQueue.dequeue() {
//            consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber)
//            Thread.sleep(forTimeInterval: 0.7)
//            print(startTime)
//            consoleMessage.teskEndMessage(customerNumber: customer.waitingNumber)
//        }
        group.wait()
        closed()
    }
    
    func handleCustomer(_ customer: Customer) {
        switch customer.task {
        case .deposit:
            consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
            Thread.sleep(forTimeInterval: 0.7)
            consoleMessage.teskEndMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
        case .loan:
            consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
            Thread.sleep(forTimeInterval: 1.1)
            consoleMessage.teskEndMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
        }
    }
    
    /// 업무가 마감됨
    func closed() {
        let totalTime = Double(totalCustomers) * 0.7
        consoleMessages.bankClosure(totalCustomers: totalCustomers, time: totalTime)
    }
}
