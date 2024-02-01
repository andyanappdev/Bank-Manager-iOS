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
    private var bankers: [TransactionType: [Banker]]
    
    init(depositBankers: Int = 0, loanBankers: Int = 0) {
        self.totalCustomersProcessed = 0
        self.totalProcessingTime = 0
        self.bankers = [:]
        createBankers(for: .deposit, numberOfBankers: depositBankers)
        createBankers(for: .loan, numberOfBankers: loanBankers)
    }
    
    
    //MARK: - Method
    private func createBankers(for type: TransactionType, numberOfBankers: Int) {
        bankers[type] = (1...numberOfBankers).map({ _ in
            return Banker(transactionType: type)
        })
    }
    
    func processCustomer(_ customer: Customer) {
        Thread.sleep(forTimeInterval: customer.transaction.duration)
        
        totalCustomersProcessed += 1
        totalProcessingTime += customer.transaction.duration
    }
}
