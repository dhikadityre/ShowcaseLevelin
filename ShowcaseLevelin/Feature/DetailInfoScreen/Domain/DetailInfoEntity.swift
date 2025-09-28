//
//  DetailInfoEntity.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import Foundation

public struct DetailInfoEntity: Identifiable, Equatable, Sendable {
    public let id = UUID()
    public let title: String
    public let description: String

    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
