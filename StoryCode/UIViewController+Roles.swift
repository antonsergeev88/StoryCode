//
//  UIViewController+Roles.swift
//  StoryCode
//
//  Created by Антон Сергеев on 03/08/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

extension UIViewController {

    private static var rolesKey = 0
    public var roles: [Role] {
        get {
            return objc_getAssociatedObject(self, &UIViewController.rolesKey) as? [Role] ?? []
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.rolesKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

}
