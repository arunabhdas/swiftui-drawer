
import SwiftUI

extension Label where Title == Text, Icon == Image {

  init(item: MenuItem) {
    switch item {
    case .home:
      self.init("Home", image: "icon/home")

    case .dashboard:
      self.init("AI Concierge", image: "icon/dashboard")

    case .artAI:
      self.init("AI Art", image: "icon/projects")

    case .musicAI:
      self.init("AI Music", image: "icon/departments")
        
    case .healthAI:
      self.init("AI Health", image: "icon/performanceReview")
        
    case .archive:
      self.init("AI Fitness", image: "icon/archive")

    case .companionAI:
      self.init("AI Companion", image: "icon/employees")

    case .notifications:
      self.init("Notifications", image: "icon/notifications")


    }
  }
}

