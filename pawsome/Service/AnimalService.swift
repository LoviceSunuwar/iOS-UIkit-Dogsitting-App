//
//  AnimalService.swift
//  Pawsome
//
//  Created by Roch on 03/04/2022.
//

import Foundation
import Alamofire

class AnimalService {
    
    func getAnimal(completion: @escaping (_ success: Bool, _ message: String, _ animal: [Animal
                                                                                        ]) -> ()) {
        let url = Configuration.conf.baseURL + "owners/animals"
        
        Session.nsRequest(url, method: .get).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ApiResponse<[Animal]>.self, from: data)
                completion(response.status, response.message, response.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Something went wrong",[])
            }
            
        }
    }
    
    func createAnimal(animalName:String, dob:String, breedType:String, completion: @escaping (_ success: Bool, _ message: String, _ animal: Animal? ) -> ()) {
        let url = Configuration.conf.baseURL + "owner/animals"
        let params = [
            "animal_name": animalName,
            "date_of_birth": dob,
            "breed_type": breedType
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
    func updateAnimal(animalId:String, animalName:String, dob:String, breedType:String, completion: @escaping (_ success: Bool, _ message: String, _ animal: Animal? ) -> ()) {
        let url = Configuration.conf.baseURL + "owner/animals/" + animalId + "/update"
        let params = [
            "animal_name": animalName,
            "date_of_birth": dob,
            "breed_type": breedType
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
    
    func deleteAnimal(animalId:String, completion: @escaping (_ success: Bool, _ message: String, _ animal: Animal? ) -> ()) {
        let url = Configuration.conf.baseURL + "owner/animals/" + animalId + "/delete"
        
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                
                completion(data.status, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
}
