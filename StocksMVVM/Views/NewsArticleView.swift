//
//  NewsArticleView.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/24.
//

import SwiftUI

struct NewsArticleView: View {
  
  let newsArticles: [NewsArticleViewModel]
  
  var body: some View {
    
    let screenSize = UIScreen.main.bounds.size
    
    VStack(alignment: .leading) {
      
      VStack(alignment: .leading) {
        Text("Top News")
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(2)
        
        Text("From News")
          .foregroundColor(.gray)
          .font(.body)
          .fontWeight(.bold)
          .padding(2)
        
        ScrollView {
          VStack {
            ForEach(self.newsArticles, id: \.title) { article in
              HStack {
                VStack(alignment: .leading) {
                  Text(article.publication)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                  
                  Text(article.title)
                    .font(.custom("Arial", size: 20))
                    .foregroundColor(.white)
                }
              }//: HStack
            }
          }
        }//: ScrollView
        .frame(maxWidth: .infinity)
      }
      
      
      
    }
    .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    .cornerRadius(20)
    
  }
}

struct NewsArticleView_Previews: PreviewProvider {
  static var previews: some View {
    
    let article = Article(title: "NewsTitle", publication: "The Wallstreet Journal", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
    NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
  }
}
