//
//  UIViewController+WillDisappear.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var willDisppearKey = 0
    var willDisappear: ((Bool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.willDisppearKey) as? (Bool) -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.willDisppearKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeWillDisppear: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewWillDisappear(_:)))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewWillDisappear(_:)))!
        )
    }()

    @objc private func as_viewWillDisappear(_ animated: Bool) {
        as_viewWillDisappear(animated)
        willDisappear?(animated)
    }

}
