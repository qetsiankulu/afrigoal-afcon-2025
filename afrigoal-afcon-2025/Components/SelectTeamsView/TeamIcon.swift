//
//  TeamIcon.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/7/25.
//

import SwiftUI
import Kingfisher     // used to optimize API calls to retrieve images 

struct TeamIcon : View {
    let team: Team
    let textColor: Color
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
//                 Team flag
//                 Retrieve country flags making a simple API call to FlagsAPI
                KFImage(URL(string: "https://flagsapi.com/\(team.countryCode)/flat/64.png"))   // KFImage handles caching and efficient loading
                    .placeholder {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 40, height: 40)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .padding(.top, 18)
                    
                
                // Team name
                Text(team.name)
                    .foregroundColor(textColor)
                    .font(.custom("OpenSans-SemiBold", size: 11))
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                    .frame(height: 30)
            }
            .frame(width: 83, height: 90)
            .padding(.bottom, 10)
            .background(                                    // TeamIcon is selected
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color("primary-red").opacity(0.5) : Color.clear)
                    .stroke(isSelected ? (Color("bttn-active")) : Color.clear, lineWidth: 2)
            )
            .contentShape(Rectangle())
            
            // Checkmark overlay
            if isSelected {
                ZStack {
                    Rectangle()
                        .fill(Color("bttn-active"))
                        .frame(width: 18, height: 18)
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)
                }
                .clipShape(RoundedCorner(radius: 12, corners: [.topRight]))
            }
            
        }
    }
        
}
    
struct RoundedCorner: Shape {
    var radius: CGFloat = 12
    var corners: UIRectCorner = [.allCorners]

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



#Preview {
    SelectTeams()
}
