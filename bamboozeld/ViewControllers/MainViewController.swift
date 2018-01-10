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

    @IBAction func onSetting(_ sender: Any) {
        performSegue(withIdentifier: "settingSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
