//
//  UIViewController+DidLoad.swift
//  StoryCode
//
//  Created by Антон Сергеев on 28/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var didLoadKey = 0
    var didLoad: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.didLoadKey) as? () -> Void
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.didLoadKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeDidLoad: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(viewDidLoad))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_viewDidLoad))!
        )
    }()

    @objc private func as_viewDidLoad() {
        as_viewDidLoad()
        didLoad?()
    }

}
