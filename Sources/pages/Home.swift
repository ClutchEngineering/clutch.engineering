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
      VStack(alignment: .stretch, spacing: 32) {
        Section {
          Container {
            VStack(alignment: .center, spacing: 8) {
              Picture {
                Source(URL(string: "/gfx/car-silhouette.dark.svg"), colorScheme: .dark)
                Source(URL(string: "/gfx/car-silhouette.light.svg"), colorScheme: .light)
                Image(URL(string: "/gfx/car-silhouette.light.svg"))
                  .frame(maxWidth: 300)
                  .frame(maxWidth: 400, condition: .desktop)
              }
              H1("Innovating automotive technology")
                .fontSize(.extraExtraLarge)
                .fontSize(.sixXLarge, condition: .desktop)
                .bold()
                .className("uppercase")
                .fontLeading(.tight, condition: .mobileOnly)
              Text {
                DOMString("Clutch — ")
                Span("It's exactly what's needed.")
                  .italic()
              }
              .fontSize(.large)
              .fontSize(.extraLarge, condition: .desktop)
              .fontWeight(.medium)
            }
            .textAlignment(.center)
          }
        }
        .padding(.top, 32)
        .padding(.top, 64, condition: .desktop)

        Section {
          Container {
            VStack(alignment: .stretch) {
              H2("Products")
                .fontSize(.extraLarge)
                .fontSize(.extraExtraExtraLarge, condition: .desktop)
                .bold()
                .className("uppercase")
                .margin(.bottom, 16)

              VStack(alignment: .stretch, spacing: 16) {
                ResponsiveStack(spacing: 16) {
                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/sidecar/logo.svg"))
                      .accessibilityLabel("Electric Sidecar app icon")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .modifier(ClassModifier(add: "shadow-puck"))
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("Sidecar")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("Your personal automotive assistant")
                      HStack(spacing: 8) {
                        Link("Learn more", destination: URL(string: "https://sidecar.clutch.engineering"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }

                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/elmcheck/logo.svg"))
                      .accessibilityLabel("ELMCheck app icon")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .modifier(ClassModifier(add: "shadow-puck"))
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("ELMCheck")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("Verify OBD-II scanner authenticity")
                      HStack(spacing: 8) {
                        Link("Learn more", destination: URL(string: "https://elmcheck.clutch.engineering"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }
                }
                .justifyContent(.between)

                HStack {
                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/candecoder/logo.svg"))
                      .accessibilityLabel("Electric Sidecar app icon")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .modifier(ClassModifier(add: "shadow-puck"))
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("CANDecoder")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("ISO 15765-2 CAN frame decoder")
                      HStack(spacing: 8) {
                        Link("Learn more", destination: URL(string: "https://candecoder.clutch.engineering"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }
                }
                .justifyContent(.between)
              }
            }
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
          }
//          .classNames(["grid", "grid-col-1", "md:grid-cols-3", "gap-8"])
        }
        .flexGap(.y, width: 64, condition: .desktop)
      }
    }
  }
}
