//
//  TopProductResponse.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

struct TopProductResponse : Codable {
    let content : [TopProductItem]
}

struct TopProductItem : Codable {
    let id : String
    let position : Int
    let type : String
}
