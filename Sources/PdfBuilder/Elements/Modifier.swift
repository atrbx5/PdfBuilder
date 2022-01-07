extension Pdf {
    
    open class Modifier {

        let builder: (DocumentItem) -> DocumentItem

        public init(_ builder: @escaping (DocumentItem) -> DocumentItem) {
            self.builder = builder
        }
    }
}
