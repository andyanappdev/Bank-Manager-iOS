//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/26/24.
//

import Foundation

class Banker {
    
    //MARK: - Properties
    private(set) var totalCustomersProcessed: Int = 0
    private(set) var totalProcessingTime: Double = 0
    
    
    //MARK: - Methdo
    func processCustomer(_ customer: Customer, processingTime: Double) {
        Thread.sleep(forTimeInterval: processingTime)
        
        totalCustomersProcessed += 1
        totalProcessingTime += processingTime
    }
}
