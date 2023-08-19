//
//  LoadingView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15, content: {
                
                Image("logo_big")
                
                Text("CG:GO")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .semibold))
            })
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
