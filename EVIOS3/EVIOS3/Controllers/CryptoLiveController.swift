//
//  ViewController.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit
import Alamofire

class CryptoLiveController: UIViewController {
    
    
    private var cryptos = [CryptosLive]()
   
    @IBOutlet var cryptoLiveTableView: UITableView!
    
    @IBOutlet var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Crypto Live"
        
        
        cryptoLiveTableView.dataSource = self
        cryptoLiveTableView.delegate = self
        cryptoLiveTableView.register(UINib(nibName: CryptoLiveCell.identifier, bundle: .main), forCellReuseIdentifier: CryptoLiveCell.identifier)
        fetchCryptosL()
        
         
         
    }
    
    func fetchCryptosL(){
        loader.isHidden = false
        loader.startAnimating()
        let apiURL = URL(string: "https://api.coincap.io/v2/assets")!
        AF.request(apiURL).response{
            [weak self] response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                do {
                    let result = try JSONDecoder().decode(Datas.self, from: data)
                    self?.cryptos = result.data
                    self?.cryptoLiveTableView.reloadData()
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

extension CryptoLiveController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: CryptoLiveCell.identifier, for: indexPath) as? CryptoLiveCell
        else {
            fatalError("unable to dequeue cryptoLiveTableView")
        }
        customCell.setupCell(cryptoLive: cryptos[indexPath.row])
        return customCell
    }
    
    
}
extension CryptoLiveController: UITableViewDelegate{
   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailCryptos = storyboard?.instantiateViewController(withIdentifier: DetailsCryptosViewController.identifier) as? DetailsCryptosViewController{
            detailCryptos.crypto = cryptos[indexPath.row]
            navigationController?.pushViewController(detailCryptos, animated: true)
        }
        else{
            fatalError("unubale live details")
        }
    }
}
