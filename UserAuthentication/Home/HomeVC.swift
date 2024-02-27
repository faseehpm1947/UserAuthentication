//
//  HomeVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit

class HomeVC: UIViewController {
    static func instantiate() -> HomeVC{
        guard let homeView = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        else{fatalError("Unexpectedly failed getting homeVC from storyboard")}
        return homeView
    }

    @IBOutlet weak var tableViewEmployList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewEmployList.register(UINib(nibName: "UserDetailsTVC", bundle: nil), forCellReuseIdentifier: "UserDetailsTVC")

    }
    
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTVC", for: indexPath) as! UserDetailsTVC
        return cell
    }
    
}
