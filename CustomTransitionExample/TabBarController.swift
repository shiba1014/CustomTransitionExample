//
//  TabBarController.swift
//  CustomTransitionExample
//
//  Created by Satsuki Hashiba on 2019/04/29.
//  Copyright © 2019 Satsuki Hashiba. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.view.backgroundColor = .white
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let currentIndex = tabBarController.selectedIndex
        guard let nextIndex = tabBarController.viewControllers?.lastIndex(of: toVC) else { return nil }
        let direction: HorizontalAnimator.Direction = currentIndex > nextIndex ? .right : .left
        return HorizontalAnimator(scrollDirection: direction)
    }
}
