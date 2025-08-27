//
//  Home.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/14/25.
//

import SwiftUI

struct Home : View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Text("Home Screen")
                    .font(Font.custom("Staatliches-Regular", size: 28))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 360, alignment: .center)
                    .navigationBarBackButtonHidden(true) // Hides the back button
                
                
            }
        }
    }
}


#Preview {
    Home()
}
