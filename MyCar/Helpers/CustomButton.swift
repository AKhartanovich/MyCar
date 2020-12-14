//
//  CustomButton.swift
//  MyCar
//
//  Created by MacBook on 8.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    let closure: () -> Void
    
    init(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0, title: String = "", titleColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: CGColor = .init(red: 0, green: 0, blue: 0, alpha: 0), closure: @escaping () -> Void) {
        self.closure = closure
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = cornerRadius
        self.setTitle(title, for: .normal)
        addTarget(self, action: #selector(addtrg(_:)), for: .touchUpInside)
    }
    
    @objc func addtrg(_: UIButton){
        closure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
