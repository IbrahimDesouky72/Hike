//
//  GradiantButtonStyle.swift
//  Hike
//
//  Created by Ibrahim.desouky on 12/02/2024.
//

import Foundation
import SwiftUI

struct GradiantButton:ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal , 30)
            .background(
                
                configuration.isPressed ? 
                LinearGradient(colors:  [
                    .customGrayMedium,.customGrayLight 
                    ],
                                        startPoint: .top,
                                        endPoint: .bottom
                ) :
                LinearGradient(colors:  [
                .customGrayLight ,
                    .customGrayMedium],
                                        startPoint: .top,
                                        endPoint: .bottom
                )
                
            )
            .cornerRadius(40)
        
    }
    
}
