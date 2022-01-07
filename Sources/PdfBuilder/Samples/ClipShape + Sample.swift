import SwiftUI

struct ClipShape_Previews: PreviewProvider {
    
    static var previews: some View {
        
    let builder = Pdf.Builder()
    
    let paddingModifier = Pdf.Modifier { item in
        item
            .padding(8)
            .background(.systemGreen)
            .clipShape(.roundedRect(radius: 8))
            .padding(4)
    }
    
    builder.items = [
        
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
                    Pdf.Text("Row 1")
                        .modifier(paddingModifier),
                    Pdf.Text("Row 2")
                        .modifier(paddingModifier),
                    Pdf.Text("Row 3")
                        .modifier(paddingModifier),
                    Pdf.Text("Row 4")
                        .modifier(paddingModifier)
                ]).padding(16)
            ])
    ]
    
    let data = builder.generateNewPdf() as Data
    return FilePdfView(pdfData: data)
        
    }
}
