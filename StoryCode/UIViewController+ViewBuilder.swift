//
//  UIViewController+ViewBuilder.swift
//  StoryCode
//
//  Created by Антон Сергеев on 28/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var viewBuilderKey = 0
    var viewBuilder: (() -> UIView)? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.viewBuilderKey) as? () -> UIView
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.viewBuilderKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }


    static var initializeLoadViewBuilder: Void = {
        method_exchangeImplementations(
            class_getInstanceMethod(UIViewController.self, #selector(loadView))!,
            class_getInstanceMethod(UIViewController.self, #selector(as_loadView))!
        )
    }()

    @objc private func as_loadView() {
        if let viewBuilder = viewBuilder {
            view = viewBuilder()
        } else {
            as_loadView()
        }
    }

}

