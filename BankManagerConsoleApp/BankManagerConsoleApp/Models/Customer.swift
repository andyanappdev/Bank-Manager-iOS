//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/27/24.
//

/// 고객의 서버스 종류 설정
enum TaskType {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}

/// 고객의 고유 번호 설정
struct Customer {
    let waitingNumber: Int
    let task: TaskType
    
    init(waitingNumber: Int, task: TaskType) {
        self.waitingNumber = waitingNumber
        self.task = task
    }
}
