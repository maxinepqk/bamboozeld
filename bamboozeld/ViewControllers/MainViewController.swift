//
//  MainViewController.swift
//  bamboozeld
//
//  Created by Claire C on 1/2/18.
//  Copyright © 2018 Maxine Kwan. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var recentViewController: UIViewController!
    var favoriteViewController: UIViewController!
    var createDrinkViewController: UIViewController!
    var searchViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    var sett: PFObject!
   
    // setting view controller and button states
    @IBAction func didPressTab(_ sender: UIButton) {
        // removing previous VC and set button state
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // adding new VC and set button state
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //makeSetting()
        retrieveSetting()
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        recentViewController = storyboard.instantiateViewController(withIdentifier: "RecentViewController")
        favoriteViewController = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController")
        createDrinkViewController = storyboard.instantiateViewController(withIdentifier: "CreateDrinkViewController")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        viewControllers = [recentViewController, favoriteViewController, createDrinkViewController, searchViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])

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
        query.findObjectsInBackground { (settings: [PFObject]?, error: Error?) in
            if error == nil {
                let set = settings![0]
                self.sett = set
                print(set["drink_three"])
                print(set["drink_one"])
                print(set["drink_two"])
                print(set["drink_three"])
                print(set["drink_four"])
                print(set["drink_five"])
                self.editSettings()
            } else {
                print(error ?? "ERROR")
            }
            
        }
    }
    
    func editSettings(){
        sett?.setObject("rum", forKey: "drink_three")
        sett?.saveInBackground { (success: Bool, error: Error?) in
            print("edited")
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
