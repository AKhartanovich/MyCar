//
//  CustomGesture.swift
//  MyCar
//
//  Created by MacBook on 15.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class CustomTapGesture: UITapGestureRecognizer {
    var closure: () -> Void
    init(target: Any, closure: @escaping ()->Void) {
        self.closure = closure
        super.init(target: target, action: #selector(addtrg(_:)))
    }
    @objc func addtrg(_ gesture: UIGestureRecognizer) {
        closure()
    }
}

class CustomPanGesture: UIPanGestureRecognizer {
    var closure: () -> Void
    init(target: Any, closure: @escaping ()->Void) {
        self.closure = closure
        super.init(target: target, action: #selector(addtrg(_:)))
    }
    @objc func addtrg(_ gesture: UIGestureRecognizer) {
        closure()
    }
}

class CustomSwipeGesture: UISwipeGestureRecognizer {
    var closure: () -> Void
    init(target: Any, closure: @escaping ()->Void) {
        self.closure = closure
        super.init(target: target, action: #selector(addtrg(_:)))
    }
    @objc func addtrg(_ gesture: UIGestureRecognizer) {
        closure()
    }
}

class CustomRotationGesture: UIRotationGestureRecognizer {
    var closure: () -> Void
    init(target: Any, closure: @escaping ()->Void) {
        self.closure = closure
        super.init(target: target, action: #selector(addtrg(_:)))
    }
    @objc func addtrg(_ gesture: UIGestureRecognizer) {
        closure()
    }
}

class CustomLongPressGesture: UILongPressGestureRecognizer {
    var closure: () -> Void
    init(target: Any, closure: @escaping ()->Void) {
        self.closure = closure
        super.init(target: target, action: #selector(addtrg(_:)))
    }
    @objc func addtrg(_ gesture: UIGestureRecognizer) {
        closure()
    }
}

