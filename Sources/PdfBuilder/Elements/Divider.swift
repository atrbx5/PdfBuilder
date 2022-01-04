import UIKit

extension Pdf {
    
    public class Divider: DocumentItemAutoBreak {

        open override func draw(rect: inout CGRect) {
            
            let context = UIGraphicsGetCurrentContext()
            context?.move(to: rect.origin)
            context?.setStrokeColor(UIColor.lightGray.cgColor)
            context?.setLineWidth(0.6)
            context?.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
            context?.strokePath()
            
            rect.origin.y += 5
            rect.size.height -= 5
        }
    }
}
