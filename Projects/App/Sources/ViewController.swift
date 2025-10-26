//
//  ViewController.swift
//  NewsHabit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

import DesignKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "NewsHabit"
        label.font = .logo(size: 40)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
