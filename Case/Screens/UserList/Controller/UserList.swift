//
//  UserList.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit
import TinyConstraints

class UserList: Base {
    private let viewModel = UserListVM.shared
    var searchUserName:String = ""
    private var users: [User] = []
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setLayout()
        setupTableView()
        getUsers()
    }
    
    func setLayout() {
        
        configureNavigationBar(
            largeTitleColor: .white ,
            backgoundColor: UIColor.black,
            tintColor: .white,
            title: "User List" ,
            preferredLargeTitle: true,
            hideBackItem: true,
            rightBarShow: false)
    }
    
    func getUsers() {
        viewModel.fetchUserList { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure( _):
                self?.tableView.isHidden = true
            }
        }
    }
}
extension UserList: UITableViewDelegate, UITableViewDataSource{
    private func setupTableView() {
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name) (\(user.email))"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        cell.selectedBackgroundView = UIView()
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        let detailVC = UserDetail(user: selectedUser)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
