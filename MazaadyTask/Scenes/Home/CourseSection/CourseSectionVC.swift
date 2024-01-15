//
//  CourseSectionVC.swift
//  MazaadyTask
//
//  Created by eslam dweeb on 15/01/2024.
//

import UIKit

class CourseSectionVC: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCourseCollectionView()
        // Do any additional setup after loading the view.
    }
    private func setupCourseCollectionView(){
        mainCollectionView.registerCell(cellClass: CourseCell.self)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.showsHorizontalScrollIndicator = false
//        mainCollectionView.setCollectionViewLayout(UICollectionViewCompositionalLayout(section: liveSection()), animated: true)
    }
}
extension CourseSectionVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCell.getIdentifier(), for: indexPath) as! CourseCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 30, height: 360)
    }
    
}
