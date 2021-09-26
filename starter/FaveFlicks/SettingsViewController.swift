import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
  
  @IBOutlet weak var settingsTableView: UITableView!
  
  let settings = ["Exercises", "Weight Units", "Share Us", "Privacy Policy",
                  "Terms of Use", "Contact Us"]
  let textCellIdentifier = "SettingsCell"
  
  override func viewDidLoad() {
      super.viewDidLoad()

      settingsTableView.delegate = self
      settingsTableView.dataSource = self
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return settings.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = settingsTableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)

      let row = indexPath.row
      cell.textLabel?.text = settings[row]
      print(settings)
    
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row
        //print("Row: \(row)")

        //print(settings[row] as! String)
    if(row == 0){
      //Exercises
      let exerciseViewController = self.storyboard?.instantiateViewController(withIdentifier: "exerciseTab") as! ExerciseViewController
      //self.navigationController?.pushViewController(exerciseViewController, animated: true)
      self.present(exerciseViewController, animated: true, completion: nil)
    } else if(row == 1){
      //Weight Units
      let alert = UIAlertController(title: "Select weight unit", message: "", preferredStyle: .alert)

      alert.addAction(UIAlertAction(title: "KG", style: .default, handler: {
        action in print("Selected KG")
      }))
      alert.addAction(UIAlertAction(title: "Lb", style: .cancel, handler: {
        action in print("Selected Lb")
      }))

      self.present(alert, animated: true)
      
    } else if(row == 2){
      //Share Us
      let contactUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "contactUs") as! ContactUsViewController
      //self.navigationController?.pushViewController(contactUsViewModel, animated: true)
      self.present(contactUsViewController, animated: true, completion: nil)
    } else if(row == 3){
      //Privacy Policy
      let contactUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "contactUs") as! ContactUsViewController
      //self.navigationController?.pushViewController(contactUsViewModel, animated: true)
      self.present(contactUsViewController, animated: true, completion: nil)
    } else if(row == 4){
      //Terms of Use
      let contactUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "contactUs") as! ContactUsViewController
      //self.navigationController?.pushViewController(contactUsViewModel, animated: true)
      self.present(contactUsViewController, animated: true, completion: nil)
    } else if(row == 5){
      let contactUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "contactUs") as! ContactUsViewController
      //self.navigationController?.pushViewController(contactUsViewModel, animated: true)
      self.present(contactUsViewController, animated: true, completion: nil)
    }
  }
}

