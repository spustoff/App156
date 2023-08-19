//
//  TabBar.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                        
                        Text(LocalizedStringKey(index.rawValue))
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 12, weight: .medium))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 41)
        .background(Color.gray.opacity(0.1))
    }
}

enum Tab: String, CaseIterable {
    
    case Portfolio = "Portfolio"
    
    case All_Skins = "All Skins"
    
    case News = "News"
    
    case Settings = "Settings"
    
}
