import UIKit

open class PageBreak: DocumentItem {

    open override func shoudPageBreak(rect: CGRect) -> Bool {
        return true
    }
    
}


