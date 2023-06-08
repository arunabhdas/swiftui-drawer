
enum MenuItem: Identifiable, CaseIterable {

  case home
  case dashboard
  case artAI
  case musicAI
  case companionAI
  case healthAI
  case archive
  case notifications

  var id: Int { hashValue }
}
