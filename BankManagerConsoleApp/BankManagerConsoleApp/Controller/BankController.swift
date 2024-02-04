//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 2/1/24.
//

final class BankController {
    
    //MARK: - Property
    private let bank: Bank<LinkedListQueue<Customer>>
    
    init(bank: Bank<LinkedListQueue<Customer>>) {
        self.bank = bank
    }
    
    
    //MARK: - Method
    func runBank() {
        var userChoice: String?
        consoleMessage.bankMenu()
        consoleMessage.userInputMessage()
        
        repeat {
            if let choice = readLine() {
                userChoice = choice
                
                switch userChoice {
                case "1":
                    bank.open {
                        consoleMessage.bankMenu()
                        consoleMessage.userInputMessage()
                    }
                case "2":
                    consoleMessage.appExitMessage()
                default:
                    consoleMessage.inputErrorMessage()
                    consoleMessage.bankMenu()
                    consoleMessage.userInputMessage()
                }
            }
        } while userChoice != "2"
    }
}
