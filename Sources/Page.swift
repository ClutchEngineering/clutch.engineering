import Foundation

import Slipstream

struct Page<Content: View>: View {
  init(
    path: String,
    title: String? = nil,
    description: String? = nil,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.path = path
    self.title = title
    self.description = description
    self.content = content
  }

  private let siteName: String = "Clutch Engineering"

  private var resolvedTitle: String {
    if let title {
      return "\(title) — \(siteName)"
    } else {
      return siteName
    }
  }

  var body: some View {
    HTML {
      Head {
        Charset(.utf8)
        Title(resolvedTitle)
        Viewport(width: .deviceWidth, initialScale: 1, viewportFit: .cover)
        if let description {
          Meta(.description, content: description)
        }
        Meta(.generator, content: "Slipstream")
        Meta(.author, content: "Clutch Engineering")
        Meta("og:title", content: resolvedTitle)
        if let description {
          Meta("og:description", content: description)
        }
        if let url = URL(string: "https://clutch.engineering") {
          Meta("og:url", content: url.appending(path: path, directoryHint: .notDirectory).absoluteString)
        }
        Meta("og:type", content: "website")
        Meta("og:site_name", content: siteName)
        Stylesheet(URL(string: "/css/main.css"))

        Preconnect(URL(string: "https://rsms.me"))
        Stylesheet(URL(string: "https://rsms.me/inter/inter.css"))
      }
      Body {
        Div {
          NavigationBar()

          content()
        }
        .frame(minHeight: .dvh)

        SiteFooter()
      }
      .antialiased()
      .textColor(.text, darkness: 950)
      .textColor(.white, condition: .dark)
      .background(.gray, darkness: 100)
      .background(.zinc, darkness: 900, condition: .dark)
      .fontDesign(.sans)
    }
    .language("en")
    .environment(\.path, path)
  }

  private let path: String
  private let title: String?
  private let description: String?
  @ViewBuilder private let content: () -> Content
}

private struct PathEnvironmentKey: EnvironmentKey {
  static let defaultValue: String = "/"
}

extension EnvironmentValues {
  var path: String {
    get { self[PathEnvironmentKey.self] }
    set { self[PathEnvironmentKey.self] = newValue }
  }
}
