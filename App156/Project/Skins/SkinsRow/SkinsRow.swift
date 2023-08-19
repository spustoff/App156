//
//  SkinsRow.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct SkinsRow: View {
    
    let index: SkinsModel
    
    @StateObject var viewModel: SkinsViewModel
    
    var body: some View {
        
        VStack(spacing: 10, content: {
            
            WebPic(urlString: index.image ?? "", width: .infinity, height: 120, cornerRadius: 10)
            
            Text(index.title ?? "")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .medium))
                .multilineTextAlignment(.center)
            
            Text("$\(String(format: "%.2f", index.price_usd ?? 0))")
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .regular))
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2)))
            
            HStack {
                
                Button(action: {
                    
                    if viewModel.favorited_skins.contains(index.id ?? 0) {
                        
                        if let indexer = viewModel.favorited_skins.firstIndex(of: index.id ?? 0) {
                            
                            viewModel.favorited_skins.remove(at: indexer)
                        }
                        
                    } else {
                        
                        viewModel.favorited_skins.append(index.id ?? 0)
                    }
                    
                }, label: {
                    
                    Image(systemName: viewModel.favorited_skins.contains(index.id ?? 0) ? "star.fill" : "star")
                        .foregroundColor(viewModel.favorited_skins.contains(index.id ?? 0) ? Color("primary") : .gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                })
                
                Spacer()
                
                Button(action: {
                    
                    if !viewModel.bought_skins.contains(index.id ?? 0) {
                        
                        viewModel.bought_skins.append(index.id ?? 0)
                        
                        viewModel.money -= Int(index.price_usd ?? 0)
                    }
                    
                }, label: {
                    
                    Text(viewModel.bought_skins.contains(index.id ?? 0) ? "Added" : "Add")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .opacity(viewModel.bought_skins.contains(index.id ?? 0) ? 0.5 : 1)
                        .disabled(viewModel.bought_skins.contains(index.id ?? 0) ? true : false)
                })
            }
        })
        .padding()
        .frame(height: 250)
        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
    }
}

struct SkinsRow_Previews: PreviewProvider {
    static var previews: some View {
        SkinsRow(index: SkinsModel(id: 0, title: "", category_id: 0, price_rub: 0, price_usd: 0, price_eur: 0, price_brl: 0, image: "", created_at: "", updated_at: "", price: 0, category: nil), viewModel: SkinsViewModel())
    }
}
