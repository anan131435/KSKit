//
//  KSItDeskView.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/22.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Cocoa

class KSItDeskView: NSView,NSCollectionViewDataSource,NSCollectionViewDelegate {
    let itemIdenti = NSUserInterfaceItemIdentifier.init(rawValue: "KSHelpCollectionItem")
    lazy var whiteView: NSView = {
        let whiteView = NSView.init(frame: CGRect.init(x: 20, y: 7, width: self.bounds.size.width - 40, height: 79))
        whiteView.wantsLayer = true
        whiteView.layer?.cornerRadius = 6
        whiteView.layer?.backgroundColor = .white
        return whiteView
    }()
    lazy var itNoteBtn: NSButton = {
           let netInfoBtn = NSButton.init(title: "IT桌面", image: Bundle.main.image(forResource: "netInfoIcon")!.resize(CGSize.init(width: 2, height: 12)), target: nil, action: nil)
           netInfoBtn.font = NSFont.systemFont(ofSize: 14)
           netInfoBtn.isBordered = false
           netInfoBtn.attributedTitle = NSAttributedString(string: "IT桌面", attributes: [NSAttributedString.Key.font : NSFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("333333")])
           netInfoBtn.frame = CGRect.init(x: 14, y: 45, width: 72, height: 23)
           return netInfoBtn
       }()
    lazy var collectionView: NSCollectionView = {
       let collectionView = NSCollectionView()
        let layout = NSCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize.init(width: 135, height: 36)
        collectionView.collectionViewLayout = layout
        collectionView.register(KSHelpCollectionItem.classForCoder(), forItemWithIdentifier: NSUserInterfaceItemIdentifier.init(rawValue: "KSHelpCollectionItem"))
        collectionView.wantsLayer = true
//        collectionView.layer?.borderColor = NSColor.red.cgColor
//        collectionView.layer?.borderWidth = 1
        return collectionView
    }()
    var dataSource: [String] = [String]()
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addChildViews()
        setUpConstrains()
        setupBindEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addChildViews(){
        self.addSubview(whiteView)
        whiteView.addSubview(itNoteBtn)
        whiteView.addSubview(collectionView)
    }
    func setUpConstrains(){
        whiteView.snp.makeConstraints { (make) in
            make.top.equalTo(14)
            make.left.equalTo(20)
            make.bottom.equalTo(0)
            make.right.equalTo(-20)
        }
        itNoteBtn.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(18)
            make.width.equalTo(80)
            make.height.equalTo(23)
        }
        collectionView.snp.makeConstraints { (make) in
            make.left.equalTo(itNoteBtn)
            make.top.equalTo(itNoteBtn.snp.bottom).offset(8)
            make.right.equalTo(-18)
            make.bottom.equalTo(-7)
        }
    }
    func setupBindEvent(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func setupData(dataArr: [String],btnTitle: String){
        dataSource = dataArr
        collectionView.reloadData()
        itNoteBtn.attributedTitle = NSAttributedString(string: btnTitle, attributes: [NSAttributedString.Key.font : NSFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : NSColor.colorWithHex("333333")])
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem{
        let item = collectionView.makeItem(withIdentifier: itemIdenti, for: indexPath) as! KSHelpCollectionItem
        let title = dataSource[indexPath.item]
        item.updateCell(title)
        return item
    }
    
}
