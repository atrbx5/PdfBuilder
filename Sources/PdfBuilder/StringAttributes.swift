import UIKit

public typealias StringAttributes = [NSAttributedString.Key : Any]

public func + (left: StringAttributes, right: StringAttributes) -> StringAttributes {
    var left = left
    for element in right {
        left[element.key] = element.value
    }
    return left
}

public extension StringAttributes {
    
    static func light(_ size: CGFloat = 10) -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: size, weight: .light),
    ]}
    
    static func title() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 14, weight: .bold),
    ]}
    
    static func title2() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 12, weight: .bold),
    ]}
    
    static func regular() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 10, weight: .regular)
    ]}
    
    static func bold() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 10, weight: .bold)
    ]}
    
    static func italic() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.italicSystemFont(ofSize: 10)
    ]}
    
    static func caption() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 7, weight: .light)
    ]}
    
    static func boldRed() -> StringAttributes {[
        .foregroundColor: UIColor.red,
        .font: UIFont.systemFont(ofSize: 10, weight: .bold)
    ]}
    
    static func alignment(_ alignment: NSTextAlignment) -> StringAttributes {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        return [.paragraphStyle: style]
    }
    
    static func lineHeight(_ height: CGFloat) -> StringAttributes {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = height
        return [.paragraphStyle: style]
    }
    
    static func foregroundColor(_ color: UIColor) -> StringAttributes {[
        .foregroundColor: color
    ]}
    
    func title() -> StringAttributes { self + Self.title() }
    func title2() -> StringAttributes { self + Self.title2() }
    func bold() -> StringAttributes { self + Self.bold() }
    func italic() -> StringAttributes { self + Self.italic() }
    func caption() -> StringAttributes { self + Self.caption() }
    func boldRed() -> StringAttributes { self + Self.boldRed() }
    
    func light(_ size: CGFloat = 10) -> StringAttributes { self + Self.light(size) }
    func lineHeight(_ height: CGFloat) -> StringAttributes { self + Self.lineHeight(height) }
    func alignment(_ alignment: NSTextAlignment) -> StringAttributes { self + Self.alignment(alignment) }
    func foregroundColor(_ color: UIColor) -> StringAttributes { self + Self.foregroundColor(color) }
}

