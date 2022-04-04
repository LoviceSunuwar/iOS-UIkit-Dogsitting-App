//
//  OwnerService.swift
//  pawsome
//
//  Created by Roch on 28/03/2022.
//

import Foundation
import Alamofire

class OwnerService {
    
    func getAllOwner(completion: @escaping (_ success: Bool, _ message: String, _ owners: [Profile]) -> ()) {
        let url = Configuration.conf.baseURL + "owner"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let ownersResponse = try JSONDecoder().decode(ApiResponse<[Profile]>.self, from: data)
                //                completion(ownersResponse.isSuccess, ownersResponse.message, ownersResponse.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
    func getAllRequestPosts(completion: @escaping (_ success: Bool, _ message: String, _ owners: [OwnersPost]) -> ()) {
        let url = Configuration.conf.baseURL + "owner/post-request"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let ownersResponse = try JSONDecoder().decode(ApiResponse<[OwnersPost]>.self, from: data)
                //                    completion(ownersResponse.isSuccess, ownersResponse.message, ownersResponse.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
}
