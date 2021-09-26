import UIKit
import CoreData

class TemplateExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var exercises: [NSManagedObject] = []
  
  let cellReuseIdentifier = "templateExerciseCell"
  
  var SelectedExercises = [NSManagedObject]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = " Template Exercise List"
    //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "templateExerciseCell")
    //tableView.allowsMultipleSelectionDuringEditing = true
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // number of rows in table view
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.exercises.count
  }
  
  // create a cell for each table view row
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // create a new cell if needed or reuse an old one
    let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
    // set the text from the data model
    let exercise = exercises[indexPath.row]
    cell.textLabel?.text = exercise.value(forKeyPath: "name") as? String
    
    return cell
  }
  
  // method to run when table view cell is tapped
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You tapped cell number \(indexPath.row).")
    
    if(SelectedExercises.contains(exercises[indexPath.row])){
      SelectedExercises.remove(at: indexPath.row)
    } else {
      SelectedExercises.append(exercises[indexPath.row])
    }
    print("size of array: \(SelectedExercises.count).")
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
  
  //
  
  @IBAction func addSelectedExercises(_ sender: Any) {
    // Call this method on whichever class implements our delegate protocol
    delegate?.userDidEnterInformation(info: "gtfo")

    //Todo: Go back to the previous view controller?
  }
  
  // Making this a weak variable, so that it won't create a strong reference cycle
  weak var delegate: DataEnteredDelegate? = nil
  
}

// Protocol used for sending data back
protocol DataEnteredDelegate: AnyObject {
    func userDidEnterInformation(info: String)
}
