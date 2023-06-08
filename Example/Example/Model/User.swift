
import Foundation
import SwiftUI

struct User {

  let name: String
  let position: String
  let imageName: String
  let isOnline: Bool
}

extension User {

  static let stub = User(name: "ConciergeAI", position: "Your AI Companion", imageName: "placeholder/user", isOnline: true)
}
