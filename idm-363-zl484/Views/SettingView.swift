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
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Color Mode")){
                    Toggle(isOn: .constant(true),
                           label: {Text("Dark Mode")})
                }
                Section(header: Text("Default Settings")){
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Copy Format")) {
                        Text("HEX").tag(1)
                        Text("RGB").tag(2)
                    }
                    
                    Stepper(value: $paletteCount, in: 0...$colorPalette.count) {
                        Text("Palette Count \(paletteCount)")
                    }
                }
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
