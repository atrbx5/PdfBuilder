import UIKit

public typealias StringAttributes = [NSAttributedString.Key : Any]

func + (left: StringAttributes, right: StringAttributes) -> StringAttributes {
    var left = left
    for element in right {
        left[element.key] = element.value
    }
    return left
}

extension StringAttributes {
    
    public static func light(_ size: CGFloat = 10) -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: size, weight: .light),
    ]}
    
    public static func title() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 14, weight: .bold),
    ]}
    
    public static func title2() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 12, weight: .bold),
    ]}
    
    public static func regular() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 10, weight: .regular)
    ]}
    
    public static func bold() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 10, weight: .bold)
    ]}
    
    public static func italic() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.italicSystemFont(ofSize: 10)
    ]}
    
    public static func caption() -> StringAttributes {[
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 7, weight: .light)
    ]}
    
    public static func boldRed() -> StringAttributes {[
        .foregroundColor: UIColor.red,
        .font: UIFont.systemFont(ofSize: 10, weight: .bold)
    ]}
    
    public static func alignment(_ alignment: NSTextAlignment) -> StringAttributes {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        return [.paragraphStyle: style]
    }
    
    public static func lineHeight(_ height: CGFloat) -> StringAttributes {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = height
        return [.paragraphStyle: style]
    }
    
    public static func foregroundColor(_ color: UIColor) -> StringAttributes {[
        .foregroundColor: color
    ]}
    
    public func title() -> StringAttributes { self + Self.title() }
    public func title2() -> StringAttributes { self + Self.title2() }
    public func bold() -> StringAttributes { self + Self.bold() }
    public func italic() -> StringAttributes { self + Self.italic() }
    public func caption() -> StringAttributes { self + Self.caption() }
    public func boldRed() -> StringAttributes { self + Self.boldRed() }
    
    public func light(_ size: CGFloat = 10) -> StringAttributes { self + Self.light(size) }
    public func lineHeight(_ height: CGFloat) -> StringAttributes { self + Self.lineHeight(height) }
    public func alignment(_ alignment: NSTextAlignment) -> StringAttributes { self + Self.alignment(alignment) }
    public func foregroundColor(_ color: UIColor) -> StringAttributes { self + Self.foregroundColor(color) }
}

