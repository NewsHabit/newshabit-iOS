//
//  ViewController.swift
//  NewsHabit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

import DesignKit

class ViewController: BaseViewController<UIView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(with: .back("타이틀"))
        
        let label = UILabel()
        label.text = "NewsHabit"
        label.font = .logo(size: 40)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.present(AlertViewController(type: .alert(title: "타이틀", message: "메시지", actionText: "확인")), animated: false)
        }
    }
}
