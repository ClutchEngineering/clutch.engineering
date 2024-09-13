import Foundation

import Slipstream

struct About: View {
  var body: some View {

    Page(path: "/about/", title: "About") {
      Section {
        Container {

      ImagePuck(
        url: URL(string: "/gfx/jeff.jpg"),
        accessibilityLabel: "Photograph of Jeff Verkoeyen in Sedona",
        caption: "Jeff Verkoeyen, 2024"
      )
      .frame(width: 0.25)
      .frame(width: 0.41, condition: .desktop)

          Article("""

# Jeff Verkoeyen: Founder

Clutch Engineering was founded by [Jeff Verkoeyen](https://jeffverkoeyen.com/about/), ex-Googler at the center of Google's Apple platforms community. Leading across engineering, design, and analytics, Jeff was instrumental in driving a [platform-centric approach to designing Google’s iOS apps](https://sixcolors.com/link/2021/10/googles-apps-to-embrace-ios-on-ios/).

## Transforming Data into Actionable Insights

Jeff built a specialization in developing large-scale data and analysis tools, where he managed complex data pipelines and contributed to the infrastructure that processes enormous datasets. This experience enabled him to transform massive datasets into actionable insights. This same expertise is now being applied to Clutch Engineering's products, creating products that enable insights into vehicle diagnostics, behavioral dynamics, and market economics.

# Clutch Engineering: Insights in Action

Clutch Engineering is dedicated to innovating technology for the automotive industry. Its singular focus is on designing products that apply user-centered design to complex datasets, blending function with insight and creating products that deepen each person's understanding of their automotive experience.
""")
        }
      }
      .padding(.top, 64)
    }
  }
}
