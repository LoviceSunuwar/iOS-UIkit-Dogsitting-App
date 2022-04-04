//
//  WalkRequestService.swift
//  Pawsome
//
//  Created by Roch on 04/04/2022.
//

import Foundation
import Alamofire

class WalkRequestService {
    
    func getWalkRequest(completion: @escaping (_ success: Bool, _ message: String, _ walkRequests: [WalkRequest]) -> ()) {
        let url = Configuration.conf.baseURL + "owners/walk-requests/"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ApiResponse<[WalkRequest]>.self, from: data)
                //                    completion(ownersResponse.isSuccess, ownersResponse.message, ownersResponse.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
    func selectWalker(animalId:String, walkerId:String, noticeId:String, completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        let url = Configuration.conf.baseURL + "owners/walk-requests/select-walker"
        let params = [
            "fk_animal_id": animalId,
            "fk_walker_id": walkerId,
            "fk_notice_id": noticeId
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong")
            }
            
        }
    }
    
    
    //For Owner to reject walker
    func rejectWalker(walkerId:String, completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        let url = Configuration.conf.baseURL + "owners/walk-requests/" + walkerId + "/reject-walk-request"
        
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong")
            }
            
        }
    }
    
    
    // for walker to reject owner
    func rejectWalkRequest(walkeReqId:String, completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        let url = Configuration.conf.baseURL + "walkers/walk-requests/" + walkeReqId + "/reject-walk-request"
        
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong")
            }
            
        }
    }
    
    
    
}

