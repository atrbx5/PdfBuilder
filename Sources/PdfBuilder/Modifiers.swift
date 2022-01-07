import UIKit

public extension DocumentItem {

    func background(_ color: UIColor) -> DocumentItem {
        Pdf.Background(color: color, self)
    }

    func padding(_ size: CGFloat) -> DocumentItem {
        Pdf.Padding(size: size, self)
    }
    
    func clipShape(_ shape: Pdf.Shape) -> DocumentItem {
        Pdf.ClipShape(shape, self)
    }
    
    func modifier(_ item: Pdf.Modifier) -> DocumentItem {
        return item.builder(self)
    }
}

