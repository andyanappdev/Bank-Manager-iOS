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
    private let processingQueue: DispatchQueue
    private var elapsedTime: Double
    private var accumulatedCustomers: Int
    private let numberOfCustomersToAdd: Int
    
    init(waitingCustomers: Q,
         bankerManager: BankerManager,
         processingQueue: DispatchQueue = DispatchQueue.global(),
         numberOfCustomersToAdd: Int = 10
    ) {
        self.waitingCustomers = waitingCustomers
        self.bankerManager = bankerManager
        self.processingQueue = processingQueue
        self.elapsedTime = 0
        self.accumulatedCustomers = 0
        self.numberOfCustomersToAdd = numberOfCustomersToAdd
    }
    
    
    //MARK: - Method
    func open(completion: @escaping () -> Void) {
        addNewCustomers()
        
        processCustomerTransaction {
            //            self.closeBank(completion: completion)
            self.bankerManager.resetManager()
        }
    }
    
    func addNewCustomers() {
        for _ in 1...numberOfCustomersToAdd {
            let customer = createNewCustomer()
            enqueueCustomer(customer: customer)
        }
    }
    
    private func createNewCustomer() -> Customer {
        let transactionType: TransactionType = Bool.random() ? .deposit : .loan
        let transaction = Transaction(type: transactionType, duration: transactionType.transactionTime())
        let customer = Customer(watingNumber: accumulatedCustomers + 1, transaction: transaction)
        accumulatedCustomers += 1
        return customer
    }
    
    private func enqueueCustomer(customer: Customer) {
        waitingCustomers.enqueue(customer)
    }
    
    
    
    
    private func processCustomerTransaction(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        var startTimes: [DispatchTime] = []
        
        while !waitingCustomers.isEmpty() {
            if let customer = waitingCustomers.dequeue() {
                let startTime = DispatchTime.now()
                startTimes.append(startTime)
                dispatchGroup.enter()
                
                processingQueue.async {
                    self.bankerManager.processCustomerTransaction(customer: customer) {
                        dispatchGroup.leave()
                    }
                }
            }
        }
        dispatchGroup.wait()
        
        let endTime = DispatchTime.now()
        elapsedTime = Double(endTime.uptimeNanoseconds - startTimes.first!.uptimeNanoseconds) / 1_000_000_000
        
        
        dispatchGroup.notify(queue: processingQueue) {
            completion()
        }
    }
    
    //    private func closeBank(completion: @escaping () -> Void) {
    //        message.bankClosingMessage(totalCustomersProcessed: bankerManager.totalCustomersProcessed, totalProcessingTime: elapsedTime)
    //        completion()
    //    }
}
