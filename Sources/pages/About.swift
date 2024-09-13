import Foundation

import Slipstream

struct About: View {
  var body: some View {

    Page(path: "/about/", title: "About") {
      Section {
        Container {
          VStack(spacing: 32) {
            Section {
              Article("""
# Clutch Engineering: Insights in Action

Clutch Engineering is dedicated to making automotive information and technology more accessible to everyone.

With a singular focus on designing products that apply user-centered design to complex datasets, Clutch is all about creating simple but powerful products that deepen each person's understanding of their automotive journey.

Clutch — It's exactly what's needed when you need it.
""")
              Image(URL(string: "/gfx/infograph.jpg"))
                .border(.white, width: 4)
                .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                .cornerRadius(.extraExtraLarge)
                .modifier(ClassModifier(add: "shadow-puck"))
            }

            Section {
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

Jeff built a specialization in developing large-scale data and analysis tools, where he managed complex data pipelines and contributed to the infrastructure that processes enormous datasets. Pairing this skillset with his extensive UI/UX background, Jeff founded Clutch Engineering to build products that enable insights into vehicle diagnostics, driver dynamics, and market economics.
""")
            }
          }
        }
      }
      .padding(.vertical, 64)
    }
  }
}

