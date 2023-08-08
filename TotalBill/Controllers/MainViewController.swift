//
//  MainViewController.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = .label
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .label
        label.font = UIFont(name: "Avenir Next Bold", size: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        return label
    }()
    
    private let totalBillView = TotalBillView()
    
    private let personsView = PersonsView()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let tipsView = TipsView()
    
    private var currentTip: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        addGestureRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = .init(width: view.frame.width, height: calculateButton.frame.maxY + 10)
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
//        view.addSubview(scrollView)
        
//        scrollView.addSubview(titleLabel)
//        scrollView.addSubview(descriptionLabel)
//        scrollView.addSubview(totalBillView)
//        scrollView.addSubview(personsView)
//        scrollView.addSubview(calculateButton)
//        scrollView.addSubview(tipsView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
        
        tipsView.setupDelegate(delegate: self)
    }

    @objc
    private func calculateButtonTapped(_ sender: UIButton) {
        let currentSum = totalBillView.currentSum
        let persons = personsView.countOfPersons
        let sum = currentSum + currentSum * currentTip / 100
        
        let result = sum / persons
        
        descriptionLabel.text = "\(result) per person"
        descriptionLabel.textColor = .systemRed
    }
    
    private func addGestureRecognizer() {
        let anyTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        anyTap.cancelsTouchesInView = false
        view.addGestureRecognizer(anyTap)
    }
    
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController: TipsCollectionViewDelegate {
    func sendCurrentTip(tip: Int) {
        currentTip = tip
    }
}

extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: totalBillView.leadingAnchor),
            personsView.trailingAnchor.constraint(equalTo: totalBillView.trailingAnchor),
            personsView.heightAnchor.constraint(equalToConstant: 130),
            

            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 100),
            
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            calculateButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10),
            calculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
