//
//  Button.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI

struct Button<Destination: View>: View {
    let destination: Destination
    let text: String

    var body: some View {
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
        .padding(.bottom, 20)
    }
}
