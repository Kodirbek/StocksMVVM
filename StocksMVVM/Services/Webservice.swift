//
//  Webservice.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/21.
//

import Foundation


class Webservice {
  
  func getNews(completion: @escaping ([Article]?) -> Void) {
    guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
      fatalError("URL does not exist!")
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      let articles = try? JSONDecoder().decode([Article].self, from: data)
      DispatchQueue.main.async {
        completion(articles)
      }
      
    }.resume()
  }
  
  
  func getStocks(completion: @escaping (([Stock]?) -> Void)) {
    guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
      fatalError("URL not found!")
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      let stocks = try? JSONDecoder().decode([Stock].self, from: data)
      DispatchQueue.main.async {
        completion(stocks)
      }
      
    }.resume()
  }
}
