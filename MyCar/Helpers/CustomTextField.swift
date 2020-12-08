//
//  CustomTextField.swift
//  MyCar
//
//  Created by MacBook on 8.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeHolderColor: UIColor = .clear, placeholderText: String = "", text: String = "", textColor: UIColor = .clear, indentSize: CGFloat) {
        super.init(frame: .zero)
        self.setPlaceHolderWith(color: placeHolderColor, text: placeholderText)
        self.activateConstraint()
        self.text = text
        self.textColor = textColor
        self.indent(size: indentSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
