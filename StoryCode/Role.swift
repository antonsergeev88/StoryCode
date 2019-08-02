//
//  Role.swift
//  StoryCode
//
//  Created by Антон Сергеев on 03/08/2019.
//  Copyright © 2019 antonsergeev88. All rights reserved.
//

public struct Role {

    public let name: String

}

extension Role {

    public struct Name: Equatable {
        let value: String
    }

}

extension Role: ExpressibleByStringLiteral {

    public init(stringLiteral: String) {
        self.name = stringLiteral
    }

}

extension Role: RawRepresentable {

    public var rawValue: String {
        return name
    }

    public init(rawValue: String) {
        self.name = rawValue
    }
}
