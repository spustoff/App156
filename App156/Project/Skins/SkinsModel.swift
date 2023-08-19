//
//  SkinsModel.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct SkinsResponseModel: Codable, Hashable {
    
    let error: Bool?
    let messages: [String]?
    let data: [SkinsModel]?
}

struct SkinsModel: Codable, Hashable {
    
    let id: Int?
    let title: String?
    let category_id: Int?
    let price_rub: Double?
    let price_usd: Double?
    let price_eur: Double?
    let price_brl: Double?
    let image: String?
    let created_at: String?
    let updated_at: String?
    let price: Double?
    let category: CategoryModel?
}

struct CategoryModel: Codable, Hashable {
    
    let id: Int?
    let title: String?
    let color: String?
    let created_at: String?
    let updated_at: String?
}

