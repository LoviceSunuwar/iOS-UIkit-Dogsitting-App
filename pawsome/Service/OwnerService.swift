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
        
        Session.nsRequest(url, method: .get).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<[Profile]>.self, from: data)
                completion(data.status , data.message, data.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", [])
            }
            
        }
    }
    
    func getAllRequestPosts(completion: @escaping (_ success: Bool, _ message: String, _ owners: [OwnersPost]) -> ()) {
        let url = Configuration.conf.baseURL + "owner/post-request"
        
        Session.nsRequest(url, method: .get).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<[OwnersPost]>.self, from: data)
                completion(data.status , data.message, data.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", [])
            }
            
        }
    }
    
}
