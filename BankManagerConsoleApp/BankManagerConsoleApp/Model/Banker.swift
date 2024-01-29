//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/26/24.
//

import Foundation

class Banker {
    
    //MARK: - Properties
    let id: UUID
    private(set) var totalCustomersProcessed: Int = 0
    private(set) var totalProcessingTime: Double = 0
    private let processingTime: Double
    
    init(processingTime: Double) {
        self.id = UUID()
        self.processingTime = processingTime
    }
    
    
    //MARK: - Methdo
    func processCustomer(_ customer: Customer, processingTime: Double) {
        Thread.sleep(forTimeInterval: processingTime)
        
        totalCustomersProcessed += 1
        totalProcessingTime += processingTime
    }
}
