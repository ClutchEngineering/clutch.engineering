import Foundation

import Slipstream

struct SiteFooter: View {
  var body: some View {
    Footer {
      Container {
        VStack(alignment: .center, spacing: 16) {
          VStack(alignment: .end) {
            Text("Copyright © \(Calendar.current.component(.year, from: Date())) Clutch Engineering")
              .textColor(.text, darkness: 300)
              .fontWeight(.medium)
          }
        }
        .justifyContent(.between)
      }
      .padding(.vertical, 32)
    }
    .border(.palette(.border, darkness: 700), width: 1, edges: .top)
    .background(.zinc, darkness: 800)
  }
}
