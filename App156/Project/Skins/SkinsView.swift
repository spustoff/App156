//
//  SkinsView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct SkinsView: View {
    
    @StateObject var viewModel = SkinsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("All Skins")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            FavoritesView(skins: viewModel.skins.filter{viewModel.favorited_skins.contains($0.id ?? 0)}, viewModel: viewModel)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                    }
                }
                .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.skins.isEmpty {
                        
                        VStack(spacing: 10, content: {
                            
                            Image("empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("All skins will be here")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("Now our platform does not have any skin")
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
        .onAppear {
            
            viewModel.getSkins()
        }
    }
}

struct SkinsView_Previews: PreviewProvider {
    static var previews: some View {
        SkinsView()
    }
}
