import SwiftUI

struct AddWorkout: View {
  static let DefaultWorkoutName = "An untitled workout"

  @State var name = ""
  @State var completedDate = Date()
  let onComplete: (String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Name")) {
          TextField("Name", text: $name)
        }
        Section {
          DatePicker(
            selection: $completedDate,
            displayedComponents: .date) { Text("Completed Date").foregroundColor(Color(.gray)) }
        }
        Section {
          Button(action: addWorkoutAction) {
            Text("Add Workout")
          }
        }
      }
      .navigationBarTitle(Text("Add Workout"), displayMode: .inline)
    }
  }

  private func addWorkoutAction() {
    onComplete(
      name.isEmpty ? AddWorkout.DefaultWorkoutName : name,
      completedDate)
  }
}
