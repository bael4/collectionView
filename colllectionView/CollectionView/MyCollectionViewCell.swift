//
//  MyCollectionViewCell.swift
//  colllectionView
//
//  Created by Баэль Рыспеков on 1/4/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {


    private let imageView = UIImageView()
      

    
    private let view = UIView()

    private let labelCase = UILabel()
    
    
    
    private let  nameLabel: UILabel = {
        let label = UILabel()
              label.font = UIFont.boldSystemFont(ofSize: 16)
              label.textColor = .black
        return label
    }()
    
    private let  numberLabel: UILabel = {
        let label = UILabel()
              label.font = UIFont.boldSystemFont(ofSize: 12)
              label.textColor = .lightGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)


        [imageView,nameLabel,numberLabel,labelCase].forEach { box in
            contentView.addSubview(box)
        }
      
      
        
      imageView.snp.makeConstraints { make in

            make.leading.equalToSuperview().offset(20)
          make.centerY.equalToSuperview()
          make.height.width.equalTo(40)
            
        }
    
        nameLabel.snp.makeConstraints { make in

            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalTo(imageView.snp.top)
            }
        
        numberLabel.snp.makeConstraints { make in

            make.leading.equalTo(nameLabel.snp.leading)
            make.bottom.equalTo(imageView.snp.bottom)
            }
        
        labelCase.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
     


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
     func setData (name: String, number: String, image: String){
        nameLabel.text = name
        numberLabel.text = number
        imageView.image = UIImage(named: image)
    }
    
    func setDataDetail (name: String){
        labelCase.text = name
    }

    }





