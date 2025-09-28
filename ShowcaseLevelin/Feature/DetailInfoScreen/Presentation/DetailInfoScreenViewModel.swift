//
//  DetailInfoScreenViewModel.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import Foundation

@MainActor
public final class DetailInfoScreenViewModel: ObservableObject {
    @Published public var items: [DetailInfoEntity] = []
    @Published public var errorMessage: String?
    
    private let useCase: DetailInfoDomainUseCase
    
    public init(useCase: DetailInfoDomainUseCase) {
        self.useCase = useCase
    }
    
    public func fetch() async {
        do {
            let result = try await useCase.fetch()
            self.items = result
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
