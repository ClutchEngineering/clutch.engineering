import Foundation

import Slipstream

struct ImagePuck: View {
  let url: URL?
  let accessibilityLabel: String
  let caption: String

  var body: some View {
    VStack(alignment: .end) {
      Div {
        Image(url)
          .accessibilityLabel(accessibilityLabel)
          .border(.white, width: 4)
          .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
          .cornerRadius(.extraExtraLarge)
          .modifier(ClassModifier(add: "shadow-puck"))
          .frame(width: 300, height: 300, condition: .desktop)
      }
      .margin(.bottom, 4)
      Text(caption)
        .fontSize(.extraSmall)
        .fontSize(.small, condition: .desktop)
        .textColor(.text, darkness: 500)
        .textAlignment(.right)
    }
    .float(.right)
    .margin(.left, 12)
    .margin(.bottom, 4)
  }
}
