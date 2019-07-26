//
//  UIViewController+DidLayoutSubviews.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var didLayoutSubviewsKey = 0
    var didLayoutSubviews: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.didLayoutSubviewsKey) as? () -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.didLayoutSubviewsKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeDidLayoutSubviews: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewDidLayoutSubviews))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewDidLayoutSubviews))!
        )
    }()

    @objc private func as_viewDidLayoutSubviews() {
        as_viewDidLayoutSubviews()
        didLayoutSubviews?()
    }

}
