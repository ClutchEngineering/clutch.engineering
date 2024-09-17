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
      VStack(alignment: .stretch, spacing: 64) {
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
              H1("Automotive technology")
                .fontSize(.extraExtraLarge)
                .fontSize(.sixXLarge, condition: .desktop)
                .bold()
                .className("uppercase")
                .fontLeading(.tight, condition: .mobileOnly)
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
                      .background("sidecar-gray")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .className("shadow-puck")
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
                  .frame(width: 0.5)

                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/elmcheck/logo.svg"))
                      .accessibilityLabel("ELMCheck app icon")
                      .background("sidecar-gray")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .className("shadow-puck")
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("ELMCheck")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("Verify OBD-II scanner authenticity")
                      HStack(spacing: 8) {
                        Link("Learn more", destination: URL(string: "https://apps.apple.com/us/app/elmcheck/id6479630442"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }
                  .frame(width: 0.5)
                }

                ResponsiveStack(spacing: 16) {
                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/candecoder/logo.svg"))
                      .accessibilityLabel("Electric Sidecar app icon")
                      .background("sidecar-gray")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .className("shadow-puck")
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("CANDecoder")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("ISO 15765-2 CAN frame decoder")
                      HStack(spacing: 8) {
                        Link("Learn more", destination: URL(string: "https://apps.apple.com/us/app/can-decoder/id6477373179?platform=vision"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }
                  .frame(width: 0.5)

                  HStack(spacing: 16) {
                    Image(URL(string: "/gfx/autosight/logo.svg"))
                      .accessibilityLabel("AutoSight app icon")
                      .background("sidecar-gray")
                      .border(.white, width: 4)
                      .border(.init(.zinc, darkness: 700), width: 4, condition: .dark)
                      .cornerRadius(.extraExtraLarge)
                      .className("shadow-puck")
                      .frame(width: 64, height: 64)
                      .frame(width: 112, height: 112, condition: .desktop)

                    VStack {
                      H3("AutoSight")
                        .bold()
                        .fontSize(.extraLarge)
                        .fontSize(.extraExtraLarge, condition: .desktop)
                      Text("A prototype auto market search engine")
                      HStack(spacing: 8) {
                        Link("Try it out", destination: URL(string: "https://autosight.clutch.engineering"))
                          .textColor(.link, darkness: 700)
                          .textColor(.link, darkness: 400, condition: .dark)
                          .fontWeight(600)
                          .underline(condition: .hover)
                      }
                    }
                  }
                  .frame(width: 0.5)
                }
              }
            }
          }
        }
        .flexGap(.y, width: 64, condition: .desktop)
      }
    }
  }
}
