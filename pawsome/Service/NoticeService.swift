//
//  NoticeService.swift
//  Pawsome
//
//  Created by Roch on 04/04/2022.
//

import Foundation
import Alamofire

class NoticeService {
    
    func getNotices(completion: @escaping (_ success: Bool, _ message: String, _ notices: [Notice]) -> ()) {
        let url = Configuration.conf.baseURL + "owners/notices"
        Session.nsRequest(url, method: .get).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", [])
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<[Notice]>.self, from: data)
                completion(data.status , data.message, data.data ?? [])
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", [])
            }
            
        }
    }
    
    func createNotice(animalId:Int, title:String, desc:String, dateTime:String, addressLine1:String, addressLine2:String, city:String, state:String, country:String, completion: @escaping (_ success: Bool, _ message: String, _ notice: Notice? ) -> ()) {
        let url = Configuration.conf.baseURL + "owners/notices"
        let params = [
//            "fk_animal_id": animalId,
            "notice_title": title,
            "notice_description": desc,
            "requested_date_time": dateTime,
            "address_line_1": addressLine1,
            "address_line_2": "Ln 2",
            "address_city": city,
            "address_state": state,
            "address_country": country
        ] as [String: Any]
        
        Session.nsRequest(url, method: .post, parameters: params).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Notice>.self, from: data)
                
                completion(data.status, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
    
    func applyNotice(noticeId:String, completion: @escaping (_ success: Bool, _ message: String, _ animal: Animal? ) -> ()) {
        let url = Configuration.conf.baseURL + "walkers/notices/"+noticeId+"/apply"
        
        Session.nsRequest(url, method: .post, parameters: nil).response { responseData in
            
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse<Animal>.self, from: data)
                completion(apiResponse.status, apiResponse.message, apiResponse.data)
                
                
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
    
}

