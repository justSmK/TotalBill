//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    public static var identificator: String {
        return String(describing: TipsCollectionViewCell.self)
    }
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                
                contentView.layer.borderWidth = 3
                contentView.layer.borderColor = UIColor.systemOrange.cgColor
            } else {
                contentView.layer.borderWidth = 0
//                contentView.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(percentLabel)
    }
    
    public func configure(text: String) {
        percentLabel.text = text
    }
}

extension TipsCollectionViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            percentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//            percentLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
