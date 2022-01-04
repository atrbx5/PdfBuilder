import UIKit
import SwiftUI


struct FilePdfView: View {
    let pdfData: Data
    
    var body: some View {
        WebView(data: pdfData, mimeType: "application/pdf")
    }
}

struct FileImageView: View {
    let image: Image
    
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit)
    }
}
