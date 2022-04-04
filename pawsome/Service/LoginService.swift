//
//  LoginService.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import Foundation
import Alamofire


class LoginService {
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ message: String,_ profile: Profile?) -> ()) {
        let url = Configuration.conf.baseURL + "users/login"
        let params = [
            "email": email,
            "password": password
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Profile>.self, from: data)
                
                // save the token in the database... here..
                GlobalConstants.KeyValues.token = data.token
                
                completion(data.status, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
}
