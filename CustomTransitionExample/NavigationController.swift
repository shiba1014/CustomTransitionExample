//
//  NavigationController.swift
//  CustomTransitionExample
//
//  Created by Satsuki Hashiba on 2019/04/29.
//  Copyright © 2019 Satsuki Hashiba. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let direction: HorizontalAnimator.Direction = operation == .push ? .left : .right
        return HorizontalAnimator(scrollDirection: direction)
    }
}
