//
//  TestViewController.swift
//  MyCar
//
//  Created by MacBook on 10.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        let tap2 = UIPanGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        let view1 = addView(on: view, bottomOffset: -200, topOffset: 0)
        view1.addGestureRecognizer(tap1)
        view1.backgroundColor = .systemTeal
        
        let view2 = addView(on: view1, bottomOffset: 100, topOffset: 100)
        view2.addGestureRecognizer(tap2)
        view2.backgroundColor = .systemPink
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
        print(gesture.location(in: gesture.view?.superview))
        
    }

}
