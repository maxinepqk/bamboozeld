//
//  MainViewController.swift
//  bamboozeld
//
//  Created by Claire C on 1/2/18.
//  Copyright © 2018 Maxine Kwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Actions
    @IBAction func onRecent(_ sender: Any) {
        performSegue(withIdentifier: "recentSegue", sender: nil)
    }
    @IBAction func onFavorite(_ sender: Any) {
        performSegue(withIdentifier: "favoriteSegue", sender: nil)
    }
    @IBAction func onNewDrink(_ sender: Any) {
        //create alert
        let alert = UIAlertController(title: "New Drink", message: "", preferredStyle: UIAlertControllerStyle.alert)
        //create actions
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create Drink", style: UIAlertActionStyle.default, handler: { (action) in
            self.performSegue(withIdentifier: "createSegue", sender: nil)
        }))
        alert.addAction(UIAlertAction(title: "Search Drink", style: UIAlertActionStyle.default, handler: { (action) in
            self.performSegue(withIdentifier: "searchSegue", sender: nil)
        }))
        //present such alert
        self.present(alert, animated: true) {
            //what to do
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
