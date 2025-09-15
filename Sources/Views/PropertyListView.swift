import SwiftUI

public struct PropertyListView: View {
    @ObservedObject public var viewModel: PropertyListViewModel
    public init(viewModel: PropertyListViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        VStack {
            HStack {
                TextField("Search by zip code", text: $viewModel.searchZip)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
            }
            List(viewModel.filteredProperties) { property in
                PropertyRowView(property: property)
            }
        }
        .navigationTitle("Properties")
    }
}
