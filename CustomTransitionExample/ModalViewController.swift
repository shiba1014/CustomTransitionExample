//
//  ModalViewController.swift
//  CustomTransitionExample
//
//  Created by Satsuki Hashiba on 2019/04/29.
//  Copyright © 2019 Satsuki Hashiba. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
    }

    @IBAction func close() {
        self.dismiss(animated: true)
    }
}

extension ModalViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return VerticalAnimator(isPresenting: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return VerticalAnimator(isPresenting: false)
    }
}
