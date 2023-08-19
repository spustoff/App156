//
//  NewsView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("News")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            NewsFavorites(news: viewModel.news.filter{viewModel.favorited_news.contains($0.title ?? "")}, viewModel: viewModel)
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
                    
                    if viewModel.news.isEmpty {
                        
                        VStack(spacing: 10, content: {
                            
                            Image("empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("The news are empty")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("Now our platform does not have any news")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.news, id: \.self) { index in
                                    
                                    NewsRow(index: index, viewModel: viewModel)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getNews()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedNews {
                
                NewsDetail(index: index)
            }
        })
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
