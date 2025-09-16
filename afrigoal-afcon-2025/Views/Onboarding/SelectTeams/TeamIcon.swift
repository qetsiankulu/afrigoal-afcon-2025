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
    let onTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                TeamFlag(countryCode: team.countryCode)

                TeamName(name: team.name, textColor: textColor)
            }
            .frame(width: 83, height: 90)
            .padding(.bottom, 10)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color("primary-red").opacity(0.5) : Color.clear)
                    .stroke(isSelected ? (Color("bttn-active")) : Color.clear, lineWidth: 2)
            )
            .contentShape(Rectangle())
            
            if isSelected {
                CheckmarkOverlay()
            }
        }
        .onTapGesture (perform: onTap)
    }
        
}
    
// MARK: - Subviews

private struct TeamFlag: View {
    let countryCode: String
    
    var body: some View {
        KFImage(URL(string: "https://flagsapi.com/\(countryCode)/flat/64.png"))
            .placeholder {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
            }
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(width: 55, height: 55, alignment: .center)
            .padding(.top, 18)
    }
    
    
}

private struct TeamName: View {
    let name: String
    let textColor: Color
    
    var body: some View {
        Text(name)
            .foregroundColor(textColor)
            .font(.custom("OpenSans-SemiBold", size: 11))
            .lineLimit(3)
            .multilineTextAlignment(.center)
            .frame(height: 30)
            .padding(.horizontal, 5)
    }
}

private struct CheckmarkOverlay: View {
    var body: some View {
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
