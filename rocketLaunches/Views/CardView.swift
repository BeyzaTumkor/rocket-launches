//
//  CardView.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import SwiftUI



struct CardView: View {
    
    let launch : Launch
    var body : some View {
        
        VStack(alignment: .leading){
            Text(launch.name)
                .font(.headline)
            Spacer()
            HStack {
                
                Text(launch.windowStart ?? "No start Time")
                Spacer()
//                Label("\(launch.windowStart)", systemImage: "clock")
            }
            
        }
        .padding()
        
    }
}

//struct CardView_Previews : PreviewProvider {
//
//    //static var launch = Launch.SampleData[0]
//    static var previews: some View {
//        CardView(launch: launch)
//
//            .previewLayout(.fixed(width: 400, height: 100))
//    }
//}
