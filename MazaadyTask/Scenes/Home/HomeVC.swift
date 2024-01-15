//
//  HomeVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class HomeVC: BaseWireFrame<HomeViewModel> {

    @IBOutlet weak var notificationBnt: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainCollectionView()
    }
    override func bind(viewModel: HomeViewModel) {
        print("Home")
        notificationBnt.rx.tap.subscribe {[weak self] _ in
            guard let self else{return}
            // Button action
            self.coordinator.main.navigate(to: .form)
        }.disposed(by: disposeBag)
    }
    private func setupMainCollectionView(){
        mainCollectionView.register(LiveSectionCell.self, forCellWithReuseIdentifier: LiveSectionCell.getIdentifier())
        mainCollectionView.register(UpComingCousesCell.self, forCellWithReuseIdentifier: UpComingCousesCell.getIdentifier())
        mainCollectionView.register(CourseSectionCell.self, forCellWithReuseIdentifier: CourseSectionCell.getIdentifier())
        mainCollectionView.registerHeaderFooter(cellClass: UpcomingCourses.self, kind: "Header")
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.backgroundColor = .white
        configureCompositionalLayout()

       
    }
    private  func liveSection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
         
         let section = NSCollectionLayoutSection(group: group)
         return section
     }
     private  func categorySection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
          let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
         // group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20)
          
          let section = NSCollectionLayoutSection(group: group)
         // section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)

         section.boundarySupplementaryItems = [
          .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(40)), elementKind: "Header", alignment: .top),
         ]
          return section
      }
    private  func courseSection()-> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
         
         let section = NSCollectionLayoutSection(group: group)
         return section
     }
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self.liveSection()
            case 1:
                return self.categorySection()
            case 2:
                return self.courseSection()
            default:
                return self.liveSection()
            }
        }
      //  layout.register(VehicleSectionBackGroundView.self, forDecorationViewOfKind: ElementKind.background)
        mainCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveSectionCell.getIdentifier(), for: indexPath) as! LiveSectionCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpComingCousesCell.getIdentifier(), for: indexPath) as! UpComingCousesCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseSectionCell.getIdentifier(), for: indexPath) as! CourseSectionCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveSectionCell.getIdentifier(), for: indexPath) as! LiveSectionCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UpcomingCourses.getIdentifier(), for: indexPath) as! UpcomingCourses
            return header
        default:
           return UICollectionReusableView()
        }
    }
}
