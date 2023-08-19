//
//  NewsModel.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct NewsModel: Codable, Hashable {

    var errors: Bool
    var news: [NewsItem]
}

struct NewsItem: Codable, Hashable {
    
    var title: String?
    var content: String?
    var image: String?
    var date: String?
}
