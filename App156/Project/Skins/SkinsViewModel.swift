//
//  SkinsViewModel.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI
import Alamofire

final class SkinsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var skins: [SkinsModel] = []
    
    @AppStorage("money") var money: Int = 150000
    @AppStorage("bought_skins") var bought_skins: [Int] = []
    @AppStorage("favorited_skins") var favorited_skins: [Int] = []
    
    func getSkins() {
        
        isLoading = true
        
        self.fetchSkins() { result in
            
            switch result {
                
            case .success(let success):
                
                self.skins = success.data ?? []
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchSkins(completion: @escaping (Result<SkinsResponseModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "5db86d1c-6d93-4436-9392-f189d8221fbd",
        ]
        
        let request = AF.request("https://csgospn.pro/api/skins", method: .get, parameters: params)
        
        request.responseDecodable(of: SkinsResponseModel.self) { response in
            
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
