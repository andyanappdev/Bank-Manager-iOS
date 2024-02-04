//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

import Foundation

class Banker {
    
    //MARK: - Property
    let id: UUID
    let transactionType: TransactionType
    private(set) var isBusy: Bool
    
    init(transactionType: TransactionType) {
        self.id = UUID()
        self.transactionType = transactionType
        self.isBusy = false
    }
    
    
    //MARK: - Method
    func processCustomerTransaction(customer: Customer, message: ConsoleMessage, completion: @escaping () -> Void) {
//        let dispatchGroup = DispatchGroup()
        
//        dispatchGroup.enter()
        isBusy.toggle()
        message.taskStartMessage(customerWatingNumber: customer.watingNumber, transactionType: customer.transaction.type)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + customer.transaction.duration) {
            message.taskEndMessage(customerWatingNumber: customer.watingNumber, transactionType: customer.transaction.type)
            self.isBusy.toggle()
//            dispatchGroup.leave()
            completion()
        }
    }
}
