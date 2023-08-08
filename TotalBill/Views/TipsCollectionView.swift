//
//  TipsCollectionView.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class TipsCollectionView: UICollectionView {
    
    let tipsArray = [0, 5, 10, 15, 20, 25, 30]
    var tipsCount = 1
    
    weak var tipsDelegate: TipsCollectionViewDelegate?
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: TipsCollectionViewCell.identificator)
        delegate = self
        dataSource = self
    }
}

extension TipsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.5, height: collectionView.frame.width / 4.5)
    }
}

extension TipsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
        let currentTip = tipsArray[indexPath.row]
        tipsDelegate?.sendCurrentTip(tip: currentTip)
    }
}

extension TipsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsCollectionViewCell.identificator, for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let currentPercent = tipsArray[indexPath.row]
        let textString = "\(currentPercent)%"
        cell.configure(text: textString)
        
        return cell
    }
}

