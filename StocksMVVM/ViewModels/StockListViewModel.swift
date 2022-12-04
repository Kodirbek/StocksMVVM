//
//  StockListViewModel.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/21.
//

import Foundation

class StockListViewModel: ObservableObject {
  
  @Published var searchTerm: String = ""
  @Published var stocks = [StockViewModel]()
  @Published var articles = [NewsArticleViewModel]()
  
  func load() {
    fetchStocks()
    fetchNews()
  }
  
  
  private func fetchNews() {
    Webservice().getNews { articles in
      if let articles = articles {
          self.articles = articles.map(NewsArticleViewModel.init)
      }
    }
  }
  
  
  private func fetchStocks() {
    Webservice().getStocks { stocks in
      if let stocks = stocks {
          self.stocks = stocks.map(StockViewModel.init)
      }
    }
  }
  
}
