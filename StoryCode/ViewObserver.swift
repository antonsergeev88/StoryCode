//
//  ViewObserver.swift
//  StoryCode
//
//  Created by Антон Сергеев on 28/07/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

import Foundation

public protocol ViewObserver {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
}

extension ViewObserver {
    public func viewDidLoad() {}
    public func viewWillAppear(_ animated: Bool) {}
    public func viewDidAppear(_ animated: Bool) {}
    public func viewWillDisappear(_ animated: Bool) {}
    public func viewDidDisappear(_ animated: Bool) {}
    public func viewWillLayoutSubviews() {}
    public func viewDidLayoutSubviews() {}
}
