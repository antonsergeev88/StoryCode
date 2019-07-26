//
//  UIViewController+DidAppear.swift
//  StoryCode
//
//  Created by Антон Сергеев on 29/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var didAppearKey = 0
    var didAppear: ((Bool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.didAppearKey) as? (Bool) -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.didAppearKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeDidAppear: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewDidAppear(_:)))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewDidAppear(_:)))!
        )
    }()

    @objc private func as_viewDidAppear(_ animated: Bool) {
        as_viewDidAppear(animated)
        didAppear?(animated)
    }

}
