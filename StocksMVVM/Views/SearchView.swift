//
//  SearchView.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/21.
//

import SwiftUI

struct SearchView: View {
  
  @Binding var searchTerm: String
  
  var body: some View {
    HStack {
      Spacer()
      Image(systemName: "magnifyingglass")
      
      TextField("Search", text: $searchTerm)
        .foregroundColor(.primary)
        .padding(10)
      
      Spacer()
      
    }//: HStack
    .foregroundColor(.secondary)
    .background(Color(.secondarySystemBackground))
    .cornerRadius(10)
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
    
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(searchTerm: .constant(""))
      .previewLayout(.sizeThatFits)
  }
}
