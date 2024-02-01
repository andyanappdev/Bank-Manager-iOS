//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

import Foundation

struct Banker {
    let id: UUID
    let transactionType: TransactionType
    
    init(transactionType: TransactionType) {
        self.id = UUID()
        self.transactionType = transactionType
    }
}
