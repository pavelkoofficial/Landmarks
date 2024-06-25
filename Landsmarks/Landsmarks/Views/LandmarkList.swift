//
//  LandmarkList.swift
//  Landsmarks
//
//  Created by Александр Павелко on 19.06.2024.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLamarks: [Landmark] {
        modelData.landmarks.filter { Landmark in
            (!showFavoritesOnly || Landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites Only")
                })
                
                
                ForEach(filteredLamarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .animation(.default, value: filteredLamarks)
                    .navigationTitle("Landmarks")
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
