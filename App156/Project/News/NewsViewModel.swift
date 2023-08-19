//
//  NewsViewModel.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI
import Alamofire

final class NewsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var news: [NewsItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedNews: NewsItem?
    
    @AppStorage("favorited_news") var favorited_news: [String] = []
    
    func getNews() {
        
        isLoading = true
        
        self.fetchNews { result in
            
            switch result {
                
            case .success(let success):
                
                self.news = success.news
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchNews(completion: @escaping (Result<NewsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "2ba5478f-637b-4d30-8ee1-ad693814e60e",
        ]
        
        let request = AF.request("https://bzzzderui.site/api/v2/news_avia", method: .get, parameters: params)
        
        request.responseDecodable(of: NewsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
