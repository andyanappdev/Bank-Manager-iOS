//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class CustomerTransactionProgressViewController: UIViewController {

    //MARK: - Property
    private let customerTransactionProgressView: UIView
    private let bank: Bank<LinkedListQueue<Customer>>
    
    
    //MARK: - Intitializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(view: UIView, bank: Bank<LinkedListQueue<Customer>>) {
        self.customerTransactionProgressView = view
        self.bank = bank
        super.init(nibName: nil, bundle: nil)
    }
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = customerTransactionProgressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
