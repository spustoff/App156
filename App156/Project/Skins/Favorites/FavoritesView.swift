//
//  FavoritesView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(\.presentationMode) var router
    
    let skins: [SkinsModel]
    
    @StateObject var viewModel: SkinsViewModel
    
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
                
                if skins.isEmpty {
                    
                    VStack(spacing: 10, content: {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Favorites are empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("Add the skins from your group here")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            
                            ForEach(viewModel.skins, id: \.self) { index in
                                
                                SkinsRow(index: index, viewModel: viewModel)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(skins: [], viewModel: SkinsViewModel())
    }
}
