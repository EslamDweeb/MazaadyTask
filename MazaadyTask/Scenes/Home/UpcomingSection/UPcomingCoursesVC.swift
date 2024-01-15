//
//  UPcomingCoursesVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class UPcomingCoursesVC: UIViewController {
    private var items = ["All","UI/UX","Illustration","3D Animation"]
    @IBOutlet weak var mainCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainCollectionView()
    }
    private func setupMainCollectionView(){
        mainCollection.registerCell(cellClass: CourseCat.self)
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.showsHorizontalScrollIndicator = false
        mainCollection.setCollectionViewLayout(UICollectionViewCompositionalLayout(section: mainSection()), animated: true)
        mainCollection.selectItem(at: .init(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    }
    private  func mainSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(40)) // adjust to your desired size
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60)) // adjust the height to your desired value
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
         let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
         return section
     }
}
extension UPcomingCoursesVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCat.getIdentifier(), for: indexPath) as! CourseCat
        cell.titleLbl.text = items[indexPath.row]
        return cell
    }
    
    
}

