//
//  PrivacyNoticeView.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI

struct PrivacyNotice: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // background image
                Image("privacy-notice-bg-img")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Text
                VStack(spacing: 15) {
                    Spacer()
                    Text("Your privacy is important to us")
                        .foregroundColor(.white)
                        .font(Font.custom("Staatliches-Regular", size: 24))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                    
                    Text("We collect some personal data to tailor your experience to your preferences")
                        .foregroundColor(.white)
                        .font(Font.custom("OpenSans-Regular", size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                    
                    // Continue button
                    NavigationLink(destination: SelectTeams()) {
                        Text("Let's Begin")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 360)
                            .background(Color("bttn-active"))
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

#Preview {
    PrivacyNotice()
}
