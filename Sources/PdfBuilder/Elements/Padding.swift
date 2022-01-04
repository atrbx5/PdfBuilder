import UIKit

extension Pdf {

    open class Padding: DocumentItemAutoBreak {

        let size: CGFloat
        let element: DocumentItem

        init(size: CGFloat, _ element: DocumentItem) {
            self.size = size
            self.element = element
        }

        open override func draw(rect: inout CGRect) {
            var insetRect = rect.insetBy(dx: size, dy: size)

            element.draw(rect: &insetRect)
            let height = rect.height - insetRect.height
            rect.origin.y += height
            rect.size.height -= height
        }
    }

}
