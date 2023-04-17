//
//  SecondDetailView.swift
//  DelivereeApp
//
//  Created by Nurlan Seitov on 17/4/23.
//

import SwiftUI

struct SecondDetailView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            
        VStack(alignment: .leading) {
            Group {
                Text("Choose delivery location")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                   // .padding(.top)
                //.multilineTextAlignment( )
                Text("Deliver to current location")
                    .font(.headline)
                
                Text("Manas ave")
                    .font(.body)
                
                Divider()
                Text("Deliver to different location")
                    .font(.headline)
                
                Text("Choose location on the map")
                    .font(.body)
                
                Divider()
                Spacer()
                
            }
            Group
            {
                Text("Saved Addresses")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                
                Text("Home")
                    .font(.headline)
                
                Text("Jukeev-Pudovkin St 43, apt #12")
                    .font(.body)
                
                Divider()
                Text("Work")
                    .font(.headline)
                
                Text("Manas ave 32,floor 7, office #703")
                    .font(.body)
                
                Divider()
                Text("Hotel")
                    .font(.headline)
                
                Text("Frunze St 50, floor 10, room #1011")
                    .font(.body)
                Spacer()
            }
        }
    }
}
}
        
       

struct SecondDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailView()
    }
}
