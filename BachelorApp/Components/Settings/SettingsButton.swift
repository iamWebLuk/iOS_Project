//
//  VideoButtons.swift
//  BachelorApp
//
//  Created by Lukas Weber on 15.01.22.
//  Copyright © 2022 Lukas Weber. All rights reserved.
//

import SwiftUI

struct SettingsButton: View {
    var buttonName: String
    var color: Color
    var picture: String
    @State var isShown : Bool = false
    var body: some View {
        GeometryReader {
            metrics in
            let buttonWidth = metrics.size.width * 1.0
            let buttonHeight = metrics.size.height * 1.0
            
//            NavigationLink(destination: VideoScreen()) {
        Button {
            isShown = true
        } label: {
            if #available(iOS 14.0, *) {
                Text(buttonName)
                    .font(.system(size: 25))
                Image(systemName: picture)
//                Label(buttonName, systemImage:picture)
                    .font(.system(size: 25))
            } else {
                // Fallback on earlier versions
            }
        }
        .foregroundColor(.white)
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .frame(maxHeight: 50)
        .background(color)
        .cornerRadius(30)
        .sheet(isPresented: $isShown) {
            SettingChanges(isShown: $isShown)
        }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//        }
        
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(buttonName: "abc", color: .red, picture: "pencil")
    }
}
