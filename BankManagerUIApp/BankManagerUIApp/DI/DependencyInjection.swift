//
//  DependencyInjection.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 2/7/24.
//

import UIKit

struct DependencyInjection {
    
    // MARK: - Property
    private let linkedListQueue: LinkedListQueue<Customer>
    private let bankerManager: BankerManager
    private let bank: Bank<LinkedListQueue<Customer>>
    private let customerTransactionProgressView: UIView
    private let customerTransactionProgressViewController: UIViewController
    
    init() {
        self.linkedListQueue = LinkedListQueue<Customer>()
        self.bankerManager = BankerManager(depositBankers: 2, loanBankers: 1)
        self.bank = Bank(waitingCustomers: linkedListQueue, bankerManager: bankerManager)
        self.customerTransactionProgressView = CustomerTransactionProgressView()
        self.customerTransactionProgressViewController = CustomerTransactionProgressViewController(view: customerTransactionProgressView, bank: bank)
    }
    
    func getCustomerTransactionProgressViewController() -> UIViewController {
        return customerTransactionProgressViewController
    }
}
