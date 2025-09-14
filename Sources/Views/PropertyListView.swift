import SwiftUI

public struct PropertyListView: View {
    @ObservedObject public var viewModel: PropertyListViewModel
    public init(viewModel: PropertyListViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        List(viewModel.properties) { property in
            PropertyRowView(property: property)
        }
        .navigationTitle("Properties")
    }
}
