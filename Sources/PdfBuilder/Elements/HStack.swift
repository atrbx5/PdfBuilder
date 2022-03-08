extension Pdf {
    
    open class HStack: Grid {
        public init(_ items: [DocumentItem], separatorColor: UIColor = .clear) {
            super.init(columns: [GridColumnWidth].init(repeating: .flexible, count: items.count), items: items, separatorColor: separatorColor)
        }
        
        public init(_ items: [DocumentItem], fixedFirstColumnWidth: CGFloat, separatorColor: UIColor = .clear) {
            super.init(columns: [GridColumnWidth.fixed(v: fixedFirstColumnWidth)] + [GridColumnWidth].init(repeating: .flexible, count: items.count-1), items: items, separatorColor: separatorColor)
        }
    }
}
