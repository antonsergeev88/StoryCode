//
//  UIViewController+WillAppear.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var willAppearKey = 0
    var willAppear: ((Bool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.willAppearKey) as? (Bool) -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.willAppearKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeWillAppear: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewWillAppear(_:)))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewWillAppear(_:)))!
        )
    }()

    @objc private func as_viewWillAppear(_ animated: Bool) {
        as_viewWillAppear(animated)
        willAppear?(animated)
    }

}
