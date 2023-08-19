//
//  ContentView.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Portfolio
    
    @State var server: String = ""
    @State var isDead: String = ""
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if isDead.isEmpty || server.isEmpty {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        Users_1()
                        
                    }
                    
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                PortfolioView()
                                    .tag(Tab.Portfolio)
                                
                                SkinsView()
                                    .tag(Tab.All_Skins)
                                
                                NewsView()
                                    .tag(Tab.News)
                                
                                SettingsView()
                                    .tag(Tab.Settings)
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        .onAppear {

                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
                    } else {
                        
                        Reviewers_1()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in

            if server == "0" {
                
                check_data(isCaptured: true)
            }
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        getFirebaseData(field: "isDead", completion: { result in
            
            isDead = result.absoluteString
            
            let repository = RepositorySecond()
            let myData = MyDataClass.getMyData()
            
            repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
                
                switch result {
                case .success(let data):
                    if "\(data)" == "" {
                        
                        self.server = "1"
                        
                    } else {
                        
                        self.server = "\(data)"
                    }
                    
                case .failure(_):
                    
                    self.server = self.isDead
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
