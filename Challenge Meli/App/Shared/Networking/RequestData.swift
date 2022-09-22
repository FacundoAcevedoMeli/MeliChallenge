//
//  RequestData.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation
import Alamofire

struct RequestData {
  
  static var access_token : String = "APP_USR-6324831650222744-092202-85b8066c1904cf2c1e4c827e5db67f91-247533845"
  let path: String
  let method: Alamofire.HTTPMethod
  let headers: HTTPHeaders
  let parameters: [ String : Any ]
  
    init(endpoint : String , method : Alamofire.HTTPMethod = .get , parameters: [String : Any?] = [:] , authenticated : Bool = false){
    
    self.path = Request.baseURL + endpoint
    self.method = method

    var params : [String : Any ] = [:]
    
        for param in parameters {
          if let value = param.value {
            params[param.key] = value
          }
        }
        
        if authenticated {
            let headers : HTTPHeaders = [.authorization(bearerToken: RequestData.access_token )]
            self.headers = headers
        } else {
            self.headers = HTTPHeaders()
        }
        self.parameters = params
  }
  
  func getEncoding() -> ParameterEncoding {
    if method == .get {
      return URLEncoding.init( boolEncoding: .literal)
    } else {
      return JSONEncoding.default
    }
  }
  
}

protocol NetworkRequestTpe {
  var request : RequestData { get }
  var identifier: String { get }
  
  typealias Headers = Dictionary< String , String >
  typealias Parameters = Dictionary< String , Any >
  
}

extension NetworkRequestTpe {
  
    var identifier: String { String(describing: type(of: self)) }
    var separator : String { "\n-***************************************************************-\n" }
    
  @discardableResult
  func getRequest<T: Codable>(
    onResult: @escaping (Swift.Result<T,Error>) -> Void
  )  -> DataRequest {
      logRequest()
    return AF.request(
      request.path,
      method: request.method,
      parameters: request.parameters as Parameters,
      encoding: request.getEncoding(),
      headers: request.headers
    )
    .responseDecodable(of: T.self) { response in
        logResponse(response)        
        switch response.result {
        case .success(let data): onResult(.success(data))
        case .failure(_):
            onResult(.failure(NetworkingError(rawValue: response.response?.statusCode ?? -1 ) ?? .error))
      }
    }
  }
    
    func logRequest(){
        var message = "\(request.method.rawValue.capitalized) - \(identifier)"
        message += "\n Domain : "
        message += "Request path : \(request.path)"
        // Headers
        message += "\n\tHeaders: "
        message += "\(request.headers)"
        // Parameter
        message += "\n\tParameters: "
        message += "\(request.parameters)"
        print(separator + message + separator)
    }
    
    func logResponse<T : Codable>( _ response : AFDataResponse<T>){
                
        var message = ""
        
        if let statusCode = response.response?.statusCode {
            message += ( statusCode >= 200 || statusCode <= 299 ) ? "Success" : "Error"
            message += " - \(statusCode) "
        }

        message += "\n\tDomain : \(request.path)"
        message += "\n\tParameters : \(request.parameters)"
        
        if let json = getJSONFromData(object: response.value) {
            message += "\n\tResponse : \n"
            message += json
        }
        print(separator + message + separator)
    }
    
    func getJSONFromData<T:Codable>(object : T?) -> String? {
        guard let object = object else {
            return nil
        }
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            
            let jsonData = try jsonEncoder.encode(object)
            let json = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            
            return json?
                .replacingOccurrences(of: "\n", with: "\n")
                .replacingOccurrences(of: "  ", with: "\t")
                .replacingOccurrences(of: " : ", with: "\t: ")
        } catch {
            return nil
        }
    }
}

enum NetworkingError :  Error {
    case error
    case unauhtorized
    case mappingError
    case emptyResponse
    case unknownError
    case emptyProducts
    case unknownCategory
    
    init?(rawValue: Int) {
        switch rawValue {
        case -1 :
            self = .unknownError
            break
        case 401 :
            self = .unauhtorized
            break
        default :
            self = .error
        }
    }
}
