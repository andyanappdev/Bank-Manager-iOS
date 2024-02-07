//
//  CustomerTransactionProgressView.swift
//  BankManagerUIApp
//
//  Created by Doyoung An on 2/7/24.
//

import UIKit

final class CustomerTransactionProgressView: UIView {
    
    //MARK: - Property
    private lazy var addCustomersButton: UIButton = configureButton(title: "고객 10명 추가", fontColor: UIColor.systemBlue)
    
    private lazy var resetButton: UIButton = configureButton(title: "초기화", fontColor: UIColor.systemRed)
    
    private lazy var buttonStackView: UIStackView = configureStackView(subViews: [addCustomersButton, resetButton], axis: NSLayoutConstraint.Axis.horizontal, distribution: UIStackView.Distribution.fillEqually, alignment: nil)
    
    private var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00 : 000"
        label.textColor = UIColor.label
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var waitingTitleLabel: UILabel = configureTitleLabel(title: "대기중", backgroundColor: UIColor.systemGreen)
    
    private lazy var processingTitleLabel: UILabel = configureTitleLabel(title: "업무중", backgroundColor: UIColor.systemBlue)
    
    private lazy var titleLabelStackView: UIStackView = configureStackView(subViews: [waitingTitleLabel, processingTitleLabel], axis: NSLayoutConstraint.Axis.horizontal, distribution: UIStackView.Distribution.fillEqually, alignment: nil)
    
    private lazy var waitingListStackView: UIStackView = configureStackView(subViews: nil, axis: NSLayoutConstraint.Axis.vertical, distribution: nil, alignment: nil, spacing: 16)
    
    private lazy var processingListStackView: UIStackView = configureStackView(subViews: nil, axis: NSLayoutConstraint.Axis.vertical, distribution: nil, alignment: nil, spacing: 16)
    
    private lazy var waitingListScrollView: UIScrollView = configureScrollView(subView: waitingListStackView)
    
    private lazy var processingListScrollView: UIScrollView = configureScrollView(subView: processingListStackView)
    
    private lazy var listStackView: UIStackView = configureStackView(subViews: [waitingListScrollView, processingListScrollView], axis: NSLayoutConstraint.Axis.horizontal, distribution: UIStackView.Distribution.fillEqually, alignment: UIStackView.Alignment.fill)
    
    private lazy var allStackView: UIStackView = configureStackView(subViews: [buttonStackView, timerLabel, titleLabelStackView, listStackView], axis: NSLayoutConstraint.Axis.vertical, distribution: nil, alignment: nil, spacing: 16)
    
    
    // MARK: - Intitializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.systemBackground
        self.addSubview(allStackView)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Method
    private func configureButton(title: String, fontColor: UIColor) -> UIButton {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setTitle(title, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = .none
        button.setTitleColor(fontColor, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func configureTitleLabel(title: String, backgroundColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = backgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func configureStackView(subViews: [UIView]?, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution?, alignment: UIStackView.Alignment?, spacing: CGFloat = 0) -> UIStackView {
        let stackView = subViews != nil ? UIStackView(arrangedSubviews: subviews) : UIStackView()
        stackView.axis = axis
        if let distribution = distribution {
            stackView.distribution = distribution
        }
        if let alignment = alignment {
            stackView.alignment = alignment
        }
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
//    private func configureHorizontalStackView(subViews: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: subViews)
//        stackView.axis = NSLayoutConstraint.Axis.horizontal
//        stackView.distribution = UIStackView.Distribution.fillEqually
////        stackView.alignment = UIStackView.Alignment.fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }
//
//    private func configureVerticalStackView(subViews: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: subViews)
//        stackView.axis = NSLayoutConstraint.Axis.vertical
//        stackView.spacing = 16
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }
    
    private func configureScrollView(subView: UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.addSubview(subView)
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    private func configureCustomerTransactionLabel(customer: Customer) -> UILabel {
        let label = UILabel()
        label.text = "\(customer.watingNumber) - \(customer.transaction.type.transactionType())"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = NSTextAlignment.center
        switch customer.transaction.type {
        case .deposit:
            label.textColor = UIColor.label
        case .loan:
            label.textColor = UIColor.systemOrange
        }
        label.tag = customer.watingNumber
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
    // MARK: - AutoLayout Setting
    private func configureConstraints() {
        allStackViewConstraints()
        waitingListStackViewConstraints()
        processingListStackViewConstraints()
    }
    
    private func allStackViewConstraints() {
        NSLayoutConstraint.activate([
            allStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            allStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            allStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            allStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func waitingListStackViewConstraints() {
        NSLayoutConstraint.activate([
            waitingListStackView.topAnchor.constraint(equalTo: waitingListScrollView.topAnchor),
            waitingListStackView.bottomAnchor.constraint(equalTo: waitingListScrollView.bottomAnchor),
            waitingListStackView.leadingAnchor.constraint(equalTo: waitingListScrollView.leadingAnchor),
            waitingListStackView.trailingAnchor.constraint(equalTo: waitingListScrollView.trailingAnchor)
        ])
    }
    
    private func processingListStackViewConstraints() {
        NSLayoutConstraint.activate([
            processingListStackView.topAnchor.constraint(equalTo: processingListScrollView.topAnchor),
            processingListStackView.bottomAnchor.constraint(equalTo: processingListScrollView.bottomAnchor),
            processingListStackView.leadingAnchor.constraint(equalTo: processingListScrollView.leadingAnchor),
            processingListStackView.trailingAnchor.constraint(equalTo: processingListScrollView.trailingAnchor)
        ])
    }
    
}
