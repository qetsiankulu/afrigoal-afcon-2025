//
//  NavigationButton.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI

struct NavigationButton<Destination: View>: View {
    let destination: Destination
    let text: String
    let isActive: Bool

    var body: some View {
        Group {
            if isActive { // Enabled state
                NavigationLink(destination: destination) {
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 360)
                        .background(Color("bttn-active"))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                
            } else { // Disabled state
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 360)
                    .background(Color("bttn-active"))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    .opacity(0.5)
            }
        }

        .padding(.bottom, 20)
    }
}
