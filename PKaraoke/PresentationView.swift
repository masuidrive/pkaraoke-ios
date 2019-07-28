//
//  PresentationView.swift
//  PKaraoke
//
//  Created by Yuichiro MASUI on 2019/07/27.
//  Copyright © 2019 Yuichiro MASUI. All rights reserved.
//

import SwiftUI

struct PresentationView: View {
    @ObjectBinding var data = PresentationViewData()

    var body: some View {
        Text(self.data.data?.presentationTimeStr() ?? "NO")
    }
    
    func setData(data: PresentationData) {
        print("data.presentationTime=",data.presentationTime)
        self.data.data = data
    }
}

#if DEBUG
struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
#endif
