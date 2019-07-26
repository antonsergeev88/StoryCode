//
//  UIViewController+DidDisappear.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var didDisppearKey = 0
    var didDisappear: ((Bool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.didDisppearKey) as? (Bool) -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.didDisppearKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeDidDisppear: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewDidDisappear(_:)))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewDidDisappear(_:)))!
        )
    }()

    @objc private func as_viewDidDisappear(_ animated: Bool) {
        as_viewDidDisappear(animated)
        didDisappear?(animated)
    }

}
