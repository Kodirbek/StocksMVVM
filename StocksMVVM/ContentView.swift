//
//  ContentView.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject private var stockListVM = StockListViewModel()
  
  init() {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.configureWithOpaqueBackground()
    navigationBarAppearance.largeTitleTextAttributes = [
      NSAttributedString.Key.foregroundColor : UIColor.black
    ]
    navigationBarAppearance.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor : UIColor.black
    ]
    navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 152/255, green: 168/255, blue: 248/255, alpha: 1.0)
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    
    stockListVM.load() 
  }
  
  var body: some View {
    
    let filteredStocks = stockListVM.searchTerm.isEmpty ? stockListVM.stocks : stockListVM.stocks.filter {
      $0.symbol.starts(with: stockListVM.searchTerm)
    }
    
    NavigationView {
      VStack() {
        
        HStack {
          let todaysDate = Date().formatted(date: .abbreviated, time: .omitted)
          Text("\(todaysDate)")
            .font(.custom("Arial", size: 20))
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          
          Spacer()
        }
        
        SearchView(searchTerm: $stockListVM.searchTerm)
          
        StockListView(stocks: filteredStocks)
        
      }
      .background(Color(uiColor: UIColor(displayP3Red: 188/255, green: 206/255, blue: 248/255, alpha: 1.0)))
      
      .navigationTitle("Stocks")
    } //: NavView
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
