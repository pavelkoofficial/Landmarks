//
//  CircleImage.swift
//  Landsmarks
//
//  Created by Александр Павелко on 19.06.2024.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .frame(height: 250)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
