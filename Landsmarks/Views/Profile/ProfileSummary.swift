//
//  ProfileSummary.swift
//  Landsmarks
//
//  Created by Александр Павелко on 24.06.2024.
//

import SwiftUI

struct ProfileSummary: View {
    
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotification ? "On" : "Off")")
                Text("Season Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: \(profile.goalDate.formatted(date: .abbreviated, time: .omitted))")
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Complete Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBudge(name: "First Hike")
                            HikeBudge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBudge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
