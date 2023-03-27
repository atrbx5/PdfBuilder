import UIKit

extension Pdf {

    public class Builder: NSObject {
        public var pageMargin = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)

        private var pageHeader: Pdf.PageHeader?
        public var pageCounter: Pdf.PageCounter?

        public var items = [DocumentItem]()

        public func generateNewPdf(pageRect: CGRect = .zero, progress: @escaping (Float) -> Void = {_ in }) -> NSMutableData {

            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, pageRect, nil)

            appendPdf(progress: progress)

            UIGraphicsEndPDFContext()
            return pdfData
        }

        public func appendPdf(progress: @escaping (Float) -> Void = {_ in }) {

            var currentRect = CGRect.zero

            //If page header not set then create first page
            if let item = items.first as? Pdf.PageHeader {
                pageHeader = item
            } else {
                currentRect = beginPage()
            }

            for (index, item) in items.enumerated() {
                progress(Float(index) / Float(items.count))

                if let item = item as? Pdf.PageHeader {
                    pageHeader = item
                    currentRect = beginPage()
                } else {
                    item.layout(rect: currentRect)
                    if item.shoudPageBreak(rect: currentRect) {
                        currentRect = beginPage()
                        item.layout(rect: currentRect)
                    }
                    item.draw(rect: &currentRect)
                }
            }
        }

        private func beginPage() -> CGRect{
            UIGraphicsBeginPDFPage();

            if let pageCounter = pageCounter {
                pageCounter.pageNumber += 1
            }

            var page = UIGraphicsGetPDFContextBounds().inset(by: pageMargin)

            pageHeader?.draw(rect: &page)

            return page
        }
    }
}
