//
//  AwakableTests.swift
//  StoryCodeTests
//
//  Created by Антон Сергеев on 02/08/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import XCTest
@testable import StoryCode

private class Dep: Awakable {

    var awakeClosure: () -> Void = {}

    func awake() {
        awakeClosure()
    }
}

private class ViewController: UIViewController, Awakable {

    var awakeClosure: () -> Void = {}

    func awake() {
        awakeClosure()
    }
}

class AwakableTests: XCTestCase {

    var viewController: UIViewController?
    var depAwakeClosureWasExecute = false
    var viewControllerAwakeClosureWasExecute = false

    override func setUp() {
        viewController = Scene({
            let viewController = ViewController()
            viewController.awakeClosure = { [weak self] in
                self?.viewControllerAwakeClosureWasExecute = true
            }
            return viewController
        }) .with { () -> Dep in
            let dep = Dep()
            dep.awakeClosure = { [weak self] in
                self?.depAwakeClosureWasExecute = true
            }
            return dep
            } .instantiate()
    }

    override func tearDown() {
        viewController = nil
    }

    func testAwakeDep() {
        XCTAssertTrue(depAwakeClosureWasExecute)
    }

    func testAwakeViewController() {
        XCTAssertTrue(viewControllerAwakeClosureWasExecute)
    }

}
