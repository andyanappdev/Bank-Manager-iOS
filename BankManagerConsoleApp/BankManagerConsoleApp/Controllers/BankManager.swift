//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/29/24.
//

import Foundation

let bank = Bank()

func bankStart() {
    var isRunning = true
    while isRunning {
        print("1 : 은행 개점 \n2 : 종료")
        print("입력: ",terminator: "")
        let choice = readLine()
        switch choice {
        case "1":
            bank.open()
        case "2":
            isRunning = false
        default:
            print("잘못된 입력입니다.")
        }
    }
}
