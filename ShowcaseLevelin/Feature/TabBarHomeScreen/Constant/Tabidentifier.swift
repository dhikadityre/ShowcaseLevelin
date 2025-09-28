//
//  Tabidentifier.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

public enum Tabidentifier: String, Hashable {
    case home = "Home"
    case detailInfo = "Detail Info"
    case about = "About"
    
    public func toIconSystemName() -> String {
        switch self {
        case .home:
            return "house"
        case .detailInfo:
            return "info.circle"
        case .about:
            return "person"
        }
    }
}
