//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Nadeera Sampath on 2022-12-13.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        NavigationView{
            AddTabbar()
        }
    }
    
    @ViewBuilder
    func AddTabbar() -> some View {
        TabView {
            Home().navigationBarHidden(true)
            .tabItem {
              Image(systemName: "circle.grid.2x2")
            }
                      
            Home()
            .tabItem {
                Image(systemName: "plus")
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            }
            
            Home().navigationBarHidden(true)
            .tabItem {
                Image(systemName: "waveform.circle")
            }
        }
        .accentColor(.black)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
