import Foundation
import Slipstream

struct NavigationLink: View {
  @Environment(\.path) private var path

  private let text: String
  private let destination: URL?

  init(_ text: String, destination: URL?) {
    self.text = text
    self.destination = destination
  }

  var body: some View {
    if isCurrent {
      Link(text, destination: destination)
        .textColor(.text, darkness: 950)
        .textColor(.text, darkness: 50, condition: .dark)
    } else if isHomePage {
      Link(text, destination: destination)
        .textColor(.text, darkness: 950)
        .textColor(.text, darkness: 50, condition: .dark)
    } else {
      Link(text, destination: destination)
        .textColor(.text, darkness: 400)
        .textColor(.text, darkness: 600, condition: .dark)
        .textColor(.text, darkness: 950, condition: .hover)
        .textColor(.text, darkness: 50, condition: .dark + .hover)
    }
  }

  private var isHomePage: Bool {
    path == "/"
  }

  private var isCurrent: Bool {
    guard let destination else {
      return false
    }
    return path.hasPrefix(destination.path()) && destination.host(percentEncoded: false) == nil
  }
}

struct NavigationBar: View {
  @Environment(\.path) private var path

  var body: some View {
    Navigation {
      Container {
        HStack(alignment: .bottom) {
          Link(URL(string: "/")) {
            HStack(spacing: 4) {
              Picture {
                Source(URL(string: "/gfx/clutchengineering.dark.svg"), colorScheme: .dark)
                Source(URL(string: "/gfx/clutchengineering.light.svg"), colorScheme: .light)
                Image(URL(string: "/gfx/clutchengineering.light.svg"))
                  .frame(width: 32)
              }
              HStack(alignment: .baseline, spacing: 8) {
                Text("Clutch Engineering")
                Text("It's exactly what's needed")
                  .fontSize(.small)
                  .italic()
                  .textColor(.text, darkness: 400)
                  .textColor(.text, darkness: 600, condition: .dark)
              }
            }
          }
          .textColor(.text, darkness: isHomePage ? 950 : 400)
          .textColor(.text, darkness: isHomePage ? 0 : 600, condition: .dark)
          .textColor(.text, darkness: 950, condition: .hover)
          .textColor(.text, darkness: 50, condition: .dark + .hover)
          .fontSize(.extraLarge)
          .fontSize(.extraExtraExtraLarge, condition: .desktop)
          .fontLeading(.none)
          .bold()
          .className("uppercase")

          List {
//            ListItem {
//              NavigationLink("Products", destination: URL(string: "/products/"))
//            }
            ListItem {
              NavigationLink("About", destination: URL(string: "/about/"))
            }
            ListItem {
              NavigationLink("Contact", destination: URL(string: "/contact/"))
            }
          }
          .className("uppercase")
          .fontWeight(.bold)
          .display(.flex)
          .flexDirection(.x)
          .flexGap(.x, width: 16)
          .flexGap(.x, width: 32, condition: .desktop)
          .margin(.bottom, 2)
        }
        .justifyContent(.between)
      }
    }
    .padding(.vertical, 16)
  }

  private var isHomePage: Bool {
    path == "/"
  }
}
