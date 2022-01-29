//
//  SettingChanges.swift
//  BachelorApp
//
//  Created by Lukas Weber on 19.01.22.
//  Copyright © 2022 Lukas Weber. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct SettingChanges: View {
    @State private var userName: String = ""
//    @State private var age: String = ""
    @Binding var isShown : Bool
    @AppStorage("userName") var username = ""
    @AppStorage("age") var age = ""
    
    var body: some View {
            GeometryReader {
                metrics in
                VStack(spacing: 20) {
                    let buttonWidth = metrics.size.width * 1.0
                    let buttonHeight = metrics.size.height * 1.0
                    Text("Ändere deinen Namen oder Alter")
                        .font(.largeTitle)
                        .padding(.bottom, 100)
                        .padding(.top, 50)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                    Text("Name: ")
                            .frame(width: 100)
                            .font(.system(size: 20))
                    TextField("Hallo! Wie heißt du?", text: $username)
                            .frame(width:200)
                            .padding()
                            .background(Color.white)
                            .border(.gray)
                            .font(.system(size: 20))
                    }
                    HStack {
                    Text("Alter: ")
                            .frame(width: 100)
                            .font(.system(size: 20))
                        TextField("Wie alt bist du?", text: $age)
                                .frame(width:200)
                                .padding()
                                .background(Color.white)
                                .border(.gray)
                                .font(.system(size: 20))
                    }
                    Spacer()
                    Button {
                        isShown = false
                        print(isShown)
                    } label: {
                        HStack {

                        Text("Weiter")
                            .padding()
                            .foregroundColor(.white)
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.white)
                        }
                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                        .frame(maxHeight: 50)
                        .background(Color.green)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 50)
                }
                
            }
}
}
struct SettingChanges_Previews: PreviewProvider {
    @State static var isTrue = true
    static var previews: some View {
        if #available(iOS 14.0, *) {
            SettingChanges(isShown: $isTrue)
        } else {
            // Fallback on earlier versions
        }
    }
}
