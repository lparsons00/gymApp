import Foundation
import UIKit
import SwiftUI
import CoreData

//test
class CellModelSelectedExercises: UITableViewCell {

@IBOutlet weak var lbl_name: UILabel!

@IBOutlet weak var btn_addRecording: UIButton!

@IBOutlet weak var setBtnOne: UIButton!
@IBOutlet weak var repOne: UITextField!
@IBOutlet weak var weightOne: UITextField!
  
@IBOutlet weak var setBtnTwo: UIButton!
@IBOutlet weak var repTwo: UITextField!
@IBOutlet weak var weightTwo: UITextField!
  
@IBAction func btnAction_addRecording(sender: AnyObject) {

  print(lbl_name.text)
  
  //add set here
  //cell height must be changed
  setBtnTwo.isEnabled = true
  repTwo.isEnabled = true
  weightTwo.isEnabled = true
  setBtnTwo.isHidden = false
  repTwo.isHidden = false
  weightTwo.isHidden = false
  
  
}
override func awakeFromNib() {
  let theWidth = UIScreen.main.bounds.width
  contentView.frame = CGRect(x: 0,y: 0, width: theWidth, height: 180)
  
  super.awakeFromNib()
  
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
}

func setCell(setExerciseName: String) {
    self.lbl_name.text = setExerciseName
}
}
//end test

class QuickWorkoutViewController: UIViewController, QuickWorkoutDataEnteredDelegate, DataEnteredDelegate, UITableViewDataSource{
  @IBOutlet weak var exercisesTable: UITableView!
  // number of rows in table view
  /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exercises.count
  }
  
  // create a cell for each table view row
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // create a new cell if needed or reuse an old one
    let cell = self.exercisesTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
    // set the text from the data model
    let exercise = exercises[indexPath.row]
    //cell.textLabel?.text = exercise.value(forKeyPath: "name") as? String
    cell.textLabel?.text = exercise.value(forKeyPath: "name") as? String
    cell.textLabel?.sizeToFit()
    
    //cell.button.addTarget(self, action: #selector(whichButtonPressed(sender:)), for: .touchUpInside)
    return cell
  }*/
  //test
  //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
  //}
  //func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var cell:CellModelSelectedExercises = self.exercisesTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CellModelSelectedExercises
    let exercise = exercises[indexPath.row]
    cell.setCell(setExerciseName: exercise.value(forKeyPath: "name") as! String)
       print("in tableView, cellforRowAt, returning new cells")
    exercisesTable.rowHeight = 180
    cell.btn_addRecording.tag = indexPath.row
    
    //set default as hidden
    cell.setBtnTwo.isEnabled = false
    cell.repTwo.isEnabled = false
    cell.weightTwo.isEnabled = false
    cell.setBtnTwo.isHidden = true
    cell.repTwo.isHidden = true
    cell.weightTwo.isHidden = true
    
    return cell
   }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return exercises.count
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

  }
  
  //end test
  
  var text:String = ""
  var exercises: [NSManagedObject] = []
  let cellReuseIdentifier = "selectedExercisesQuickWorkout"

  @IBOutlet weak var textLabel: UILabel!
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    textLabel?.text = text
    exercisesTable.rowHeight = 150
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showExerciseQuickWorkoutTemplate" {
      let quickWorkoutExerciseViewController = segue.destination as! QuickWorkoutExerciseViewController
            quickWorkoutExerciseViewController.delegate = self
      }
    }

    func userDidEnterInformation(info: String) {
      textLabel.text = info
    }
  
    func exercisesAdded(exercisesAdd: Array<Any>){
      print(exercisesAdd)
      
      exercisesTable.beginUpdates()
      for exercise in exercisesAdd{
        print(exercise)
        self.exercises.append(exercise as! NSManagedObject)
      }
      //self.yourArray.append(msg)
      print(self.exercises.count)
      exercisesTable.insertRows(at: [IndexPath(row: exercises.count-1, section: 0)], with: .automatic)
      exercisesTable.endUpdates()
    }
  
  //add set stuff
  
  @IBAction func addSetBtnClicked(_ sender: Any) {
    /*let myButton = UIButton() // if you want to set the type use like UIButton(type: .RoundedRect) or UIButton(type: .Custom)
        myButton.setTitle("Hi, Click me", for: .normal)
        myButton.setTitleColor(UIColor.blue, for: .normal)
        myButton.frame = CGRect(x: 0, y: 00, width: 300, height: 500)

        myButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
        self.view.addSubview( myButton)*/
    //cell

  }
  @objc func whichButtonPressed(sender: UIButton) {
    var buttonNumber = sender.tag

  }
  @objc func pressedAction(_ sender: UIButton) {
       // do your stuff here
      print("you clicked on button \(sender.tag)")
    }
  //end add set stuff
  
}

