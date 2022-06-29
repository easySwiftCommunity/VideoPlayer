//
//  UpCoomingViewController.swift
//  Kino Project
//
//  Created by mac on 24.06.2022.
//

import UIKit

class UpCoomingViewController: UIViewController {
    
    private var titles: [TV] = [TV]()
    
    private let upcoimingTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Cмотреть"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upcoimingTable)
        upcoimingTable.delegate = self
        upcoimingTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcoimingTable.frame = view.bounds
    }
    
    private func fetschCooming() {
        ApiAnime.shared.getMovie { [weak self]result in
            switch result {
            case.success(let titles):
                self.titles = titles
                upcoimingTable.reloadData()
            }
        }
    }
}

extension UpCoomingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "tekst"
        return cell
    }
}
