//
//  ColorSchemes.swift
//  Dualogue
//
//  Created by Alex Luna on 17/02/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI

struct ColorSchemes: View {
    var body: some View {
        VStack {
            Text("main")
            RoundedRectangle(cornerRadius: 5).foregroundColor(Color.main).frame(width: 20, height: 20, alignment: .leading).border(Color.mainBG, width: 1)
            Text("mainBG")
            RoundedRectangle(cornerRadius: 5).foregroundColor(Color.mainBG).frame(width: 20, height: 20, alignment: .leading).border(Color.mainBG, width: 1)
            Text("accentColor1")
            RoundedRectangle(cornerRadius: 5).foregroundColor(Color.accent1).frame(width: 20, height: 20, alignment: .leading).border(Color.mainBG, width: 1)
            Text("accentColor2")
            RoundedRectangle(cornerRadius: 5).foregroundColor(Color.accent2).frame(width: 20, height: 20, alignment: .leading).border(Color.mainBG, width: 1)
            Text("accentColor3")
            RoundedRectangle(cornerRadius: 5).foregroundColor(Color.accent3).frame(width: 20, height: 20, alignment: .leading).border(Color.mainBG, width: 1)
        }
    }
}

struct ColorSchemes_Previews: PreviewProvider {
    static var previews: some View {
        ColorSchemes()
    }
}


extension Color {
    public static let main = Color.white
    public static let mainBG = Color.black
    public static let accent1 = Color("accent1")
    public static let accent2 = Color("accent2")
    public static let accent3 = Color("accent3")
}
