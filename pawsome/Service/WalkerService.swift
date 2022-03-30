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
    func getAllWalker(completion: @escaping (_ success: Bool, _ message: String, _ walkers: [Walker]) -> ()) {
        let url = Configuration.conf.baseURL + "walker"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let walkerResponse = try JSONDecoder().decode(ApiResponse<[Walker]>.self, from: data)
                completion(walkerResponse.isSuccess, walkerResponse.message, walkerResponse.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
    //MARK: login
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ message: String, _ data:Walker?) -> ()) {
        let url = Configuration.conf.baseURL + "walker/login"
        let params = [
            "email": email,
            "password": password,
            "type": "walker"
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Walker>.self, from: data)
                
                // save the token in the database... here..
                
                
                completion(data.isSuccess,data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong",nil)
            }
            
        }
    }
    
    // MARK: registerWalker
    func registerWalker(fullName:String, experience: String, price: String, phone: String, email: String, password: String, completion: @escaping (_ success: Bool, _ message: String, _ data:Walker?) -> ()) {
        let url = Configuration.conf.baseURL + "walker"
        let params = [
            "fullName": fullName,
            "phone": phone,
            "email": email,
            "password": password,
            "experience": experience,
            "price": price
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Walker>.self, from: data)
                
                // save the token in the database... here..
                
                
                completion(data.isSuccess,data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong",nil)
            }
            
        }
    }
    
    
}

