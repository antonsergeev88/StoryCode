//
//  ViewObserverTests.swift
//  StoryCodeTests
//
//  Created by Антон Сергеев on 02/08/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import XCTest
@testable import StoryCode

private class Dep: ViewObserver {

    var didLoad: () -> Void = {}
    func viewDidLoad() { didLoad() }

    var willAppear: (Bool) -> Void = { _ in}
    func viewWillAppear(_ animated: Bool) { willAppear(animated) }

    var didAppear: (Bool) -> Void = { _ in }
    func viewDidAppear(_ animated: Bool) { didAppear(animated) }

    var willDisappear: (Bool) -> Void = { _ in }
    func viewWillDisappear(_ animated: Bool) { willDisappear(animated) }

    var didDisappear: (Bool) -> Void = { _ in }
    func viewDidDisappear(_ animated: Bool) { didDisappear(animated) }

    var willLayoutSubviews: () -> Void = {}
    func viewWillLayoutSubviews() { willLayoutSubviews() }

    var didLayoutSubviews: () -> Void = {}
    func viewDidLayoutSubviews() { didLayoutSubviews() }
}

class ViewObserverTests: XCTestCase {

    var viewController: UIViewController?

    var didLoadWasExecute = false
    var willAppearWasExecute = false
    var didAppearWasExecute = false
    var willDisappearWasExecute = false
    var didDisappearWasExecute = false
    var willLayoutSubviewsWasExecute = false
    var didLayoutSubviewsWasExecute = false

    override func setUp() {
        viewController = Scene({
            return UIViewController()
        }) .with { () -> Dep in
            let dep = Dep()
            dep.didLoad = { [weak self] in
                self?.didLoadWasExecute = true
            }
            dep.willAppear = { [weak self] _ in
                self?.willAppearWasExecute = true
            }
            dep.didAppear = { [weak self] _ in
                self?.didAppearWasExecute = true
            }
            dep.willDisappear = { [weak self] _ in
                self?.willDisappearWasExecute = true
            }
            dep.didDisappear = { [weak self] _ in
                self?.didDisappearWasExecute = true
            }
            dep.willLayoutSubviews = { [weak self] in
                self?.willLayoutSubviewsWasExecute = true
            }
            dep.didLayoutSubviews = { [weak self] in
                self?.didLayoutSubviewsWasExecute = true
            }
            return dep
        } .instantiate()
    }

    override func tearDown() {
        viewController = nil
    }

    func testDidLoad() {
        XCTAssertFalse(didLoadWasExecute)
        viewController?.viewDidLoad()
        XCTAssertTrue(didLoadWasExecute)
    }

    func testWillAppear() {
        XCTAssertFalse(willAppearWasExecute)
        viewController?.viewWillAppear(false)
        XCTAssertTrue(willAppearWasExecute)
    }

    func testDidAppear() {
        XCTAssertFalse(didAppearWasExecute)
        viewController?.viewDidAppear(false)
        XCTAssertTrue(didAppearWasExecute)
    }

    func testWillDisappear() {
        XCTAssertFalse(willDisappearWasExecute)
        viewController?.viewWillDisappear(false)
        XCTAssertTrue(willDisappearWasExecute)
    }

    func testDidDisappear() {
        XCTAssertFalse(didDisappearWasExecute)
        viewController?.viewDidDisappear(false)
        XCTAssertTrue(didDisappearWasExecute)
    }

    func testWillLayoutSubviews() {
        XCTAssertFalse(willLayoutSubviewsWasExecute)
        viewController?.viewWillLayoutSubviews()
        XCTAssertTrue(willLayoutSubviewsWasExecute)
    }

    func testDidLayoutSubviews() {
        XCTAssertFalse(didLayoutSubviewsWasExecute)
        viewController?.viewDidLayoutSubviews()
        XCTAssertTrue(didLayoutSubviewsWasExecute)
    }

}
