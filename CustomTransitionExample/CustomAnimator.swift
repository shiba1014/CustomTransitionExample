//
//  CustomAnimator.swift
//  CustomTransitionExample
//
//  Created by Satsuki Hashiba on 2019/04/29.
//  Copyright © 2019 Satsuki Hashiba. All rights reserved.
//

import UIKit

fileprivate struct Const {
    static let duration: Double = 0.5
    static let offset: CGFloat = 50
}

class VerticalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let isPresenting: Bool

    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Const.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else { return }

        transitionContext.containerView.backgroundColor = .white
        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)

        let offset: CGFloat = isPresenting ? Const.offset : -Const.offset

        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: 0, y: offset)

        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        fromView.alpha = 0
                        fromView.transform = CGAffineTransform(translationX: 0, y: -offset)
                        toView.alpha = 1
                        toView.transform = .identity
        }) { didComplete in
            fromView.alpha = 1
            fromView.transform = .identity
            transitionContext.completeTransition(didComplete)
        }
    }
}

class HorizontalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    enum Direction {
        case right
        case left
    }

    private let scrollDirection: Direction

    init(scrollDirection: Direction) {
        self.scrollDirection = scrollDirection
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Const.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else { return }

        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)

        let offset: CGFloat = scrollDirection == .right ? -Const.offset : Const.offset

        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: offset, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        fromView.alpha = 0
                        fromView.transform = CGAffineTransform(translationX: -offset, y: 0)
                        toView.alpha = 1
                        toView.transform = .identity
        }) { didComplete in
            fromView.alpha = 1
            fromView.transform = .identity
            transitionContext.completeTransition(didComplete)
        }
    }
}
