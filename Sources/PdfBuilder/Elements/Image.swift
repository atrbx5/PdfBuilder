import UIKit
import AVFoundation

extension Pdf {

    class Image: DocumentItemAutoBreak {
        let image: UIImage?
        let fixedSize: CGSize?
        let circle: Bool
        
        // TODO: create shapes if need more then circle
        init(_ image: UIImage?, size: CGSize? = nil, circle: Bool = false) {
            self.image = image
            self.fixedSize = size
            self.circle = circle
        }
        
        override func draw(rect: inout CGRect) {
            var size = fixedSize ?? .zero
            
            if let image = image, fixedSize == nil {
                size = CGSize(
                    width: rect.width,
                    height: rect.width / image.size.width * image.size.height )
            }
            
            let tempRect = CGRect(
                x: rect.minX + ((rect.maxX - rect.minX) - size.width) / 2,
                y: rect.minY,
                width: size.width,
                height: size.height)
                .insetBy(dx: 1, dy: 1)
            
            let context = UIGraphicsGetCurrentContext()
            if circle {
                let clippingPath = UIBezierPath(roundedRect: tempRect, cornerRadius: tempRect.width / 2)
                context?.addPath(clippingPath.cgPath)
                context?.clip()
            }
            
            let imgRect = AVMakeRect(
                aspectRatio: image?.size ?? .zero,
                insideRect: tempRect)
            
            image?.draw(in: imgRect)
            context?.resetClip()
            
            rect.origin.y += tempRect.height
            if tempRect.height > rect.size.height {
                rect.size.height = 0
            } else {
                rect.size.height -= tempRect.height
            }
        }
    }
}


