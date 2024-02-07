//
//  CustomerTransactionLabelProtocol.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 2/7/24.
//

protocol CustomerTransactionLabelProtocol: AnyObject {
    func addCustomerTransactionLabel(with customer: Customer)
    func moveToProcessingList(with id: Int)
    func removeCustomerTransactionLabel(wit id: Int)
}
