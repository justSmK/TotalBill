//
//  TipsView.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class TipsView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tips"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    private let collectionView = TipsCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    public func setupDelegate(delegate: TipsCollectionViewDelegate) {
        collectionView.tipsDelegate = delegate
    }
}

extension TipsView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
