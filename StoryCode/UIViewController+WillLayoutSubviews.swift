//
//  UIViewController+WillLayoutSubviews.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var willLayoutSubviewsKey = 0
    var willLayoutSubviews: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.willLayoutSubviewsKey) as? () -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.willLayoutSubviewsKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeWillLayoutSubviews: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewWillLayoutSubviews))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewWillLayoutSubviews))!
        )
    }()

    @objc private func as_viewWillLayoutSubviews() {
        as_viewWillLayoutSubviews()
        willLayoutSubviews?()
    }

}
