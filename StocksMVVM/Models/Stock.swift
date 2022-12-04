//
//  Stock.swift
//  StocksMVVM
//
//  Created by Abduqodir's MacPro on 2022/10/21.
//

import Foundation


struct Stock: Decodable {
  let symbol: String
  let description: String
  let price: Double
  let change: String
}
