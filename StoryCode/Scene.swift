//
//  Scene.swift
//  StoryCode
//
//  Created by Антон Сергеев on 30/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import UIKit

public typealias Scene = Scene0

extension Scene {
    public init(roles: [Role] = [], _ viewController: @escaping () -> ViewController) {
        let _ = UIViewController.initializeLoadViewBuilder
        let _ = UIViewController.initializeDidLoad
        let _ = UIViewController.initializeWillAppear
        let _ = UIViewController.initializeDidAppear
        let _ = UIViewController.initializeWillDisppear
        let _ = UIViewController.initializeDidDisppear
        let _ = UIViewController.initializeWillLayoutSubviews
        let _ = UIViewController.initializeDidLayoutSubviews

        self.viewController = {
            let vc = viewController()
            vc.roles = roles
            return vc
        }
    }
}
