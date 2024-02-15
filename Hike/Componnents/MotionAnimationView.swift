//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Ibrahim.desouky on 13/02/2024.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK :- properies
    
    @State private var randomCircle : Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    // mark functions
    //1- random coordinate
    func randomCoordinate() -> CGFloat{
        CGFloat.random(in: 0...256)
    }
    //2- random size
    func randomSize() -> CGFloat{
        CGFloat.random(in: 4...80)
    }
    //3- random scale
    func randomScale() -> CGFloat{
        CGFloat(Double.random(in: 0.1...2.0))
    }
    //4- random speed
    func randomSpeed() ->  Double{
        return Double.random(in: 0.05...1.0)
    }
    //5- random delay
    func randomDelay() -> Double{
        Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0 ..< randomCircle , id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(), y:randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    }
                    )
                    
            }
        }
        .frame(width: 256 , height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    
    MotionAnimationView()
        .background {
            Circle()
                .fill(.teal)
        }
    
   
}
