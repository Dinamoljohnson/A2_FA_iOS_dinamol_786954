//
//  products.swift
//  A2_FA_iOS_dinamol_786954
//
//  Created by user199274 on 5/26/21.
//  Copyright © 2021 MacStudent. All rights reserved.
//

import Foundation

class products {
    internal init(productName: String, productId: Int, productProvider: String, productPrice: Float, productDescription: String) {
        self.productName = productName
        self.productId = productId
        self.productProvider = productProvider
        self.productPrice = productPrice
        self.productDescription = productDescription
    }
    
    var productName: String
    var productId: Int
    var productProvider: String
    var productPrice: Float
    var productDescription: String
    
    
    
}
