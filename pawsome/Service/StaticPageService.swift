//
//  StaticPageService.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import Foundation
import Alamofire


class StaticPageService {
    func getStaticPage(endPoint: String, completion: @escaping (_ success: Bool, _ message: String, _ staticPage: StaticPage? ) -> ()) {
        let url = Configuration.conf.baseURL + "page-posts/" + endPoint
        
        Session.nsRequest(url, method: .get).response { responseData in
            
            guard let json = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<StaticPage>.self, from: json)
                completion(data.status ?? false, data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong", nil)
            }
            
        }
    }
}
