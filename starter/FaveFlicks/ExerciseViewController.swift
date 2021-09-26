import UIKit
import CoreData

class ExerciseViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var exercises: [NSManagedObject] = []
  override func viewDidLoad() {
    super.viewDidLoad()

    //
    
    title = "Exercise List"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "exerciseCell")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Exercise")

    do {
      exercises = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  @IBAction func addExercise(_ sender: Any) {
    let alert = UIAlertController(title: "New Exercise", message: "Add New Exercise", preferredStyle: .alert)
    alert.textFields?.first?.placeholder = "Body Part Worked Out"
      alert.addTextField { (textField : UITextField!) -> Void in
          textField.placeholder = "Add Exercise"

      let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
        guard let textField1 = alert.textFields?.first,
          let nameToSave = textField1.text else {
            return
        }
        guard let textField2 = alert.textFields?[1],
          let bodypartToSave = textField2.text else {
            return
        }
        self.save(name: nameToSave, bodyPart: bodypartToSave)
        self.tableView.reloadData()
      }

      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      alert.addTextField()
      alert.addAction(saveAction)
      alert.addAction(cancelAction)

        self.present(alert, animated: true)
    }
  }
  

  func save(name: String, bodyPart: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Exercise", in: managedContext)!
    let exercise = NSManagedObject(entity: entity, insertInto: managedContext)
    exercise.setValue(name, forKeyPath: "name")
    exercise.setValue(bodyPart, forKeyPath: "bodyPart")
    

    do {
      try managedContext.save()
      exercises.append(exercise)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
}

// MARK: - UITableViewDataSource
extension ExerciseViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exercises.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let exercise = exercises[indexPath.row]
    print(exercise)
    print(indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
    cell.textLabel?.text = exercise.value(forKeyPath: "name") as? String
    return cell
  }
  
  //delete
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              tableView.beginUpdates()
              //self.delete(indexPath.row)
              exercises.remove(at: indexPath.row)
              deleteRecord(a: indexPath.row)
            
              tableView.deleteRows(at: [indexPath], with: .none)
              tableView.endUpdates()
          }
      }
  
  func deleteRecord(a : Int) -> Void {
      let moc = getContext()
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")

       let result = try? moc.fetch(fetchRequest)
          let resultData = result as! [Exercise]

          //for object in resultData {
              //moc.delete(object)
          //}
          moc.delete(resultData[a])

          do {
              try moc.save()
              print("saved!")
          } catch let error as NSError  {
              print("Could not save \(error), \(error.userInfo)")
          } catch {

          }

  }

  // MARK: Get Context

  func getContext () -> NSManagedObjectContext {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      return appDelegate.persistentContainer.viewContext
  }
}
