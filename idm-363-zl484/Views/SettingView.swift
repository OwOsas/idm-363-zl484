//
//  SettingView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/1/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var colorPalette: [UIColor]
    @Binding var paletteCount:Int
    @Binding var copyFormat:Int
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Default Settings")){
                        Picker(selection: $copyFormat, label: Text("Copy Format")) {
                            Text("RGB").tag(1)
                            Text("HEX").tag(2)
                        }
                        
                        Stepper(value: $paletteCount, in: 0...$colorPalette.count) {
                            Text("Palette Count \(paletteCount)")
                        }
                    }
                }
                Spacer()
                
//                VStack{
//                    Button{
//
//                    }label: {
//                        Spacer()
//                        Text("DELETE LIBRARY")
//                        Spacer()
//                    }
//                    .padding(12)
//                    .foregroundColor(.white)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8)
//                            .foregroundColor(Color("Cancel"))
//                            .frame(minWidth: 0, maxWidth: .infinity)
//                    )
//                }.padding(20)
            }.navigationTitle(Text("Settings"))
        }
        .tabItem{
            Image(systemName: "gear")
            Text("Settings")
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
