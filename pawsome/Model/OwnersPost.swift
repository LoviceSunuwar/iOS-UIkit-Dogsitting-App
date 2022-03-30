//
//  OwnersPost.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import Foundation

class OwnersPost {
    
    var ownerName:String
    var date:String
    var image:String
    var description:String

    init(ownerName:String, date:String, image:String, description:String)
    {
        self.ownerName=ownerName
        self.date=date
        self.image=image
        self.description=description
    }

}

