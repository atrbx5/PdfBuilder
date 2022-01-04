import SwiftUI

struct PdfImage_Previews: PreviewProvider {

    static var previews: some View {

        let builder = Pdf.Builder()

        let counter = Pdf.PageCounter(pageNumber: 0)

        builder.pageCounter = counter

        builder.items = [
            Pdf.PageHeader(top: [
                Pdf.Text("Example of Image layout"),
                counter,
                Pdf.Spacer( 8),
            ]),

            Pdf.Text("Image placed into 4 column grid"),

            Pdf.Grid(columns: [.fixed(v: 25), .flexible, .fixed(v: 25), .flexible], items: [
                Pdf.Text("* 1"),
                Pdf.Image(UIImage(systemName: "person")),
                Pdf.Text("* 3"),
                Pdf.Image(UIImage(systemName: "person"), size: CGSize(width: 25, height: 25)),
            ]),

            Pdf.Image(UIImage(systemName: "person")),
        ]

        let data = builder.generateNewPdf() as Data
        return FilePdfView(pdfData: data)
            .previewLayout(.fixed(width: 400, height: 500))

    }
}
