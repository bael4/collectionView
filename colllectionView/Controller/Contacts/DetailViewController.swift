//
//  ViewController.swift
//  colllectionView
//
//  Created by Баэль Рыспеков on 31/3/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    private let idCell = "cell"
    
    private let collection: UICollectionView = {
        
        let view: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        view.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        view.scrollDirection = .vertical

        let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
        vc.showsVerticalScrollIndicator = false
        return vc
    }()
    
      let image = UIImageView()
      let name : UILabel = {
          let label = UILabel()
                label.font = UIFont.boldSystemFont(ofSize: 30)
                label.textColor = .black
          return label
      }()
    
    let number : UILabel = {
        let label = UILabel()
              label.font = UIFont.boldSystemFont(ofSize: 16)
              label.textColor = .systemBlue
        return label
    }()
    
    private let mobile: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Mobile"
        return label
    }()
    
    
    private let messageImage: UIImageView =  {
        let image = UIImageView()
        image.image = UIImage(systemName: "message.fill")
        return image
    }()
    
    private let callImage: UIImageView =  {
        let image = UIImageView()
        image.image = UIImage(systemName: "phone.fill")
        return image
    }()
    
    private let faceTimeImage: UIImageView =  {
        let image = UIImageView()
        image.image = UIImage(systemName: "camera.fill")
        return image
    }()
    
    private let mailImage: UIImageView =  {
        let image = UIImageView()
        image.image = UIImage(systemName: "mail.fill")
        return image
    }()
    
    let message: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        label.text = "Message"
        return label
    }()
    
    let call: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        label.text = "Call"
        return label
    }()
    
    let faceTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        label.text = "FaceTime"
        return label
    }()
    
    let mail: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        label.text = "Mail"
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        constrains()
    }
    
    
    private func initUI(){
        
        view.backgroundColor = .white
        
        collection.dataSource = self
        
        collection.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: idCell)
        [image,name,messageImage,callImage,faceTimeImage,mailImage,message,call,faceTime,mail,number,mobile,collection].forEach { box in
            view.addSubview(box)
        }
        
    }
    
    private func constrains() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.height.width.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        messageImage.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.height.width.equalTo(30)
        }
        
        callImage.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.leading.equalTo(messageImage.snp.trailing).offset(50)
            make.height.width.equalTo(30)
        }

        faceTimeImage.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.trailing.equalTo(mailImage.snp.leading).offset(-50)
            make.height.width.equalTo(30)
        }
        
        mailImage.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-50)
            make.height.width.equalTo(30)
        }
        
        message.snp.makeConstraints { make in
            make.top.equalTo(messageImage.snp.bottom).offset(5)
            make.centerX.equalTo(messageImage)
        }
        
        call.snp.makeConstraints { make in
            make.top.equalTo(callImage.snp.bottom).offset(5)
            make.centerX.equalTo(callImage)
        }
        
        faceTime.snp.makeConstraints { make in
            make.top.equalTo(faceTimeImage.snp.bottom).offset(5)
            make.centerX.equalTo(faceTimeImage)
        }
        
        mail.snp.makeConstraints { make in
            make.top.equalTo(mailImage.snp.bottom).offset(5)
            make.centerX.equalTo(mailImage)
        }
        
        mobile.snp.makeConstraints { make in
            make.top.equalTo(message.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
        }

        
        number.snp.makeConstraints { make in
            make.top.equalTo(mobile.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        

        collection.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
    }
    

    

}



extension DetailViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Resources.names.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! MyCollectionViewCell
        let name = Resources.names.allCases[indexPath.row].rawValue
        cell.setDataDetail(name: name)
        return cell
    }
    
    
}
