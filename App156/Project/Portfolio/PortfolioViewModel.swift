//
//  PortfolioViewModel.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

final class PortfolioViewModel: ObservableObject {
    
    @AppStorage("money") var money: Int = 150000
}

