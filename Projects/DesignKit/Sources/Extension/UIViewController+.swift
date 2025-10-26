//
//  UIViewController+.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

public extension UIViewController {
    func changeRootVC(viewController: UIViewController) {
        guard let window = self.view.window else { return }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.2,
            options: [.transitionCrossDissolve],
            animations: nil
        )
    }
    
    func push(to viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func pop<T: UIViewController>(to type: T.Type, animated: Bool = true) {
        guard let targetViewController = navigationController?.viewControllers
            .first(where: { $0 is T })
        else { return }
        navigationController?.popToViewController(targetViewController, animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func popToAndPush<T: UIViewController>(
        to type: T.Type,
        push newViewController: UIViewController,
        animated: Bool = true
    ) {
        guard let navigationController = navigationController,
              let idx = navigationController.viewControllers.firstIndex(where: { $0 is T })
        else { return }
        
        var stack = Array(navigationController.viewControllers.prefix(idx + 1))
        stack.append(newViewController)
        navigationController.setViewControllers(stack, animated: animated)
    }
    
    func present(_ viewController: UIViewController) {
        navigationController?.present(viewController, animated: false)
    }
}
