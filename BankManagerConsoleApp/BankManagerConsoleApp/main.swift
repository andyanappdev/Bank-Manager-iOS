//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let linkedListQueue = LinkedListQueue<Customer>()
let consoleMessage = ConsoleMessage()
let bankerManager = BankerManager(depositBankers: 2, loanBankers: 1)
let bank = Bank(waitingCustomers: linkedListQueue, bankerManager: bankerManager, message: consoleMessage)
let bankController = BankController(bank: bank)

bankController.runBank()
