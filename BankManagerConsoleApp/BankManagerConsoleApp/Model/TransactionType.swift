//
//  TransactionType.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

enum TransactionType {
    case deposit, loan
}

extension TransactionType {
    func transactionTime() -> Double {
        switch self {
        case TransactionType.deposit:
            return 0.7
        case TransactionType.loan:
            return 1.1
        }
    }
}
