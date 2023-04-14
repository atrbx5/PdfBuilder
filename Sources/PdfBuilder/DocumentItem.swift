import UIKit

open class DocumentItem: NSObject {

    open var debugIdentifier: String?

    open var backgroundColorFill: UIColor = .clear

    open func layout(rect: CGRect) {

    }

    open func shoudPageBreak(rect: CGRect) -> Bool {
        return false
    }

    open func draw(rect: inout CGRect) {

    }

    open func backgroundColor(_ color: UIColor?) -> Self {
        backgroundColorFill = color ?? .clear
        return self
    }
    
    open func estimateDraw(rect: CGRect, elements: [DocumentItem]) -> CGRect {
        var tempRect = rect
        UIGraphicsBeginImageContext(rect.size)
        for item in elements {
            item.draw(rect: &tempRect)
        }
        //let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tempRect
    }
}

open class DocumentItemAutoBreak: DocumentItem {

    //TODO: Review page break logic, to find
    open override func shoudPageBreak(rect: CGRect) -> Bool {
        var tempRect = rect
        UIGraphicsBeginImageContext(CGSize(width: rect.maxX, height: rect.maxY))
        draw(rect: &tempRect)
        //let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let should = tempRect.origin.y > rect.maxY || rect.height < 10 //|| tempRect.height == 0

        return should
    }
}
