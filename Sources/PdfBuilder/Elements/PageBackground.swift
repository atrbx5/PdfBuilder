import UIKit
import SwiftUI

extension Pdf {

    open class PageBackground: DocumentItem {

        open override func draw(rect: inout CGRect) {
            var fillRect = UIGraphicsGetPDFContextBounds()
            fillRect.origin.y = rect.minY
            backgroundColorFill.setFill()

            let context = UIGraphicsGetCurrentContext()
            context?.fill(fillRect)
        }
    }
}
