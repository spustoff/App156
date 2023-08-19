//
//  NewsRow.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct NewsRow: View {
    
    let index: NewsItem
    
    @StateObject var viewModel: NewsViewModel
    
    var body: some View {
       
        Button(action: {
            
            viewModel.selectedNews = index
            viewModel.isDetail = true
            
        }, label: {
            
            HStack {
                
                WebPic(urlString: index.image ?? "", width: 100, height: 80, cornerRadius: 5)
                
                VStack(alignment: .leading, spacing: 7, content: {
                    
                    HStack(content:  {
                        
                        Text(index.title ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            if viewModel.favorited_news.contains(index.title ?? "") {
                                
                                if let indexer = viewModel.favorited_news.firstIndex(of: index.title ?? "") {
                                    
                                    viewModel.favorited_news.remove(at: indexer)
                                }
                                
                            } else {
                                
                                viewModel.favorited_news.append(index.title ?? "")
                            }
                            
                        }, label: {
                            
                            Image(systemName: viewModel.favorited_news.contains(index.title ?? "") ? "star.fill" : "star")
                                .foregroundColor(viewModel.favorited_news.contains(index.title ?? "") ? Color("primary") : .gray)
                                .font(.system(size: 16, weight: .regular))
                                .frame(width: 40, height: 40)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                    })
                    
                    HStack {
                        
                        Text("@Bloomberg")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Spacer()
                        
                        Text(index.date ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    
                    Text(index.content ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                })
                
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
        })
    }
}

//struct NewsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRow(index: NewsItem(resultId: 0, resultTitle: "", resultImage: "", resultMark: "", resultDateTime: "", resultText: "", resultTotalLikes: 0, resultTotalComments: 0), viewModel: NewsViewModel())
//    }
//}
