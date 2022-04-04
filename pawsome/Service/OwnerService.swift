//
//  OwnerService.swift
//  pawsome
//
//  Created by Roch on 28/03/2022.
//

import Foundation
import Alamofire

class OwnerService {
    
    func getAllOwner(completion: @escaping (_ success: Bool, _ message: String, _ owners: [Owner]) -> ()) {
        let url = Configuration.conf.baseURL + "owner"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let ownersResponse = try JSONDecoder().decode(ApiResponse<[Owner]>.self, from: data)
//                completion(ownersResponse.isSuccess, ownersResponse.message, ownersResponse.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
    func getAllRequestPosts(completion: @escaping (_ success: Bool, _ message: String, _ owners: [OwnersPost
                                                                                               ]) -> ()) {
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
    
    //MARK: login
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ message: String, _ data:Owner?) -> ()) {
        let url = Configuration.conf.baseURL + "owner/login"
        let params = [
            "email": email,
            "password": password,
            "type": "owner"
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Owner>.self, from: data)
                
                // save the token in the database... here..
                
                
//                completion(data.isSuccess,data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong",nil)
            }
            
        }
    }
    
    //MARK: registerOwner
    func registerOwner(fullName:String, dogName: String, phone: String, email: String, password: String, completion: @escaping (_ success: Bool, _ message: String, _ data:Owner?) -> ()) {
        let url = Configuration.conf.baseURL + "owner"
        let params = [
            "fullName": fullName,
            "dogName": dogName,
            "phone": phone,
            "email": email,
            "password": password
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Owner>.self, from: data)
                
                // save the token in the database... here..
                
                
//                completion(data.isSuccess,data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong",nil)
            }
            
        }
    }
}