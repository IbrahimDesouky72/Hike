//
//  SettingsView.swift
//  Hike
//
//  Created by Ibrahim.desouky on 13/02/2024.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        
        List{
            //MARK :- section header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80 , weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66 ,  weight: .black))
                            
                        Text("Editors' choice")
                            .font(.system(size: 20 ,  weight: .regular))
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80 , weight: .black))
                    Spacer()
                }.foregroundStyle(LinearGradient(colors: [.colorGreenLight , .colorGreenMedium , .colorGreenDark], startPoint: .top, endPoint: .bottom))
                    .padding(.top  , 8)
                VStack (spacing : 8){
                    Text("Where can you find \n perfect tracks?")
                    .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous  in photos but is even better once you are actually there. The hike that hope to do again someday.\n Finds the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }.multilineTextAlignment(.center)
                    .padding(.bottom,16)
                    .frame(maxWidth: .infinity)
                
            }.listRowSeparator(.hidden)
            
            
            // MARK:- section icon
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal , showsIndicators: false) {
                    HStack (spacing :  12){
                        ForEach(alternateAppIcons.indices , id: \.self) { item in
                            Button {
                                print("icon is pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){error in
                                    if error !=  nil {
                                        print("Failed to change app icon\(String(describing: error?.localizedDescription))")
                                    }else {
                                        print("Success you have changed app  icon")
                                    }
                                    
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80 , height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }

                }
                .padding(.top , 12)
                Text("Choose  your favourite app icon from the collection above.")
                    .frame(minWidth: 0 ,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom , 12)
            }.listRowSeparator(.hidden)
            
            //mark :- section aboout
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved")
                    Spacer()
                
            }
                    .padding(.vertical,8)
            ){
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", tintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPasdOS", tintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", tintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", tintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ibrahim", tintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", tintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, tintColor: .indigo ,rowLinkLabel: "Credo Academy"  , rowLinkDestination: "https://credo.academy")
            }
        }.preferredColorScheme(.dark)
        
    }
}

#Preview {
    SettingsView()
}
