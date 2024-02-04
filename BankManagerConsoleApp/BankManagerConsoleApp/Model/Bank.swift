//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

import Foundation

final class Bank<Q: QueueProtocol> where Q.Element == Customer {
    
    //MARK: - Property
    private var waitingCustomers: Q
    private let bankerManager: BankerManager
    private let message: ConsoleMessage
    private let processingQueue: DispatchQueue
    
    init(waitingCustomers: Q,
         bankerManager: BankerManager,
         message: ConsoleMessage,
         processingQueue: DispatchQueue = DispatchQueue.global()
    ) {
        self.waitingCustomers = waitingCustomers
        self.bankerManager = bankerManager
        self.message = message
        self.processingQueue = processingQueue
    }
    
    
    //MARK: - Method
    func open(completion: @escaping () -> Void) {
        createCustomers()
        
        processCustomerTransaction {
            self.closeBank(completion: completion)
            self.bankerManager.resetManager()
        }
    }
    
    private func createCustomers() {
        let numberOfCustomers = Int.random(in: 10...30)
        
        for number in 1...numberOfCustomers {
            let transactionType: TransactionType = Bool.random() ? .deposit : .loan
            let transaction = Transaction(type: transactionType, duration: transactionType.transactionTime())
            
            let customer = Customer(watingNumber: number, transaction: transaction)
            
            waitingCustomers.enqueue(customer)
        }
    }
    
    private func processCustomerTransaction(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        while !waitingCustomers.isEmpty() {
            if let customer = waitingCustomers.dequeue() {
                dispatchGroup.enter()
                
                processingQueue.async {
                    self.bankerManager.processCustomerTransaction(customer: customer, message: self.message) {
                        dispatchGroup.leave()
                    }
                }
            }
        }
        dispatchGroup.wait()
        
        dispatchGroup.notify(queue: processingQueue) {
            completion()
        }
    }
    
    private func closeBank(completion: @escaping () -> Void) {
        message.bankClosingMessage(totalCustomersProcessed: bankerManager.totalCustomersProcessed, totalProcessingTime: bankerManager.totalProcessingTime)
        completion()
    }
}
