//
//  WalkerService.swift
//  pawsome
//
//  Created by Roch on 27/03/2022.
//

import Foundation
import Alamofire

class WalkerService {
    
    //MARK: getAllWalker
    func getAllWalker(completion: @escaping (_ success: Bool, _ message: String, _ walkers: [Profile]) -> ()) {
        let url = Configuration.conf.baseURL + "owners/users/get-available-walkers"
        
        Session.nsRequest(url, method: .get).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<[Profile]>.self, from: data)
                completion(data.status, data.message, data.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", [])
            }
            
        }
    }
    
}

