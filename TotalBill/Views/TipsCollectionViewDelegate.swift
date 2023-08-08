//
//  TipsCollectionViewDelegate.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import Foundation

protocol TipsCollectionViewDelegate: AnyObject {
    func sendCurrentTip(tip: Int)
}
