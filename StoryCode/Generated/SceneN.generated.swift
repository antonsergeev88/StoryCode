// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit


public struct Scene0<ViewController: UIViewController> {
    let viewController: () -> ViewController
}

extension Scene0 {
    public func with<E1>(_ e1: @escaping () -> E1) -> Scene1<ViewController, E1> {
        return Scene1(viewController: viewController, e1: e1)
    }
}

extension Scene0 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        awake(viewController)
        return viewController
    }

    public func instantiate(connect: (ViewController) -> Void) -> ViewController {
        let viewController = self.viewController()
        connect(viewController)
        awake(viewController)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController) -> UIView) -> ViewController {
        let viewController = self.viewController()
        addViewBuilder(view, viewController)
        awake(viewController)
        return viewController
    }

    public func instantiate(connect: (ViewController) -> Void, view: @escaping (ViewController) -> UIView) -> ViewController {
        let viewController = self.viewController()
        addViewBuilder(view, viewController)
        connect(viewController)
        awake(viewController)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController) -> View, _ viewController: ViewController) {
        viewController.viewBuilder = { [weak viewController] in
            guard let viewController = viewController else {
                return View()
            }
            return view(viewController)
        }
    }


    private func awake(_ viewController: ViewController) {
        if let awakable = viewController as? Awakable { awakable.awake() }
    }

}

public struct Scene1<ViewController: UIViewController, E1: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
}

extension Scene1 {
    public func with<E2>(_ e2: @escaping () -> E2) -> Scene2<ViewController, E1, E2> {
        return Scene2(viewController: viewController, e1: e1, e2: e2)
    }
}

extension Scene1 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        viewController.extras = (e1)
        addViewObservers(viewController, e1)
        awake(viewController, e1)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        viewController.extras = (e1)
        addViewObservers(viewController, e1)
        connect(viewController, e1)
        awake(viewController, e1)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        viewController.extras = (e1)
        addViewObservers(viewController, e1)
        addViewBuilder(view, viewController, e1)
        awake(viewController, e1)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1) -> Void, view: @escaping (ViewController, E1) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        viewController.extras = (e1)
        addViewObservers(viewController, e1)
        addViewBuilder(view, viewController, e1)
        connect(viewController, e1)
        awake(viewController, e1)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1) -> View, _ viewController: ViewController, _ e1: E1) {
        viewController.viewBuilder = { [weak viewController, weak e1] in
            guard let viewController = viewController, let e1 = e1 else {
                return View()
            }
            return view(viewController, e1)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1) {
        viewController.didLoad = { [weak e1] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
    }

}

public struct Scene2<ViewController: UIViewController, E1: AnyObject, E2: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
}

extension Scene2 {
    public func with<E3>(_ e3: @escaping () -> E3) -> Scene3<ViewController, E1, E2, E3> {
        return Scene3(viewController: viewController, e1: e1, e2: e2, e3: e3)
    }
}

extension Scene2 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        viewController.extras = (e1, e2)
        addViewObservers(viewController, e1, e2)
        awake(viewController, e1, e2)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        viewController.extras = (e1, e2)
        addViewObservers(viewController, e1, e2)
        connect(viewController, e1, e2)
        awake(viewController, e1, e2)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        viewController.extras = (e1, e2)
        addViewObservers(viewController, e1, e2)
        addViewBuilder(view, viewController, e1, e2)
        awake(viewController, e1, e2)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2) -> Void, view: @escaping (ViewController, E1, E2) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        viewController.extras = (e1, e2)
        addViewObservers(viewController, e1, e2)
        addViewBuilder(view, viewController, e1, e2)
        connect(viewController, e1, e2)
        awake(viewController, e1, e2)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2 else {
                return View()
            }
            return view(viewController, e1, e2)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2) {
        viewController.didLoad = { [weak e1, weak e2] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
    }

}

public struct Scene3<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
}

extension Scene3 {
    public func with<E4>(_ e4: @escaping () -> E4) -> Scene4<ViewController, E1, E2, E3, E4> {
        return Scene4(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4)
    }
}

extension Scene3 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        viewController.extras = (e1, e2, e3)
        addViewObservers(viewController, e1, e2, e3)
        awake(viewController, e1, e2, e3)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        viewController.extras = (e1, e2, e3)
        addViewObservers(viewController, e1, e2, e3)
        connect(viewController, e1, e2, e3)
        awake(viewController, e1, e2, e3)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        viewController.extras = (e1, e2, e3)
        addViewObservers(viewController, e1, e2, e3)
        addViewBuilder(view, viewController, e1, e2, e3)
        awake(viewController, e1, e2, e3)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3) -> Void, view: @escaping (ViewController, E1, E2, E3) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        viewController.extras = (e1, e2, e3)
        addViewObservers(viewController, e1, e2, e3)
        addViewBuilder(view, viewController, e1, e2, e3)
        connect(viewController, e1, e2, e3)
        awake(viewController, e1, e2, e3)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3 else {
                return View()
            }
            return view(viewController, e1, e2, e3)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3) {
        viewController.didLoad = { [weak e1, weak e2, weak e3] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
    }

}

public struct Scene4<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
}

extension Scene4 {
    public func with<E5>(_ e5: @escaping () -> E5) -> Scene5<ViewController, E1, E2, E3, E4, E5> {
        return Scene5(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5)
    }
}

extension Scene4 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        viewController.extras = (e1, e2, e3, e4)
        addViewObservers(viewController, e1, e2, e3, e4)
        awake(viewController, e1, e2, e3, e4)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        viewController.extras = (e1, e2, e3, e4)
        addViewObservers(viewController, e1, e2, e3, e4)
        connect(viewController, e1, e2, e3, e4)
        awake(viewController, e1, e2, e3, e4)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        viewController.extras = (e1, e2, e3, e4)
        addViewObservers(viewController, e1, e2, e3, e4)
        addViewBuilder(view, viewController, e1, e2, e3, e4)
        awake(viewController, e1, e2, e3, e4)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4) -> Void, view: @escaping (ViewController, E1, E2, E3, E4) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        viewController.extras = (e1, e2, e3, e4)
        addViewObservers(viewController, e1, e2, e3, e4)
        addViewBuilder(view, viewController, e1, e2, e3, e4)
        connect(viewController, e1, e2, e3, e4)
        awake(viewController, e1, e2, e3, e4)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
    }

}

public struct Scene5<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
}

extension Scene5 {
    public func with<E6>(_ e6: @escaping () -> E6) -> Scene6<ViewController, E1, E2, E3, E4, E5, E6> {
        return Scene6(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5, e6: e6)
    }
}

extension Scene5 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        viewController.extras = (e1, e2, e3, e4, e5)
        addViewObservers(viewController, e1, e2, e3, e4, e5)
        awake(viewController, e1, e2, e3, e4, e5)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        viewController.extras = (e1, e2, e3, e4, e5)
        addViewObservers(viewController, e1, e2, e3, e4, e5)
        connect(viewController, e1, e2, e3, e4, e5)
        awake(viewController, e1, e2, e3, e4, e5)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        viewController.extras = (e1, e2, e3, e4, e5)
        addViewObservers(viewController, e1, e2, e3, e4, e5)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5)
        awake(viewController, e1, e2, e3, e4, e5)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        viewController.extras = (e1, e2, e3, e4, e5)
        addViewObservers(viewController, e1, e2, e3, e4, e5)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5)
        connect(viewController, e1, e2, e3, e4, e5)
        awake(viewController, e1, e2, e3, e4, e5)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
    }

}

public struct Scene6<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject, E6: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
    let e6: () -> E6
}

extension Scene6 {
    public func with<E7>(_ e7: @escaping () -> E7) -> Scene7<ViewController, E1, E2, E3, E4, E5, E6, E7> {
        return Scene7(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5, e6: e6, e7: e7)
    }
}

extension Scene6 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        viewController.extras = (e1, e2, e3, e4, e5, e6)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6)
        awake(viewController, e1, e2, e3, e4, e5, e6)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        viewController.extras = (e1, e2, e3, e4, e5, e6)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6)
        connect(viewController, e1, e2, e3, e4, e5, e6)
        awake(viewController, e1, e2, e3, e4, e5, e6)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5, E6) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        viewController.extras = (e1, e2, e3, e4, e5, e6)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6)
        awake(viewController, e1, e2, e3, e4, e5, e6)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5, E6) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        viewController.extras = (e1, e2, e3, e4, e5, e6)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6)
        connect(viewController, e1, e2, e3, e4, e5, e6)
        awake(viewController, e1, e2, e3, e4, e5, e6)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5, E6) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5, let e6 = e6 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5, e6)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e6 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
        if let awakable = e6 as? Awakable { awakable.awake() }
    }

}

public struct Scene7<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject, E6: AnyObject, E7: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
    let e6: () -> E6
    let e7: () -> E7
}

extension Scene7 {
    public func with<E8>(_ e8: @escaping () -> E8) -> Scene8<ViewController, E1, E2, E3, E4, E5, E6, E7, E8> {
        return Scene8(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5, e6: e6, e7: e7, e8: e8)
    }
}

extension Scene7 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5, let e6 = e6, let e7 = e7 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5, e6, e7)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e6 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e7 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
        if let awakable = e6 as? Awakable { awakable.awake() }
        if let awakable = e7 as? Awakable { awakable.awake() }
    }

}

public struct Scene8<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject, E6: AnyObject, E7: AnyObject, E8: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
    let e6: () -> E6
    let e7: () -> E7
    let e8: () -> E8
}

extension Scene8 {
    public func with<E9>(_ e9: @escaping () -> E9) -> Scene9<ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9> {
        return Scene9(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5, e6: e6, e7: e7, e8: e8, e9: e9)
    }
}

extension Scene8 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5, let e6 = e6, let e7 = e7, let e8 = e8 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5, e6, e7, e8)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e6 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e7 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e8 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
        if let awakable = e6 as? Awakable { awakable.awake() }
        if let awakable = e7 as? Awakable { awakable.awake() }
        if let awakable = e8 as? Awakable { awakable.awake() }
    }

}

public struct Scene9<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject, E6: AnyObject, E7: AnyObject, E8: AnyObject, E9: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
    let e6: () -> E6
    let e7: () -> E7
    let e8: () -> E8
    let e9: () -> E9
}

extension Scene9 {
    public func with<E10>(_ e10: @escaping () -> E10) -> Scene10<ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10> {
        return Scene10(viewController: viewController, e1: e1, e2: e2, e3: e3, e4: e4, e5: e5, e6: e6, e7: e7, e8: e8, e9: e9, e10: e10)
    }
}

extension Scene9 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5, let e6 = e6, let e7 = e7, let e8 = e8, let e9 = e9 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e6 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e7 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e8 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e9 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e9 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e9 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
        if let awakable = e6 as? Awakable { awakable.awake() }
        if let awakable = e7 as? Awakable { awakable.awake() }
        if let awakable = e8 as? Awakable { awakable.awake() }
        if let awakable = e9 as? Awakable { awakable.awake() }
    }

}

public struct Scene10<ViewController: UIViewController, E1: AnyObject, E2: AnyObject, E3: AnyObject, E4: AnyObject, E5: AnyObject, E6: AnyObject, E7: AnyObject, E8: AnyObject, E9: AnyObject, E10: AnyObject> {
    let viewController: () -> ViewController
    let e1: () -> E1
    let e2: () -> E2
    let e3: () -> E3
    let e4: () -> E4
    let e5: () -> E5
    let e6: () -> E6
    let e7: () -> E7
    let e8: () -> E8
    let e9: () -> E9
    let e10: () -> E10
}


extension Scene10 {

    public func instantiate() -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        let e10 = self.e10()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10) -> Void) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        let e10 = self.e10()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        return viewController
    }

    public func instantiate(view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        let e10 = self.e10()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        return viewController
    }

    public func instantiate(connect: (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10) -> Void, view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10) -> UIView) -> ViewController {
        let viewController = self.viewController()
        let e1 = self.e1()
        let e2 = self.e2()
        let e3 = self.e3()
        let e4 = self.e4()
        let e5 = self.e5()
        let e6 = self.e6()
        let e7 = self.e7()
        let e8 = self.e8()
        let e9 = self.e9()
        let e10 = self.e10()
        viewController.extras = (e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewObservers(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        addViewBuilder(view, viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        connect(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        awake(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        return viewController
    }

    private func addViewBuilder<View: UIView>(_ view: @escaping (ViewController, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10) -> View, _ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9, _ e10: E10) {
        viewController.viewBuilder = { [weak viewController, weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] in
            guard let viewController = viewController, let e1 = e1, let e2 = e2, let e3 = e3, let e4 = e4, let e5 = e5, let e6 = e6, let e7 = e7, let e8 = e8, let e9 = e9, let e10 = e10 else {
                return View()
            }
            return view(viewController, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
        }
    }

    private func addViewObservers(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9, _ e10: E10) {
        viewController.didLoad = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] in
            if let observer = e1 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e2 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e3 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e4 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e5 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e6 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e7 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e8 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e9 as? ViewObserver { observer.viewDidLoad() }
            if let observer = e10 as? ViewObserver { observer.viewDidLoad() }
        }
        viewController.willAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewWillAppear(animated) }
            if let observer = e10 as? ViewObserver { observer.viewWillAppear(animated) }
        }
        viewController.didAppear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewDidAppear(animated) }
            if let observer = e10 as? ViewObserver { observer.viewDidAppear(animated) }
        }
        viewController.willDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] animated in
            if let observer = e1 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewWillDisappear(animated) }
            if let observer = e10 as? ViewObserver { observer.viewWillDisappear(animated) }
        }
        viewController.didDisappear = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] animated in
            if let observer = e1 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e2 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e3 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e4 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e5 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e6 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e7 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e8 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e9 as? ViewObserver { observer.viewDidDisappear(animated) }
            if let observer = e10 as? ViewObserver { observer.viewDidDisappear(animated) }
        }
        viewController.willLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] in
            if let observer = e1 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e9 as? ViewObserver { observer.viewWillLayoutSubviews() }
            if let observer = e10 as? ViewObserver { observer.viewWillLayoutSubviews() }
        }
        viewController.didLayoutSubviews = { [weak e1, weak e2, weak e3, weak e4, weak e5, weak e6, weak e7, weak e8, weak e9, weak e10] in
            if let observer = e1 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e2 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e3 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e4 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e5 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e6 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e7 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e8 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e9 as? ViewObserver { observer.viewDidLayoutSubviews() }
            if let observer = e10 as? ViewObserver { observer.viewDidLayoutSubviews() }
        }
    }

    private func awake(_ viewController: ViewController, _ e1: E1, _ e2: E2, _ e3: E3, _ e4: E4, _ e5: E5, _ e6: E6, _ e7: E7, _ e8: E8, _ e9: E9, _ e10: E10) {
        if let awakable = viewController as? Awakable { awakable.awake() }
        if let awakable = e1 as? Awakable { awakable.awake() }
        if let awakable = e2 as? Awakable { awakable.awake() }
        if let awakable = e3 as? Awakable { awakable.awake() }
        if let awakable = e4 as? Awakable { awakable.awake() }
        if let awakable = e5 as? Awakable { awakable.awake() }
        if let awakable = e6 as? Awakable { awakable.awake() }
        if let awakable = e7 as? Awakable { awakable.awake() }
        if let awakable = e8 as? Awakable { awakable.awake() }
        if let awakable = e9 as? Awakable { awakable.awake() }
        if let awakable = e10 as? Awakable { awakable.awake() }
    }

}
