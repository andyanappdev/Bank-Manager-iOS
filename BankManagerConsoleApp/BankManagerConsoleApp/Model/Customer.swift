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
    
    init(watingNumber: Int) {
        self.id = UUID()
        self.watingNumber = watingNumber
    }
}
