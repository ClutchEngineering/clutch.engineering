import Foundation

import Slipstream

struct ProductCard: View {
  let title: String
  let subtitle: String

  var body: some View {
    Div {
      H2(title)
        .bold()
      Text(subtitle)
    }
    .textAlignment(.center)
    .background(.zinc, darkness: 200)
    .background(.zinc, darkness: 800, condition: .dark)
    .padding(24)
    .cornerRadius(.large)
  }
}

struct Home: View {
  var body: some View {

    Page(path: "/") {
      VStack(alignment: .center, spacing: 64) {
        Section {
          Container {
            VStack(alignment: .center, spacing: 8) {
              Picture {
                Source(URL(string: "/gfx/car-silhouette.dark.svg"), colorScheme: .dark)
                Source(URL(string: "/gfx/car-silhouette.light.svg"), colorScheme: .light)
                Image(URL(string: "/gfx/car-silhouette.light.svg"))
                  .frame(maxWidth: 400)
              }
              H1("Innovating automotive technology")
                .fontSize(.sixXLarge)
                .bold()
                .className("uppercase")
              Text {
                DOMString("Clutch — ")
                Span("It's exactly what's needed.")
                  .italic()
              }
              .fontSize(.extraLarge)
              .fontWeight(.medium)
            }
            .textAlignment(.center)
          }
        }
        .padding(.top, 64)

//        Section {
//          Container {
//            ProductCard(
//              title: "Sidecar",
//              subtitle: "Your personal automotive assistant."
//            )
//            ProductCard(
//              title: "ELMCheck",
//              subtitle: "Check the authenticity of your OBD scanner."
//            )
//            ProductCard(
//              title: "AutoSight",
//              subtitle: "Discover trends and outliers in the auto market."
//            )
//          }
//          .classNames(["grid", "grid-col-1", "md:grid-cols-3", "gap-8"])
//        }
      }
    }
  }
}
