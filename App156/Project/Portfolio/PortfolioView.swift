//
//  PortfolioView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct PortfolioView: View {
    
    @StateObject var viewModel = PortfolioViewModel()
    @StateObject var skinsModel = SkinsViewModel()
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Portfolio")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Statistics")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack {
                                
                                Image("balance_bg")
                                
                                VStack(spacing: 10, content: {
                                    
                                    Text("Balance")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("$\(viewModel.money)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 21, weight: .black))
                                    
                                    Text("+$0 (+0,00%)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                })
                                .padding()
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            
                            HStack {
                                
                                VStack(alignment: .center, spacing: 10, content: {
                                    
                                    Text("Skins")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("\(skinsModel.bought_skins.count)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .black))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                Spacer()
                                
                                VStack(alignment: .center, spacing: 10, content: {
                                    
                                    Text("Favorites")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("\(skinsModel.favorited_skins.count)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .black))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Your Skins")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            if skinsModel.bought_skins.isEmpty {
                                
                                VStack(spacing: 10, content: {
                                    
                                    Image("empty")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("Your skins will be here")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                        .multilineTextAlignment(.center)
                                    
                                    Text("Add your first group by clicking the icon above to start adding skins")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .multilineTextAlignment(.center)
                                })
                                .padding(.horizontal)
                                .padding(.vertical, 50)
                                
                            } else {
                                
                                ScrollView(.vertical, showsIndicators: true) {
                                    
                                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                                        
                                        ForEach(skinsModel.skins.filter{skinsModel.bought_skins.contains($0.id ?? 0)}, id: \.self) { index in
                                            
                                            SkinsRow(index: index, viewModel: skinsModel)
                                        }
                                    }
                                }
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            skinsModel.getSkins()
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
