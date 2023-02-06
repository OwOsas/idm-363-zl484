//
//  ColorExtractView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import SwiftUI

struct ColorExtractView: View {
    private var loadImg:UIImage = UIImage(named: "example")!
    @State private var colorArr:[Color] = []
    var body: some View {
        
        Rectangle()
            .frame(width: 300)
            .aspectRatio(1.6, contentMode: .fit)
            .overlay(Image("example"))
//        self.$colorArr = extractColors(from: CIImage(image: loadImg))
    }
}

struct ColorExtractView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtractView()
    }
}
