//
//  ProductRepository.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

import Alamofire

extension APIManager.Product {
  
  static func getTopProduct (
    request: Request.Product.GetTopProduct ,
    onResponse : @escaping (TopProductResponse) -> Void ,
    onError : @escaping (Error) -> Void
  ) {
    request.getRequest { (result: Result<TopProductResponse, Error>) in
      switch result {
      case .success(let data):
        onResponse(data)
      case .failure(let error):
        onError(error)
      }
    }
  }
    
    static func multiGet (
      request: Request.Product.MultiGet ,
      onResponse : @escaping ([MultiGetResponse]) -> Void ,
      onError : @escaping (Error) -> Void
    ) {
      request.getRequest { (result: Result<[MultiGetResponse], Error>) in
        switch result {
        case .success(let data):
          onResponse(data)
        case .failure(let error):
          onError(error)
        }
      }
    }
    
}
