//
//  ContentView.swift
//  PKaraoke
//
//  Created by Yuichiro MASUI on 2019/07/27.
//  Copyright © 2019 Yuichiro MASUI. All rights reserved.
//

import SwiftUI

struct WelcomeView : View {
    @ObjectBinding var data = PresentationData()
    
    var body: some View {
        NavigationView() {
            VStack {
                VStack {
                    Text("Presentation Time: \(data.presentationTimeStr())")
                    HStack {
                      Text("0:30").foregroundColor(.gray)
                      Slider(value: $data.presentationTime, from: 30, through: 600, by: 30)
                      Text("10:00").foregroundColor(.gray)
                    }.padding()
                }
                VStack {
                    Text("Slides Count: \(Int(data.slidesCount))")
                    HStack {
                      Text("1").foregroundColor(.gray)
                      Slider(value: $data.slidesCount, from: 0, through: 20, by: 1)
                      Text("20").foregroundColor(.gray)
                    }.padding()
                }
                NavigationLink("Start", destination: PresenterView(data:data))
            }.navigationBarTitle("Presentation Karaoke")
        }.navigationViewStyle(.stack)
    }
}

#if DEBUG
struct WelcomeView_Previews : PreviewProvider {
    static var previews: some View {
        WelcomeView().previewDevice("iPhone SE")
    }
}
#endif
