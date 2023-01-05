//
//  ProfileTableViewController.swift
//  FlickerSearch
//
//  Created by kamilcal on 13.12.2022.
//

import UIKit
import SafariServices
import FirebaseAuth

struct ProfileCellModel {
    let title: String
    let handler: (() -> Void)
}

class ProfileTableViewController: UITableViewController {
    
    private var data = [[ProfileCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
    }
    
    private func configureModels() {
        data.append([
            ProfileCellModel(title: "Terms of Service") { [weak self] in
                self?.openURL(type: .terms)
            },
            ProfileCellModel(title: "Privacy Policy") { [weak self] in
                self?.openURL(type: .privacy)
            },
            ProfileCellModel(title: "Help / Feedback") { [weak self] in
                self?.openURL(type: .help)
            }
        ])
        
        data.append([
            ProfileCellModel(title: "Log Out") { [weak self] in
            self?.didTapLogOut()
        }
            ])
    }
    
    
    enum SettingsURLType {
        case terms, privacy, help
    }
    private func openURL(type: SettingsURLType){
        let urlString: String
        switch type {
        case .terms: urlString = "https://www.flickr.com/help/terms"
        case .privacy: urlString =  "https://www.flickr.com/help/privacy"
        case .help: urlString =  "https://www.flickrhelp.com/hc/en-us"
        }
        guard let url = URL(string: urlString) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func didTapLogOut(){
        let alert = UIAlertController(title: "Log Out",
                                    message: "Are you sure you want to log out?",
                                    preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel))
        alert.addAction(UIAlertAction(title: "Log Out",
                                      style: .destructive,
                                      handler: { _ in
            
            AuthManager.shared.logOut(completion: { succes in
                DispatchQueue.main.async {
                    if succes{
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
//                        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginViewController", bundle:nil)
//
//                        let infoViewController = storyBoard.instantiateViewController(withIdentifier: "cell") as! LoginViewController
//                        infoViewController.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true)
//                        self.present(infoViewController, animated:true, completion:nil)

                    
                        self.navigationController?.popToRootViewController(animated: false)
                    }
                    else {
                    }
                }
            })
        }))
                        
        present(alert, animated: true)
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
