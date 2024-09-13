import Foundation

import Slipstream

struct Contact: View {
  var body: some View {

    Page(path: "/contact/", title: "Contact") {
      Section {
        Container {

          ResponsiveStack {
            Link(URL(string: "http://threads.net/@featherless")) {
              HStack(spacing: 8) {
                Image(URL(string: "/gfx/threads.svg"))
                  .accessibilityLabel("The Threads app logo")
                  .frame(width: 32, height: 32)
                DOMString("featherless")
              }
            }
            .fontSize(.extraExtraLarge)
            .fontWeight(500)
            .underline(condition: .hover)
            Link("support@clutch.engineering", destination: URL(string: "support@clutch.engineering"))
              .fontSize(.extraExtraLarge)
              .fontWeight(500)
              .underline(condition: .hover)
          }
          .alignItems(.center)
          .justifyContent(.evenly)
          .flexGap(.y, width: 16)
          .margin(.bottom, 32)
        }
      }
      .padding(.top, 64)
    }
  }
}
