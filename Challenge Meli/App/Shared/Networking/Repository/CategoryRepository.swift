//
//  CategoryRepository.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

extension APIManager.Category {
  
  static func getCategory (
    request: Request.Category.GetCategory ,
    onResponse : @escaping ([Category]) -> Void ,
    onError : @escaping (Error) -> Void
  ) {
    request.getRequest { (result: Result<[Category], Error>) in
      switch result {
      case .success(let data):
        onResponse(data)
      case .failure(let error):
        onError(error)
      }
    }
  }
    
}
