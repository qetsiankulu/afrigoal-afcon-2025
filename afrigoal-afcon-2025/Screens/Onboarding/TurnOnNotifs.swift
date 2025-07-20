//
//  TurnOnNotifs.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI
import UserNotifications

struct TurnOnNotifs : View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("privacy-notice-bg-img")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Text
                VStack(spacing: 15) {
                    Spacer()
                    Text("Let us keep you updated instantly")
                        .foregroundColor(.white)
                        .font(Font.custom("Staatliches-Regular", size: 28))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                        .navigationBarBackButtonHidden(true) // Hides the back button
                    
                    Text("Allow notifications so we can alert you about importants events as they happen")
                        .foregroundColor(.white)
                        .font(Font.custom("OpenSans-Regular", size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 360, alignment: .leading)
                    
                    // Actual UI button
                    Button(action: {
                        Task {
                            await requestNotificationsPermissions()
                            navigate = true
                        }
                    }) {
                        Text("Turn on notifications")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 360)
                            .background(Color("bttn-active"))
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    
                }
                .padding(.bottom, 20)
                .navigationDestination(isPresented: $navigate) {
                    Home()
                }
                
            }
        }
    }
}
    
func requestNotificationsPermissions() async {
    let center = UNUserNotificationCenter.current()
    
    do {
        let granted =  try await center.requestAuthorization(options: [.alert, .sound, .badge])
        print(granted ? "✅ Granted" : "❌ Denied")
        
    } catch {
        print("⚠️ Permission error:", error)
    }
}



#Preview {
    TurnOnNotifs()
}


