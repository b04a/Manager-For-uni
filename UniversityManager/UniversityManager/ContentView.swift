//
//  ContentView.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI

struct Home : View {
    
    let appearance = UITabBarAppearance()
    
    init() {
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().barTintColor = .blue
        UITabBar.appearance().backgroundColor = UIColor(colorTabBarAndIcon())
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            TabView {
                MainPage()
                    .tabItem {
                        Label("Главная", systemImage: "person.crop.circle") 
                    }
                SchedulePage()
                    .tabItem {
                        Label("Расписание", systemImage: "list.bullet.clipboard")
                    }  
                CreateTask()
                    .tabItem {
                        Label("Заметки", systemImage: "pin.circle")
                    }
            }
            .accentColor(colorTabBarAndIcon())
        }  
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



