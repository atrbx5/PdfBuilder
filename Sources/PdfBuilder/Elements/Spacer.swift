import UIKit

extension Pdf {
    open class Spacer: DocumentItem {
        
        var space: CGFloat
        
        public init(_ space: CGFloat = 5) {
            self.space = space
        }
        
        open override func draw(rect: inout CGRect) {
            rect.origin.y += space
            rect.size.height -= space
        }
        
    }
}
