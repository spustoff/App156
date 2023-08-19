//
//  NewsDetail.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct NewsDetail: View {
    
    let index: NewsItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        WebPic(urlString: index.image ?? "", width: .infinity, height: 250, cornerRadius: 0)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text(index.date ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 1)
                            
                            Text(index.title ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text(index.content ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        VStack(spacing: 10, content: {
                            
                            Image("empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("The comments are empty")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("No any comment on this post")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .padding(.horizontal)
                        .padding(.vertical, 50)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

//struct NewsDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetail(index: NewsItem(resultId: 0, resultTitle: "Testy1", resultImage: "https://cnews24.ru/uploads/b84/b84c4173deb030c035075d91ea7f84a0830aa501.jpg", resultMark: "", resultDateTime: "13.02.5002", resultText: "fgdgdfsgdfsgdfsgdfsgdfdfs", resultTotalLikes: 0, resultTotalComments: 0))
//    }
//}
