//
//  FavoriteViewController.swift
//  bamboozeld
//
//  Created by Claire C on 1/2/18.
//  Copyright © 2018 Maxine Kwan. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //Actions
    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true) {
            //done and return to main
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as! FavoritesCell
        return cell
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
