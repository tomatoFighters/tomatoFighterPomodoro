//
//  TrucksViewController.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/14/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var playList:Playlist?
    
    @IBOutlet weak var truckTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.truckTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.truckTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
