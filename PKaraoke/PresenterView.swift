//
//  PresentationView.swift
//  PKaraoke
//
//  Created by Yuichiro MASUI on 2019/07/27.
//  Copyright © 2019 Yuichiro MASUI. All rights reserved.
//

import SwiftUI

struct PresenterView : View {
    @ObjectBinding var data:PresentationData
    
    @State var currentSlide = 0
    @State var remainTime = 0
    @State var timer:Timer? = nil
    
    init(data:PresentationData) {
        self.data = data
    }
    
    func isTimeup() -> Bool {
        return remainTime <= 0
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Remain time: \(Int(remainTime/60)):\(Int(remainTime) % 60)")
            }
            VStack {
                Text("Slides: \(currentSlide)/\(Int(data.slidesCount))")
            }
            if(self.isTimeup()) {
                VStack() {
                    Text("Time up!")
                }
            }
            if(PresentationWindowManager.shared.window==nil) {
                Text("no ext")
            }
            else {
                Text("connected")
            }
            
            Button("Prev slide", action:{
                self.currentSlide -= 1
            })
            Button("Next slide", action:{
                self.currentSlide += 1
            })
        }.onAppear {
            PresentationWindowManager.shared.setData(data: self.data)
            self.remainTime = Int(self.data.presentationTime)
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                if(self.remainTime <= 0) {
                    // ゲーム終了
                    self.timer?.invalidate()
                    self.timer = nil
                }
                else {
                    self.remainTime -= 1
                }
            })
        }.onDisappear {
            // TODO: 多分beta4のバグで呼ばれない
            self.timer?.invalidate()
            self.timer = nil
        }
    }
}

#if DEBUG
struct PresenterView_Previews : PreviewProvider {
    static var previews: some View {
        PresenterView(data:PresentationData())
    }
}
#endif
