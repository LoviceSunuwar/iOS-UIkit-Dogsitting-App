//
//  Dog.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import Foundation


struct Dog: Codable {
    let id : Int
    let name: String
    let age: String
    let description:  String
    let weight: String
    let location: String
    let sex: String
    let image: String
    
    
    static func getDogs() -> [Dog] {
        return [
                    Dog(id: 1, name: "Alice", age: "9 months", description: "This is the dog's description", weight: "4 kg", location: "42 Pharmacy Avenue, Scarborough", sex: "Female", image: "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
                    Dog(id: 2, name: "Tommy", age: "9 months", description: "This is the dog's description", weight: "4 kg", location: "42 Pharmacy Avenue, Scarborough", sex: "Male", image: "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
                    Dog(id: 3, name: "Kutta", age: "9 months", description: "This is the dog's description", weight: "4 kg", location: "42 Pharmacy Avenue, Scarborough", sex: "Male", image: "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
                    Dog(id: 4, name: "Roch", age: "9 months", description: "This is the dog's description", weight: "4 kg", location: "42 Pharmacy Avenue, Scarborough", sex: "Male", image: "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
                    Dog(id: 5, name: "Alice", age: "9 months", description: "This is the dog's description", weight: "4 kg", location: "42 Pharmacy Avenue, Scarborough", sex: "Male", image: "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg")
        
        ]
    }
}
