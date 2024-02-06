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
    
    init(waitingCustomers: Q,
         bankerManager: BankerManager,
         processingQueue: DispatchQueue = DispatchQueue.global()
    ) {
        self.waitingCustomers = waitingCustomers
        self.bankerManager = bankerManager
        self.processingQueue = processingQueue
        self.elapsedTime = 0
    }
    
    
    //MARK: - Method
    func open(completion: @escaping () -> Void) {
        createCustomers()
        
        processCustomerTransaction {
//            self.closeBank(completion: completion)
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
