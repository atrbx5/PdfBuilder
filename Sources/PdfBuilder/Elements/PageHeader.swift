import Foundation
import UIKit

extension Pdf {
    
    open class PageHeader: DocumentItem {
        
        var top: [DocumentItem]
        var bottom: [DocumentItem]
        
        public init(top: [DocumentItem], bottom: [DocumentItem] = [], backgroundColorFill: UIColor? = nil) {
            self.top = top
            self.bottom = bottom
            super.init()
            self.backgroundColorFill = backgroundColorFill ?? .clear
        }
        
        open override func draw(rect: inout CGRect) {
            
            drawTop(rect: &rect)
            drawBottom(rect: &rect)
        }

        func drawTop(rect: inout CGRect) {

            var tempRect = estimateDraw(rect: rect, elements: top)

            var fillRect = UIGraphicsGetPDFContextBounds()
            fillRect.origin.y = rect.origin.y
            fillRect.size.height = rect.height - tempRect.height

            backgroundColorFill.setFill()

            let context = UIGraphicsGetCurrentContext()
            context?.fill(fillRect)

            for item in top {
                item.draw(rect: &rect)
            }
        }

        func drawBottom(rect: inout CGRect) {
            /// Measure bottom header size
            let tempRect = estimateDraw(rect: rect, elements: bottom)

            let move = tempRect.height
            let contentHeight = rect.height - move

            /// Fill

            var fillRect = UIGraphicsGetPDFContextBounds()
            fillRect.origin.y = rect.origin.y + move
            fillRect.size.height = contentHeight

            backgroundColorFill.setFill()

            let context = UIGraphicsGetCurrentContext()
            context?.fill(fillRect)

            /// Draw bottom header

            var bottomRect = rect
            bottomRect.origin.y += move
            bottomRect.size.height -= move

            for item in bottom {
                item.draw(rect: &bottomRect)
            }
        }
    }
}
