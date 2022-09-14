//
//  DetailsCryptosViewController.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit

class DetailsCryptosViewController: UIViewController {
    
static let identifier = "DetailsCryptosViewController"
    
    var crypto: CryptosLive!
    private var historics: [Historic]()

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    
    
    @IBOutlet var detailTableView: UITableView!
    
    func setup(){
        nameLabel.text = crypto.name
        valueLabel.text = crypto
            .value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: DetailsCryptosViewController.identifier, bundle: .main), forCellReuseIdentifier: DetailsCryptosViewController.identifier)
        
        setup()
        
    }
    

}

extension DetailsCryptosViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = detailTableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell
        else {
            fatalError("unable to dequeue detail")
        }
        customCell.setupHistory(history: historics[indexPath.row])
        return customCell
    }
    }
    
