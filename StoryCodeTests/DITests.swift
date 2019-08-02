//
//  DITests.swift
//  StoryCodeTests
//
//  Created by Антон Сергеев on 02/08/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import XCTest
@testable import StoryCode

private class Dep {
    weak var dep: Dep?
    weak var view: View?
    weak var viewController: ViewController?
}

private class View: UIView {}

private class ViewController: UIViewController {}

class DITests: XCTestCase {

    var viewController: UIViewController?

    override func setUp() {
        viewController = Scene({
            return ViewController()
        }) .with {
            return Dep()
        } .with {
            return Dep()
        } .instantiate(connect: { viewController, dep1, dep2 in
            dep1.dep = dep2
            dep2.dep = dep1
            dep1.viewController = viewController
        }, view: { viewController, dep1, dep2 in
            let view = View()
            dep2.view = view
            return view
        })
    }

    override func tearDown() {
        viewController = nil
    }

    func testStoringExtras() {
        XCTAssert(viewController?.extras is (Dep, Dep))
    }

    func testNotLeakingExtras() {
        weak var dep = (viewController?.extras as? (Dep, Dep))?.0
        XCTAssertNotNil(dep)
        viewController = nil
        let expectation = XCTestExpectation()
        DispatchQueue.main.async {
            XCTAssertNil(dep)
            expectation.fulfill()
        }
    }

    func testConnectDeps() {
        let deps = viewController!.extras as! (Dep, Dep)
        XCTAssertTrue(deps.0.dep === deps.1)
        XCTAssertTrue(deps.1.dep === deps.0)
    }

    func testCreateView() {
        let view = viewController!.view!
        XCTAssertTrue(view is View)
    }

    func testRecreateView() {
        let view1 = viewController!.view!
        viewController!.view = nil
        let view2 = viewController!.view!
        XCTAssertNotNil(view2)
        XCTAssertTrue(view2 is View)
        XCTAssertFalse(view1 == view2)
    }

    func testConnectView() {
        let view = viewController!.view!
        let deps = viewController!.extras as! (Dep, Dep)
        XCTAssertTrue(deps.1.view === view)
    }

    func testReconnectView() {
        let deps1 = viewController!.extras as! (Dep, Dep)
        viewController!.loadViewIfNeeded()
        viewController!.view = nil
        let view = viewController!.view!
        let deps2 = viewController!.extras as! (Dep, Dep)
        XCTAssertTrue(deps1.0 === deps2.0)
        XCTAssertTrue(deps1.1 === deps2.1)
        XCTAssertTrue(deps1.1.view === view)
    }

    func testNotLeakingView() {
        weak var view = viewController!.view!
        viewController!.view = nil
        let expectation = XCTestExpectation()
        DispatchQueue.main.async {
            XCTAssertNil(view)
            expectation.fulfill()
        }
    }

}
