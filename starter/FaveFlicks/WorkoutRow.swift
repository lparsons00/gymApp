import SwiftUI

struct WorkoutRow: View {
  let workout: Workout
  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      Text(workout.name)
        .font(.title)
      HStack {
        Text(Self.releaseFormatter.string(from: workout.completedDate))
          .font(.caption)
      }
    }
  }
}
