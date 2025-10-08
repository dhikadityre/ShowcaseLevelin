//
//  AppRouter.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI
import SLHomePageModule

// MARK: - App Route Union Type (Using LazyRoute)
typealias AppRoute = LazyAppRoute

// MARK: - App Router
@MainActor
final class AppRouter: ObservableObject {
    @Published var currentRoute: AppRoute = .home(.home)
    @Published var navigationPath = NavigationPath()
    
    private let logger = ClientAppLoggerVisibility.shared
    
    // MARK: - Navigation Methods
    public func navigate(to route: AppRoute) {
        currentRoute = route
        navigationPath.append(route)
    }
    
    public func navigateBack() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
        
        if navigationPath.isEmpty {
            currentRoute = .home(.home)
        }
    }
    
    public func navigateToRoot() {
        navigationPath = NavigationPath()
        currentRoute = .home(.home)
    }
    
    // MARK: - Convenience Navigation Methods
    private func navigateToGameScreen() {
        navigate(to: .home(.gameScreen))
    }
    
    private func navigateToMovieScreen(with data: SLHomeEntity) {
        navigate(to: .home(.movieScreen(data: data)))
    }
    
    private func navigateToDetailInfo() {
        navigate(to: .tabBarHome(.detailInfo))
    }
    
    private func navigateToAbout() {
        navigate(to: .tabBarHome(.about))
    }
    
    // MARK: - Tab Navigation
    public func navigateToTab(_ tab: Tabidentifier) {}
    
    public func canNavigateBack() -> Bool {
        return !navigationPath.isEmpty
    }
    
    public func getCurrentDepth() -> Int {
        return navigationPath.count
    }
    
    // MARK: - Debug Methods
    func printNavigationState() {
//                logger.log("Router State - Current Route: \(currentRoute.title)")
//                logger.log("Router State - Path Depth: \(getCurrentDepth())")
//                logger.log("Router State - Can Navigate Back: \(canNavigateBack())")
    }
    
    // MARK: - Navigation State Queries
    func isAtRoot() -> Bool {
        return navigationPath.isEmpty
    }
    
    func getCurrentRouteTitle() -> String {
        return currentRoute.title
    }
    
    // MARK: - Batch Navigation Operations
    func navigateToRootAndThen(to route: AppRoute) {
        navigateToRoot()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.navigate(to: route)
        }
    }
}
