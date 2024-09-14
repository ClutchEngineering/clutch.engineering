import Slipstream

struct NarrowContainer<Content: View>: View {
  @ViewBuilder let content: () -> Content

  var body: some View {
    Container {
      content()
    }
    .padding(.horizontal, 208, condition: .desktop)
  }
}
