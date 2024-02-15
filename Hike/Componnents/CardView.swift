//
//  CardView.swift
//  Hike
//
//  Created by Ibrahim.desouky on 12/02/2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber  : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
               // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight ,
                                        .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom
                                )
                        )
                        Spacer()
                        
                        // MARK: -
                        Button{
                            // ACTION  : SHOW ASHEET
                            isShowingSheet.toggle()
                            
                        } label: {
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([ .large,.medium] )
                        })
                        
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                }
                .padding(.horizontal , 30)
                
                //  MARK: - MAIN CONTENT
                
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button{
                    // MARK: Generate random number
                    
                    randomImage()
                }label: {
                    Text("Explore  More")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight ,
                                    .customGreenMedium],
                                           startPoint: .top, endPoint: .bottom
                            )
                        )
                        .shadow(color: .black .opacity(0.25), radius: 0.25 ,x: 1 , y: 2)
                }
                .buttonStyle(GradiantButton())
                
            }
        }
        .frame(width: 320 , height: 570)
    }
}

#Preview {
    CardView()
}
