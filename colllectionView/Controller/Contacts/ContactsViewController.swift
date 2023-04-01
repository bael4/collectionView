//
//  ViewController.swift
//  colllectionView
//
//  Created by Баэль Рыспеков on 31/3/23.
//

import UIKit
import SnapKit


class ContactsViewController: UIViewController {

    private let searchBar = UISearchBar()
    private var contacts: [Contact] = []
    private var isFiltering = false
    private var filteredContacts: [Contact] = []
    private let collectionContacts: UICollectionView = {
        
        let view: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        view.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        view.scrollDirection = .vertical
        

        let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
        vc.showsVerticalScrollIndicator = false
        return vc
    }()


    private let idCell = "cell"


    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        constrains()
        initData()
    }


    private func initUI () {
        
        view.backgroundColor = .white
        navigationItem.title = "Contacts"
        collectionContacts.dataSource = self
        collectionContacts.delegate = self
        collectionContacts.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: idCell)
        searchBar.delegate = self
        view.addSubview(collectionContacts)
        view.addSubview(searchBar)
    
    }


    private func constrains () {
        
      searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        collectionContacts.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            }
        }
    
    private func initData (){
        contacts = [
        Contact(name: "Bael Ryspekov", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Joseph Tribbiani", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Bael Ryspekov", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Joseph Tribbiani", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Bael Ryspekov", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Joseph Tribbiani", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Bael Ryspekov", number: "+996 507 409 317", image: "avatar"),
        Contact(name: "Joseph Tribbiani", number: "+996 507 409 317", image: "avatar"),
        ]
    }


}


extension ContactsViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ?filteredContacts.count: contacts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! MyCollectionViewCell

        if isFiltering{
            cell.setData(name: filteredContacts[indexPath.row].name, number: filteredContacts[indexPath.row].number, image: filteredContacts[indexPath.row].image)
        }else{
            cell.setData(name: contacts[indexPath.row].name, number: contacts[indexPath.row].number, image: contacts[indexPath.row].image)
        }
       
//        cell.backgroundColor = .green
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.image.image = UIImage(named: contacts[indexPath.row].image)
        vc.name.text = contacts[indexPath.row].name
        vc.number.text = contacts[indexPath.row].number
        self.navigationController?.pushViewController(vc, animated: true)
       
    }

}


extension ContactsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isFiltering = false
        }else{
            isFiltering = true
            filteredContacts = contacts.filter({ $0.name.lowercased().contains(searchText.lowercased())})
        }
        collectionContacts.reloadData()
    }
    
}
