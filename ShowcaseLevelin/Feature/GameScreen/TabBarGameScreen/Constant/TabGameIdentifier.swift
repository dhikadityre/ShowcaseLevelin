//
//  TabGameIdentifier.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

public enum TabGameIdentifier: String, Hashable {
    case dashboard = "Dashboard"
    case favourite = "Favourite"
    
    public func toIconSystemName() -> String {
        switch self {
        case .dashboard:
            return "gamecontroller.fill"
        case .favourite:
            return "heart.fill"
        }
    }
}
