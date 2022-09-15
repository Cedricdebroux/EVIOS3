//
//  Cryptos.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit
import Alamofire

class CryptosController: UIViewController {


    private var cryptos = [Cryptos]()
    
    @IBOutlet var CryptosTableView: UITableView!
    
    @IBOutlet var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cryptos"
        CryptosTableView.dataSource = self
        
        
        CryptosTableView.register(UINib(nibName: CryptosCell.identifier, bundle: .main), forCellReuseIdentifier: CryptosCell.identifier)
        fetchCryptos()
    }
    

    func fetchCryptos(){
        loader.isHidden = false
        loader.startAnimating()
        let apiURL = URL(string: "https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR")!
        AF.request(apiURL).response{
            [weak self] response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                do {
                    let result = try JSONDecoder().decode(Coins.self, from: data)
                    self?.cryptos = result.coins
                    self?.CryptosTableView.reloadData()
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
extension CryptosController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = CryptosTableView.dequeueReusableCell(withIdentifier: CryptosCell.identifier, for: indexPath) as? CryptosCell
        else {
            fatalError("unable to dequeue CryptosCell")
        }
        customCell.setupCell(cryptosC: cryptos[indexPath.row])
        return customCell
    }
    
    
}


