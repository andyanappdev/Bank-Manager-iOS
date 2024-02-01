//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/26/24.
//

import Foundation

struct Customer {
    let id: UUID
    let watingNumber: Int
    let transaction: Transaction
    
    init(watingNumber: Int, transaction: Transaction) {
        self.id = UUID()
        self.watingNumber = watingNumber
        self.transaction = transaction
    }
}
