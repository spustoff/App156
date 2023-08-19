//
//  SettingsView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1MtEVLTtZPlHyyC1y59GQ-EfjytCB9k_EDLzFYE1mC3Q/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Rate Us")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                NavigationLink(destination: {
                    
                    SettingsRoulette()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "sun.min.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Random Picking Game")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                    .padding(.top)
                })
                
                Text("Drop a random skin into a random group of yours")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
