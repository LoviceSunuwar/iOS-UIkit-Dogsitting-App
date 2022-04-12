//
//  ProfileService.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit
import Alamofire

class ProfileService {
    
    func editProfile(fullName: String,phone: String, image: String, experience: String, isAvailable: Bool, completion: @escaping (_ success: Bool, _ message: String, _ profile: Profile? ) -> ()) {
        let url = Configuration.conf.baseURL + "users/edit-profile"
        let paramToSend: [String: Any] = [
            "name" : fullName,
            "years_of_experience" : experience,
            "is_available" : isAvailable,
            "encoded_image": image,
            "mobile_number": phone
        ]
        Session.nsRequest(url, method: .post, parameters: paramToSend).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse<Profile>.self, from: data)
                completion(apiResponse.status , apiResponse.message, apiResponse.data)
                
                
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
    func getProfile(completion: @escaping (_ success: Bool, _ message: String, _ profile: Profile? ) -> ()) {
        let url = Configuration.conf.baseURL + "users/me"
        
        Session.nsRequest(url, method: .post).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Profile>.self, from: data)
                completion(data.status , data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
    func changePassword(oldPassword: String, newPassword: String,  completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        let url = Configuration.conf.baseURL + "users/change-password"
        let paramToSend: [String: Any] = [
            "old_password" : oldPassword,
            "new_password" : newPassword
        ]
        
        Session.nsRequest(url, method: .post, parameters: paramToSend).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Profile>.self, from: data)
                GlobalConstants.KeyValues.token = data.token
                GlobalConstants.KeyValues.userType = EUserType.init(rawValue: data.data?.user_type_id ?? 0)
                completion(data.status , data.message)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong")
            }
            
        }
    }
}
