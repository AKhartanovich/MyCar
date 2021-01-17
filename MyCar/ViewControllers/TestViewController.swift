//
//  TestViewController.swift
//  MyCar
//
//  Created by MacBook on 10.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit
//import SnapKit

class TestViewController: UIViewController {
    
    var initialCenter = CGPoint()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        
        let view1 = addView(on: view, bottomOffset: -200, topOffset: 200)
        view1.addGestureRecognizer(tap1)
        view1.addGestureRecognizer(pan)
        view1.addGestureRecognizer(swipe)
        view1.backgroundColor = .blue
        
        
//        let view2 = addView(on: view1, bottomOffset: 100, topOffset: 100)
//        view2.addGestureRecognizer(tap2)
//        view2.backgroundColor = .systemPink
//        view2.isUserInteractionEnabled = false
    }
    
    func addView(on superview: UIView, bottomOffset: CGFloat, topOffset: CGFloat) -> UIView {
        let view = UIView()
        superview.addSubview(view)
        view.activateConstraint()
        view.leading(equalTo: superview.leadingAnchor)
        view.trailing(equalTo: superview.trailingAnchor)
        view.top(equalTo: superview.topAnchor, constant: topOffset)
        view.bottom(equalTo: superview.bottomAnchor, constant: bottomOffset)
        return view
    }
    
    @objc
    func onTap(_ gesture: UIGestureRecognizer) {
//        print("Tapped! \(gesture.view)")
//        print(gesture.location(in: gesture.view?.superview))
        if gesture.view?.backgroundColor == UIColor.blue {
            gesture.view?.backgroundColor = .systemRed
        } else {
//            let a = gesture.view?.backgroundColor
            gesture.view?.backgroundColor = .blue
        }
        
    }
    @objc
    func onSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
                showAlert(userTitle: "Swipe", userMessage: "Ok")
            }
        
    }

    
    @objc func onPan(_ gesture: UIPanGestureRecognizer) {
        guard gesture.view != nil else {return}
           let piece = gesture.view!
           // Get the changes in the X and Y directions relative to
           // the superview's coordinate space.
           let translation = gesture.translation(in: piece.superview)
           if gesture.state == .began {
              // Save the view's original position.
              self.initialCenter = piece.center
           }
              // Update the position for the .began, .changed, and .ended states
           if gesture.state != .cancelled {
              // Add the X and Y translation to the view's original position.
              let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
              piece.center = newCenter
           }
           else {
              // On cancellation, return the piece to its original location.
              piece.center = initialCenter
           }
    }

}
