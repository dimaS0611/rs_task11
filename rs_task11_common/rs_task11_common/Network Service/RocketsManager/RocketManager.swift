//
//  RocketManager.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public protocol RocketManagerProtocol {
   // func getAllRockets(completion: @escaping (Result<Smth,Error>) -> Void)
    //func getRocket(id: String)
}

public class RocketsManager {
    let router = Router<RocketsEndPoints>()
    
    public func handleNetworkResponse(_ response: HTTPURLResponse) -> NetResult<Error> {
         switch response.statusCode {
         case 200...299 : return .success
         case 401...500 : return .failure(NetworkResponse.authentificationError)
         default: return .failure(NetworkResponse.failed)
         }
     }
}


extension RocketsManager: RocketManagerProtocol {
    
    private func routerRequest<T: Codable>(_ route: RocketsEndPoints, decodeType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        router.request(route, completion: { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkResponse.ubableToDecode))
                return
            }
            
            let result = self.handleNetworkResponse(response)
            switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkResponse.noData))
                        return
                    }
                    do {
                        let apiResponse: T = try JSONDecoder().decode(decodeType, from: responseData)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(NetworkResponse.ubableToDecode))
                    }
                    
                case .failure(let failureError):
                    completion(.failure(failureError))
            }
        })
    }
    
    public func getAllRockets() {
//        routerRequest(.getAllRockets,
//                      decodeType: T##(Decodable & Encodable).Protocol, completion: T##(Result<Decodable & Encodable, Error>) -> Void)
    }
    
    public func getRocket(id: String) {
      //
    }
    
    
}
