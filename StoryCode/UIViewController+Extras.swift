//
//  UIViewController+Extras.swift
//  StoryCode
//
//  Created by Антон Сергеев on 26/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var extrasKey = 0
    var extras: Any? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.extrasKey)
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.extrasKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

}
