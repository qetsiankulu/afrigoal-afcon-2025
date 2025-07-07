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
                        .font(Font.custom("Staatliches-Regular", size: 28))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                    
                    Text("We collect some personal data to tailor your experience to your preferences.")
                        .foregroundColor(.white)
                        .font(Font.custom("OpenSans-Regular", size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                    
                    // Let's Begin button
                    NavigationButton(destination: SelectTeams(), text: "Let's Begin", isActive: true)

                    }
                    .padding(.bottom, 20)
                
            }
        }
    }
}

#Preview {
    PrivacyNotice()
}
