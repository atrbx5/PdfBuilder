import SwiftUI

let lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

let lorem2 = "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

struct Pdf_Previews: PreviewProvider {

    static var previews: some View {

    let builder = Pdf.Builder()

    builder.items = [
        Pdf.PageHeader(top: [
            Pdf.Spacer( 8),
            Pdf.Text("Page header"),
            Pdf.Spacer( 8),
        ], bottom: [
            Pdf.Spacer( 8),
            Pdf.Text("Page footer"),
            Pdf.Spacer( 8),
        ], backgroundColorFill: .lightGray),
        
        Pdf.Background(color: .green, Pdf.Text("Some text")),
        Pdf.Divider(),
        
        Pdf.Text("Some text", attributes: .boldRed()),
        Pdf.Divider(),
        
        Pdf.Text([
            NSAttributedString(
                string: "Some",
                attributes: .bold()),
            NSAttributedString(
                string: "text",
                attributes: .boldRed())
        ].joined(with: " ")),
        
        Pdf.Spacer(20),
        
        Pdf.Grid(columns: [.fixed(v: 25), .flexible], items: [
            Pdf.Text("*"),
            Pdf.Text(lorem)
        ]),
        
        Pdf.Spacer(20),
        
        Pdf.Grid(columns: [.fixed(v: 25), .flexible], items: [
            Pdf.Text("* 1"),
            Pdf.Text(lorem),
            Pdf.Text("* 2"),
            Pdf.Text(lorem)
        ]),
        
        Pdf.PageHeader(top: [
            Pdf.Text("Second page header"),
            Pdf.Spacer( 8),
        ]),
        
        Pdf.Spacer(20),
        
        Pdf.Grid(
            columns: [
                .fixed(v: 25), .flexible,
                .fixed(v: 25), .flexible],
            items: [
                
                Pdf.Text("* 1"),
                Pdf.Text(lorem)
                    .padding(16)
                    .background(.orange)
                    .clipShape(.circle),
                
                Pdf.Text("* 2"),
                Pdf.Text(lorem2)
                    .padding(8)
                    .background(.systemGreen)
                    .clipShape(.roundedRect(radius: 8))
                    .padding(16),
                
                Pdf.Text("* 3"),
                Pdf.Image(UIImage(systemName: "person"))
                    .padding(8)
                    .background(.systemGreen)
                    .clipShape(.roundedRect(radius: 8))
                    .padding(16),
                
                Pdf.Text("* 4"),
                Pdf.VStack([
                    Pdf.Text("Row 1"),
                    Pdf.Text("Row 2"),
                    Pdf.Text("Row 3"),
                    Pdf.Text("Row 4")
                ]).padding(16)
        ])
    ]

    let data = builder.generateNewPdf() as Data
        return FilePdfView(pdfData: data)

    }
}
