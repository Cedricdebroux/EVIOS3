//
//  DetailsCryptosViewController.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit
import Alamofire

class DetailsCryptosViewController: UIViewController {
    
static let identifier = "DetailsCryptosViewController"
    
    var crypto: CryptosLive!
    private var historics = [Historic]()

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    
    @IBOutlet var detailTableView: UITableView!
    
    @IBOutlet var loader: UIActivityIndicatorView!
    func setup(){
        nameLabel.text = crypto.name
        valueLabel.text = crypto
            .value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: DetailsTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: DetailsTableViewCell.identifier)
        
        setup()
        fetchDetailCrypto()
    }
    
    func fetchDetailCrypto(){
        loader.isHidden = false
        loader.startAnimating()
        let apiUrl = URL(string: "https://api.coincap.io/v2/assets/bitcoin/history?interval=d1")!
        AF.request(apiUrl).response{
            [weak self] response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                do {
                    let result = try JSONDecoder().decode(DatasDetail.self, from: data)
                    self?.historics = result.data
                    self?.detailTableView.reloadData()
                    self?.loader.isHidden = true
                    self?.loader.stopAnimating()
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
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
    
