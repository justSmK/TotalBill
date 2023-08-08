//
//  MainViewController.swift
//  TotalBill
//
//  Created by Sergei Semko on 8/8/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension MainViewController {
    
}
