//
//  Request.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation


enum Request {
    static var baseURL : String { return "https://api.mercadolibre.com/" }
}

extension Request {
    enum Category {}
    enum Product {}
}
