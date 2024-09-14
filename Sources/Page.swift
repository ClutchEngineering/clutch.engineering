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

        Script("""
!function(t,e){var o,n,p,r;e.__SV||(window.posthog=e,e._i=[],e.init=function(i,s,a){function g(t,e){var o=e.split(".");2==o.length&&(t=t[o[0]],e=o[1]),t[e]=function(){t.push([e].concat(Array.prototype.slice.call(arguments,0)))}}(p=t.createElement("script")).type="text/javascript",p.async=!0,p.src=s.api_host.replace(".i.posthog.com","-assets.i.posthog.com")+"/static/array.js",(r=t.getElementsByTagName("script")[0]).parentNode.insertBefore(p,r);var u=e;for(void 0!==a?u=e[a]=[]:a="posthog",u.people=u.people||[],u.toString=function(t){var e="posthog";return"posthog"!==a&&(e+="."+a),t||(e+=" (stub)"),e},u.people.toString=function(){return u.toString(1)+".people (stub)"},o="init capture register register_once register_for_session unregister unregister_for_session getFeatureFlag getFeatureFlagPayload isFeatureEnabled reloadFeatureFlags updateEarlyAccessFeatureEnrollment getEarlyAccessFeatures on onFeatureFlags onSessionId getSurveys getActiveMatchingSurveys renderSurvey canRenderSurvey getNextSurveyStep identify setPersonProperties group resetGroups setPersonPropertiesForFlags resetPersonPropertiesForFlags setGroupPropertiesForFlags resetGroupPropertiesForFlags reset get_distinct_id getGroups get_session_id get_session_replay_url alias set_config startSessionRecording stopSessionRecording sessionRecordingStarted captureException loadToolbar get_property getSessionProperty createPersonProfile opt_in_capturing opt_out_capturing has_opted_in_capturing has_opted_out_capturing clear_opt_in_out_capturing debug".split(" "),n=0;n<o.length;n++)g(u,o[n]);e._i.push([i,s,a])},e.__SV=1)}(document,window.posthog||[]);
posthog.init('phc_oeOagObhRgmess0D54a9mJWu4mXfwd7eWGkAJJHGUk2',{api_host:'https://eu.i.posthog.com', person_profiles: 'identified_only'
    })
""")
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
