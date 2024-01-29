//
//  ConsoleMessages.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/28/24.
//

import Foundation

struct ConsoleMessages {
    func customerStart(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    func customerEnd(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
    
    func bankClosure(totalCustomers: Int, time: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", time))초입니다.")
    }
}
