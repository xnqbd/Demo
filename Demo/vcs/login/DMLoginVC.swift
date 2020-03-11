//
//  DMLoginVC.swift
//  Demo
//
//  Created by admin2 on 2020/3/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMLoginVC: CKJBaseTableVC {
    
    override func simpleTableViewStyle() -> UITableView.Style {
        return .plain
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        simpleTableView.backgroundColor = view.backgroundColor
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(40)
            s.haveTitleStyle.left = 0
        }
        
        let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
            let logo = CKJImageViewCellModel.imageView(withCellHeight: NSNumber(value: 132), detailSettingBlock: { (m) in
                m.localImage = UIImage.kjwd_imageNamed("logo")
                m.showLine = false;
            }) { (make, superView) in
                make.center.equalTo()(superView)
                make.size.equalTo()(CGSize(width: 120, height: 120))
            }
            let phone = self.simpleTableView._newtitle(nil, tfText: "17724801294", placeholder: "手机号码", emptyRequirdText: "手机号", cellId: kOInput_Phone, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
                m.addRequired(CKJInputExpressionRequiredModel.system_phoneRegError())
            })
            
            let pwd = self.simpleTableView._newtitle(nil, tfText: "111", placeholder: "密码", emptyRequirdText: "密码", cellId: kOInput_Pwd) {(m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            }
           
            let empty1 = CKJEmptyCellModel(height: 10, showLine: false)
            
            let login = CKJOneBtnCellModel.oneBtn(withCellHeight: NSNumber(value: 46), attTitle:WDCKJAttributed2("登录", UIColor.white, NSNumber(value: 14)), detailSettingBlock: { (m) in
                m.updateBtnData { (d) in
                    d.cornerRadius = 4;
                    d.normalBgImage = UIImage.kjwd_image(with: DMTheme.btnColor, size: CGSize(width: 300, height: 40))
                }
            }, clickBtn: {[weak self](m, btn) in
                self?.commitAction()
            }) { (make, superView) in
                make.edges.equalTo()
            }
            
//            let empty2 = CKJEmptyCellModel(height: 30, showLine: false)
                
//            let leftRight = CKJTwoBtnCellModel.twoBtn(withCellHeight: <#T##NSNumber?#>, leftTitle: <#T##String?#>, leftHandle: <#T##CKJBtnClick?##CKJBtnClick?##(UIButton, CKJBtnItemData) -> Void#>, rightTitle: <#T##String?#>, rightHandle: <#T##CKJBtnClick?##CKJBtnClick?##(UIButton, CKJBtnItemData) -> Void#>, fontSize: nil, textColor: nil, detailSettingBlock: <#T##CKJTwoBtnCellBlock?##CKJTwoBtnCellBlock?##(CKJTwoBtnCellModel) -> Void#>)
            
            let leftRight = CKJTwoBtnCellModel.twoBtn(withCellHeight: NSNumber(value: 50), leftTitle: "忘记密码", leftHandle: { (btn, data) in
                let cell = btn.kjwd_getCell()

            }, rightTitle: "注册", rightHandle: { (btn, data) in

            }, fontSize: nil, textColor: nil, detailSettingBlock: nil)

            _sec.modelArray = [logo, phone, pwd, empty1, login, leftRight]
        }
        
        simpleTableView.dataArr = [section1]
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func layoutTableViewFrame(_ tableV: CKJSimpleTableView) {
        tableV.kjwd_mas_makeConstraints { (make, superView) in
            make.edges.equalTo()(UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20))
        }
    }
    
    func commitAction() {
        if (simpleTableView.verityInputFail()) {
            return
        }
        let data = RJInputData(simpleTableView: simpleTableView)
        DMLoginManager.manager.login(username: data.phone!, pwd: data.pwd!)
    }
}