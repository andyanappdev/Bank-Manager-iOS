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
    weak var delegate: CustomerTransactionLabelProtocol?
    
    init(transactionType: TransactionType) {
        self.id = UUID()
        self.transactionType = transactionType
        self.isBusy = false
    }
    
    
    //MARK: - Method
    func processCustomerTransaction(customer: Customer, completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        isBusy.toggle()
        delegate?.moveToProcessingList(with: customer.watingNumber)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + customer.transaction.duration) {
            self.isBusy.toggle()
            self.delegate?.removeCustomerTransactionLabel(wit: customer.watingNumber)
            dispatchGroup.leave()
            completion()
        }
        dispatchGroup.wait()
    }
}
