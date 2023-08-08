//
//  PersonsView.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class PersonsView: UIView {
    
    public var countOfPersons: Int {
        get {
            return counter
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Persons"
        label.textColor = .label
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    private let backgroundGrayView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .systemGray6
        backgroundView.layer.cornerRadius = 10
        return backgroundView
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("-", for: .normal)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .systemGray6
        button.tintColor = .systemOrange
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("+", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemGray6
        button.tintColor = .systemOrange
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.textAlignment = .center
        return label
    }()
    
    private var counter: Int = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
        
        counterLabel.text = String(counter)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        if sender == plusButton {
            counter += 1
            counterLabel.text = "\(counter)"
            minusButton.isEnabled = true
        } else {
            counter -= 1
            if counter == 2 {
                minusButton.isEnabled = false
                
            }
            counterLabel.text = "\(counter)"
        }
    }

}

extension PersonsView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: backgroundGrayView.bottomAnchor)
        ])
    }
}
