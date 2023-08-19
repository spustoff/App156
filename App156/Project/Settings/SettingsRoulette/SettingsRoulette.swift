//
//  SettingsRoulette.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct SettingsRoulette: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = SkinsViewModel()
    
    @State var first_counter: Int = 1
    @State var second_counter: Int = 3
    @State var isFinish: Bool = false
    
    @State var random_gift: SkinsModel?
    
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
                    
                    Text("Game")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                }
                .padding()
                
                VStack(spacing: 10, content: {
                    
                    LazyHStack {
                        
                        if !viewModel.skins.isEmpty {
                            
                            ForEach(first_counter...second_counter, id: \.self) { index in
                                
                                let index = viewModel.skins[index]
                                
                                VStack {
                                    
                                    WebPic(urlString: index.image ?? "", width: 100, height: 100, cornerRadius: 10)
                                }
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                    }
                    .padding()
                    .frame(height: 100)
                })
                
                if isFinish {
                    
                    VStack {
                        
                        VStack(spacing: 10, content: {
                            
                            Text("Winner")
                                .foregroundColor(.yellow)
                                .font(.system(size: 16, weight: .semibold))
                            
                            ZStack {
                                
                                Image("winner")
                                
                                if let image = random_gift?.image {
                                    
                                    WebPic(urlString: image, width: 90, height: 90, cornerRadius: 0)
                                }
                            }
                            
                            Text("\(random_gift?.title ?? "")")
                                .foregroundColor(Color.purple)
                                .font(.system(size: 15, weight: .semibold))
                                .multilineTextAlignment(.center)
                        })
                        
                        HStack {
                            
                            Text("Amount: ")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("\(1)")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.3)))
                        }
                        
                        HStack {
                            
                            Text("Total Price: ")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text("$\(String(format: "%.2f", random_gift?.price_usd ?? 0))")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.3)))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(.yellow, lineWidth: 1))
                    .padding()
                }
                
                Spacer()
                
                if isFinish {
                    
                    Button(action: {
                        
                        viewModel.bought_skins.append(self.random_gift?.id ?? 0)
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Add to Portfolio")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding()
                    })
                }
            }
        }
        .onAppear {
            
            viewModel.getSkins()
            
            _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in

                if self.second_counter < 15 {

                    self.first_counter += 3
                    self.second_counter += 3

                } else {
                    
                    timer.invalidate()

                    self.isFinish = true
                    self.random_gift = viewModel.skins.randomElement()
                }
            }
        }
    }
}

struct SettingsRoulette_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRoulette()
    }
}
