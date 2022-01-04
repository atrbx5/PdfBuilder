import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let data: Data
    let mimeType: String
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        uiView.load(data,
                    mimeType: mimeType,
                    characterEncodingName: "utf8",
                    baseURL: Bundle.main.bundleURL)
    }
    
}

struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(data: Data(), mimeType: "image/png")
    }
}
