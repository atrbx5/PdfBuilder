import UIKit

extension Pdf {

    open class VStack: Grid {

        public init(_ items: [DocumentItem], separatorColor: UIColor = .clear) {
            super.init(columns: [.flexible], items: items, separatorColor: separatorColor)
        }
    }
}
