import UIKit

extension NSMutableAttributedString {

    @discardableResult
    public func setAsLink(textToFind: String, linkURL: String) -> Bool {
        let foundRange = mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            addAttributes([
                .link: linkURL,
                .underlineStyle: 1
            ], range: foundRange)
            return true
        }
        return false
    }
}

extension NSAttributedString {
    func bounds(withSize: CGSize) -> CGRect {
        return boundingRect(
            with: withSize,
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            context: nil)
    }
}

extension Sequence where Iterator.Element == NSAttributedString {
    func joined(with separator: NSAttributedString) -> NSAttributedString {
        return self.reduce(NSMutableAttributedString()) {
            (r, e) in
            if r.length > 0 {
                r.append(separator)
            }
            r.append(e)
            return r
        }
    }

    func joined(with separator: String = "") -> NSAttributedString {
        return self.joined(with: NSAttributedString(string: separator))
    }
}
