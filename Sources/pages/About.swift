import Foundation

import Slipstream

struct About: View {
  var body: some View {

    Page(path: "/about/", title: "About") {
      Section {
        NarrowContainer {
          VStack(alignment: .stretch, spacing: 32) {
            Section {
              Div {
                Article("""
# Designing for the long tail

Founded in 2024 in Montecito, California, Clutch Engineering is an independent, self-funded business.

## The guiding philosophy

To implement a business model that sustainably prioritizes building best-in-class solutions for niche product categories.

## 

The automotive industry i
""")
              }
              .margin(.bottom, 32)
            }
          }
        }
      }
      .padding(.vertical, 32)
    }
  }
}
