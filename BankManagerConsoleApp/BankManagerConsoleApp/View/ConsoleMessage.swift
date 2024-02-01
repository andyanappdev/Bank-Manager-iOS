//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

struct ConsoleMessage {
    func bankMenu() {
        print("1 : 은행 개점 \n2 : 종료")
    }
    
    func userInputMessage() {
        print("입력: ", terminator: "")
    }
    
    func inputErrorMessage() {
        print("잘못된 입력입니다.")
    }
    
    func appExitMessage() {
        print("프로그램을 종료합니다.")
    }
    
    func taskStartMessage(customerWatingNumber: Int,  transactionType: TransactionType) {
        print("\(customerWatingNumber)번 고객 \(transactionType.transactionType())업무 시작")
    }
    
    func teskEndMessage(customerWatingNumber: Int, transactionType: TransactionType) {
        print("\(customerWatingNumber)번 고객 \(transactionType.transactionType())업무 완료")
    }
    
    func bankClosingMessage(totalCustomersProcessed: Int, totalProcessingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomersProcessed)명이며, 총 업무시간은 \(String(format: "%.2f", totalProcessingTime))초입니다.")
    }
}
