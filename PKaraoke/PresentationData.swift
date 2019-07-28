import Combine
import SwiftUI

class PresentationData : BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var presentationTime = 0.0 {
        willSet {
            willChange.send()
        }
    }
    
    func presentationTimeStr() -> String {
        "\(String(format: "%2d", Int(presentationTime / 60))):\(String(format: "%02d", Int(presentationTime) % 60))"
    }
    
    var slidesCount = 0.0 {
        willSet {
            willChange.send()
        }
    }
    
    func slide(index:Int) -> UIImage {
        return UIImage(named: "sample1")!
    }
}
