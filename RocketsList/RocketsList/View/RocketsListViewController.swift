//
//  ViewController.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 17.01.21.
//

import UIKit

class RocketsListViewController: UIViewController, AlertPresentable {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: RocketsListViewModel = RocketsListViewModel(networkService: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rockets"
        
        activityIndicator.startAnimating()
        
        viewModel.fetchRockets { [weak self] success, error in
            if success {
                self?.updateTableView()
            } else if let error = error {
                self?.showError(with: error.localizedDescription)
            }
            
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RocketDetails",
           let rocketDetailsViewController = segue.destination as? RocketDetailsViewController,
           let indexPath = tableView.indexPathForSelectedRow,
           let rocket = viewModel.rocket(by: indexPath.item) {
            rocketDetailsViewController.viewModel = RocketDetailsViewModel(rocket: rocket)
        }
    }

    fileprivate func updateTableView() {
        tableView.reloadData()
        tableView.isHidden = false
    }
}

// MARK: - Table view data source

extension RocketsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rocketsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RocketCell.reuseIdentifier, for: indexPath)

        if let rocketCell = cell as? RocketCell,
           let rocket = viewModel.rocket(by: indexPath.item) {
            rocketCell.viewModel = RocketDetailsViewModel(rocket: rocket)
            rocketCell.update()
            
            return rocketCell
        }

        return cell
    }
}
