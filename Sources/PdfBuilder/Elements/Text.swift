import UIKit

extension Pdf {
    
    open class Text: DocumentItemAutoBreak {
        
        let text: NSAttributedString
        var _padding: CGFloat = 2
        
        public init(_ text: String, attributes: StringAttributes = StringAttributes(), backgroundColor: UIColor? = nil) {
            self.text = NSAttributedString(
                string: text,
                attributes: attributes)
            super.init()
            self.backgroundColorFill = backgroundColor ?? .clear
        }
        
        public init(_ text: NSAttributedString, backgroundColor: UIColor? = nil) {
            self.text = text
            super.init()
            self.backgroundColorFill = backgroundColor ?? .clear
        }
        
        open override func draw(rect: inout CGRect) {
            let textRect = rect.insetBy(dx: _padding, dy: _padding)
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



