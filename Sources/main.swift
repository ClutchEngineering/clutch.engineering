import Foundation
import Slipstream

extension Condition {
  static var mobileOnly: Condition { Condition.within(Breakpoint.small..<Breakpoint.medium) }
  static var desktop: Condition { Condition.startingAt(.medium) }
}

let sitemap: Sitemap = [
  "index.html": Home(),
  "about/index.html": About(),
  "contact/index.html": Contact(),
]

// Assumes this file is located in a Sources/ sub-directory of a Swift package.
let projectURL = URL(filePath: #filePath)
  .deletingLastPathComponent()
  .deletingLastPathComponent()

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
