import UIKit

public extension DocumentItem {

    func background(_ color: UIColor) -> DocumentItem {
        Pdf.Background(color: color, self)
    }

    func padding(_ size: CGFloat) -> DocumentItem {
        Pdf.Padding(size: size, self)
    }
}
