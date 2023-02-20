//
//  ColorExtractView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import SwiftUI
import PhotosUI
import ColorKit

struct ColorExtractView: View {
    @State private var loadImg:UIImage = UIImage(named: "TestImg_05")!
    
    @State private var colorArr:[Color] = []
    @State var isPickerShowing = false
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        ScrollView{
            VStack{
//                Button{
//                    isPickerShowing = true
//                }label: {
//                    Text("Show Gallery")
//                }
                if let data = data, let uiimage = UIImage(data:data){
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFit()
                }
                
                
                PhotosPicker(
                    selection: $selectedItems,
                    maxSelectionCount: 1,
                    matching: .images
                ){
                    Text("Pick")
                }.onChange(of: selectedItems){newVal in
                    guard let item = selectedItems.first else{
                        return
                    }
                    item.loadTransferable(type: Data.self){ result in
                        switch result {
                        case .success(let data):
                            if let data = data{
                                self.data = data
                            }
                            else{
                                print("Data is nil")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                }
            }

            
            
            VStack(spacing:16){
                let colorPalette = ExtractColorPalette(UIImg: loadImg)

                HStack(spacing:0){
                    ForEach(colorPalette, id: \.self){color in
                        Rectangle()
//                            .frame(width: 40, height: 40)
                            .aspectRatio(1, contentMode: .fit)
                        .overlay(Color(uiColor: color))}
                }.mask(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.red)
                        .frame(
                            minWidth: 0, maxWidth: .infinity, minHeight: 32
                        )
                        .padding([.bottom, .top], 10))
            }.padding(20)
        }
    }
}

struct ColorExtractView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtractView()
    }
}
