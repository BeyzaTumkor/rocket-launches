//
//  Launch.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import Foundation

struct Launch : Identifiable{
    let id: UUID
    var rocketName: String
    var location: String
    var launchWindowStartTime: String
   
    
    init(id: UUID = UUID(), rocketName: String, location: String, launchWindowStartTime: String){
        self.id = id
        self.rocketName = rocketName
        self.location = location
        self.launchWindowStartTime = launchWindowStartTime
       
    }
}

#if DEBUG
extension Launch{
    static var SampleData: [Launch] =
    [
        Launch(rocketName: "Cool Rocket", location: "Amsterdam", launchWindowStartTime: "10:20")
    ]
}
#endif
