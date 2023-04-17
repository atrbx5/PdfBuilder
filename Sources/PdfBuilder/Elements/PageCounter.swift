import UIKit

public protocol PdfPageCounterProtocol: AnyObject {
    var pageNumber: Int { get set }
}

extension Pdf {

    open class TextPageCounter: DocumentItemAutoBreak, PdfPageCounterProtocol {
        public var pageNumber: Int
        public var format: String
        public var attributes: StringAttributes

        let _padding: CGFloat = 2

        public init(pageNumber: Int, format: String = "%i", attributes: StringAttributes = StringAttributes()) {
            self.pageNumber = pageNumber
            self.format = format
            self.attributes = attributes
        }

        open override func draw(rect: inout CGRect) {
            let textRect = rect.insetBy(dx: _padding, dy: _padding)
            let text = NSAttributedString(
                string: String(format: format, pageNumber),
                attributes: attributes)
            let textBounds = text.bounds(withSize: textRect.size)

            let options: NSStringDrawingOptions = [
                .usesLineFragmentOrigin,
                .truncatesLastVisibleLine
            ]
            //text.draw(in: textRect, options: options)
            text.draw(with: textRect, options: options, context: nil)

            let height = textBounds.height + 2 * _padding
            rect.origin.y += height
            rect.size.height -= height
        }
    }
}
