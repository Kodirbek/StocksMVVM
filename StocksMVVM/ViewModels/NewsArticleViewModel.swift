//
//  NewsArticleViewModel.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/24.
//

import Foundation

struct NewsArticleViewModel {
  
  let article: Article
  
  var title: String {
    return article.title
  }
  
  var publication: String {
    return article.publication.uppercased()
  }
  
  var imageURL: String {
    return article.imageURL
  }
  
}
