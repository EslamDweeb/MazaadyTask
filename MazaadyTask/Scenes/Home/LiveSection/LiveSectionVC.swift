//
//  LiveSectionVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class LiveSectionVC: UIViewController {

    @IBOutlet weak var liveCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLiveCollectionView()
    }
    private func setupLiveCollectionView(){
        liveCollectionView.registerCell(cellClass: LiveCell.self)
        liveCollectionView.delegate = self
        liveCollectionView.dataSource = self
        liveCollectionView.showsHorizontalScrollIndicator = false
        liveCollectionView.setCollectionViewLayout(UICollectionViewCompositionalLayout(section: liveSection()), animated: true)
    }
    private  func liveSection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
         let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(85), heightDimension: .absolute(85))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
         group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
         
         let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
         return section
     }
}
extension LiveSectionVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCell.getIdentifier(), for: indexPath) as! LiveCell
        return cell
    }
    
    
}
