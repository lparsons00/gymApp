import SwiftUI

struct WorkoutList: View {
  @State var workouts = WorkoutList.makeWorkoutDefaults()
  @State var isPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(workouts, id: \.name) {
          WorkoutRow(workout: $0)
        }
        .onDelete(perform: deleteWorkout)
      }
      .sheet(isPresented: $isPresented) {
        AddWorkout { name, completedDate in
          self.addWorkout(name: name, completedDate: completedDate)
          self.isPresented = false
        }
      }
      .navigationBarTitle(Text("Workouts"))
        .navigationBarItems(trailing:
          Button(action: { self.isPresented.toggle() }) {
            Image(systemName: "plus")
          }
      )
    }
  }

  func deleteWorkout(at offsets: IndexSet) {
    workouts.remove(atOffsets: offsets)
  }

  func addWorkout(name: String, completedDate: Date) {
    let newWorkout = Workout(name: name, completedDate: completedDate)
    workouts.append(newWorkout)
  }

  static func makeWorkoutDefaults() -> [Workout] {
    let mondayOnePHUL = Workout(
      name: "Monday 1 PHUL",
      completedDate: Date(timeIntervalSince1970: 1056730041))
    let tuesdayOnePHUL = Workout(
      name: "Tuesday 1 PHUL",
      completedDate: Date(timeIntervalSince1970: 1373558841))
    let thursdayOnePHUL = Workout(
      name: "Thursday 1 PHUL",
      completedDate: Date(timeIntervalSince1970: 1011974841))

    return [mondayOnePHUL, tuesdayOnePHUL, thursdayOnePHUL]
  }
}

struct WorkoutList_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutList()
  }
}
