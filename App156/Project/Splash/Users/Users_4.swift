//
//  Users_4.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack(spacing: 6, content: {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.white)
                        .font(.system(size: 21, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Get the most up-to-date information")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding([.horizontal, .bottom])
                .padding(.bottom, 40)
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(.gray.opacity(0.4)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct Users_4_Previews: PreviewProvider {
    static var previews: some View {
        Users_4()
    }
}
