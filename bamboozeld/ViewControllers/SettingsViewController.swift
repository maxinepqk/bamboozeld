//
//  SettingsViewController.swift
//  bamboozeld
//
//  Created by Claire C on 1/9/18.
//  Copyright © 2018 Maxine Kwan. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    //Outlets
    @IBOutlet weak var oneText: UITextField!
    @IBOutlet weak var twoText: UITextField!
    @IBOutlet weak var threeText: UITextField!
    @IBOutlet weak var fourText: UITextField!
    @IBOutlet weak var fiveText: UITextField!
    
    var sett: PFObject!
    
    //Actions
    @IBAction func onDone(_ sender: Any) {
        editSettings()
        self.dismiss(animated: true) {
            //done
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveSetting()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeSetting(){
        let drinklist = ["vodka", "tequila", "orange juice", "cranberry juice", "coke"]
        Setting.createSetting(drinks: drinklist) { (success: Bool, error: Error?) in
            if success {
                print("saved correctly")
            } else {
                print("nope")
            }
        }
    }
    
    func retrieveSetting(){
        let id = "default"
        let query = PFQuery(className: "Setting")
        query.whereKey("id", equalTo: id)
        do {
            let s = try query.findObjects()
            let set = s[0]
            self.sett = set
            oneText.placeholder = set["drink_one"] as! String
            twoText.placeholder = set["drink_two"] as! String
            threeText.placeholder = set["drink_three"] as! String
            fourText.placeholder = set["drink_four"] as! String
            fiveText.placeholder = set["drink_five"] as! String
            } catch {
                print(error ?? "ERROR")
            }
            
        }
    
    func editSettings(){
        if (oneText.text != "") {
            sett?.setObject(oneText.text, forKey: "drink_one")
        }
        if (twoText.text != "") {
            sett?.setObject(twoText.text, forKey: "drink_two")
        }
        if (threeText.text != "") {
            sett?.setObject(threeText.text, forKey: "drink_three")
        }
        if (fourText.text != "") {
            sett?.setObject(fourText.text, forKey: "drink_four")
        }
        if (fiveText.text != "") {
            sett?.setObject(fiveText.text, forKey: "drink_five")
        }
        sett?.saveInBackground { (success: Bool, error: Error?) in
            if success {
                print("edited")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
