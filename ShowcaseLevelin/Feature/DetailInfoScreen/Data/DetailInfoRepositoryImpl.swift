//
//  DetailInfoRepositoryImpl.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import CoreNetworkNative
import Foundation

public final class DetailInfoRepositoryImpl: DetailInfoDomainUseCase {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetch() async throws -> [DetailInfoEntity] {
        let response: [DetailInfoResponseDTO] = try await apiClient.get(
            APIEndpoint(path: "/home"),
            responseType: [DetailInfoResponseDTO].self
        )
        return response.map { $0.toEntity() }
    }
}
