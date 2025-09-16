//
//  SkipButton.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/14/25.
//

import SwiftUI

struct SkipButton<Destination: View> : View {
    let destination: Destination
    
    var body: some View {
        HStack {
            Spacer() // pushes `Skip` to far right
            NavigationLink(destination: destination) {
                Text("Skip")
                    .font(Font.custom("OpenSans-Regular", size: 18))
                    .foregroundColor(.white)
                    .padding(.trailing, 30)
            }
        }
        .zIndex(1.0)
    }
}

