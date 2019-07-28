import Combine
import SwiftUI

class PresentationViewData : BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var data:PresentationData? {
        willSet {
            willChange.send()
        }
    }
}
