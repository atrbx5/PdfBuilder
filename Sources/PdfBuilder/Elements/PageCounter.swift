import UIKit


extension Pdf {
    
    open class PageCounter: DocumentItem {
        
        public internal(set) var pageNumber: Int
        
        public init(pageNumber: Int) {
            self.pageNumber = pageNumber
        }
        
        public override func draw(rect: inout CGRect) {
            let text = NSAttributedString(
                string: "Page \(pageNumber)",
                attributes: StringAttributes.caption().alignment(.center))
            
            let bounds = text.bounds(withSize: rect.size)
            
            text.draw(in: CGRect(
                        x: rect.minX,
                        y: rect.maxY - bounds.size.height,
                        width: rect.width,
                        height: bounds.size.height))
            
            rect.size.height -= bounds.size.height + 5
        }
    }
}
