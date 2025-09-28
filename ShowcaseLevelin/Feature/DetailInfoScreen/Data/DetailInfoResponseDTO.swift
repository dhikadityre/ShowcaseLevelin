//
//  DetailInfoResponseDTO.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

struct DetailInfoResponseDTO: Decodable {
    let title: String
    let description: String
    
    func toEntity() -> DetailInfoEntity {
        return DetailInfoEntity(
            title: title,
            description: description
        )
    }
}
