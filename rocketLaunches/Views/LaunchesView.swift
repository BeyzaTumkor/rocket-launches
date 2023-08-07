//
//  LaunchesView.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import SwiftUI

struct LaunchesView: View {
    let launches: [Launch]
    
    var body: some View {
        List(launches) {launch in
            CardView(launch: launch)
        }
    }
}

//struct LaunchesView_Previews: PreviewProvider {
//    static var previews: some View{
//        LaunchesView(launches: Launch.SampleData)
//    }
//}
