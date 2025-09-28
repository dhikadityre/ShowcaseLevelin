//
//  DetailInfoUseCase.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

public protocol DetailInfoDomainUseCase: Sendable {
    func fetch() async throws -> [DetailInfoEntity]
}
