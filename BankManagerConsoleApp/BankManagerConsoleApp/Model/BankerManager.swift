//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/26/24.
//

import Foundation

class BankerManager {
    
    //MARK: - Properties
    private(set) var totalCustomersProcessed: Int
    private(set) var totalProcessingTime: Double
    private(set) var bankers: [TransactionType: [Banker]]
    private let bankerSemaphore: DispatchSemaphore
    
    init(depositBankers: Int = 0, loanBankers: Int = 0) {
        self.totalCustomersProcessed = 0
        self.totalProcessingTime = 0
        self.bankers = [:]
        self.bankerSemaphore = DispatchSemaphore(value: 1)
        createBankers(for: .deposit, numberOfBankers: depositBankers)
        createBankers(for: .loan, numberOfBankers: loanBankers)
    }
    
    
    //MARK: - Method
    private func createBankers(for type: TransactionType, numberOfBankers: Int) {
        bankers[type] = (1...numberOfBankers).map({ _ in
            return Banker(transactionType: type)
        })
    }
    
    func processCustomerTransaction(customer: Customer, message: ConsoleMessage, completion: @escaping () -> Void) {
        totalCustomersProcessed += 1
        totalProcessingTime += customer.transaction.duration
        
        waitUntilAvailableBanker(for: customer.transaction.type)
        
        if let availableBanker = findAvailableBanker(for: customer.transaction.type) {
            availableBanker.processCustomerTransaction(customer: customer, message: message) {
                completion()
            }
        } else {
            print("Error BankerManager class")
            completion()
        }
    }
    
    private func findAvailableBanker(for type: TransactionType) -> Banker? {
        if let bankerOfType = bankers[type] {
            return bankerOfType.first { !$0.isBusy }
        }
        return nil
    }
    
    private func waitUntilAvailableBanker(for type: TransactionType) {
        bankerSemaphore.wait()
        defer {
            bankerSemaphore.signal()
        }
        
        while findAvailableBanker(for: type) == nil { }
    }
    
    private func restCunters() {
        totalCustomersProcessed = 0
        totalProcessingTime = 0
    }
    
    func resetManager() {
        restCunters()
    }
}
