//
//  Extensions.swift
//  MyCar
//
//  Created by MacBook on 8.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

extension UIView {
    ///Создает констрейнты во весь экран
    func fillSuperView() {
        guard let superview = superview else {return}
        self.translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
    func top(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0){
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    func bottom(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,constant: CGFloat = 0){
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    func leading(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,constant: CGFloat = 0){
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    func trailing(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,constant: CGFloat = 0){
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    func height(constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    func width(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    func activateConstraint() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    ///Создает кастомную персонализацию вьюхи
    func createCustomViewWith(borderWidth: CGFloat = 0, borderColor: CGColor, cornerRadius: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.cornerRadius = cornerRadius
    }
}

extension UIColor {
    ///Функция чтобы цвет можно было заполнить просто
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UITextField {
    ///Задает для текстфилда цвет шрифта и текст внутри его
    func setPlaceHolderWith(color: UIColor, text: String){
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    ///Отступ в текстфилдах
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.rightView = UIView(frame: CGRect(x: self.frame
                                                .minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.rightViewMode = .always
        self.leftViewMode = .always
    }
}

extension UITabBar {
    ///В таббарвьюконтроллере делает прозрачным таббар
    static func setTransparentTabbar () {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}

extension UIViewController {
    func showAlert(userTitle: String, userMessage: String) {
        let alert = UIAlertController(title: userTitle, message: userMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Return", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension UILabel {
    func createLableGasoline(textColor: UIColor, numberOfLines: Int, textAlignment: NSTextAlignment, text: String) {
        activateConstraint()
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.text = text
    }
    
}
