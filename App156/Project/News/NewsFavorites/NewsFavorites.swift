//
//  NewsFavorites.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct NewsFavorites: View {
    
    @Environment(\.presentationMode) var router
    
    let news: [NewsItem]
    
    @StateObject var viewModel: NewsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .semibold))
                        })
                        
                        Spacer()
                    }
                    
                    Text("Favorites")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                }
                .padding()
                
                if news.isEmpty {
                    
                    VStack(spacing: 10, content: {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Favorites are empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("Add the news from your group here")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.news, id: \.self) { index in
                                
                                NewsRow(index: index, viewModel: viewModel)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct NewsFavorites_Previews: PreviewProvider {
    static var previews: some View {
        NewsFavorites(news: [], viewModel: NewsViewModel())
    }
}
