//
//  NavigationSetting.swift
//  TodoListVerCode
//
//  Created by 박성원 on 2023/08/26.
//

import UIKit


class NavigationSetting: UIViewController {
    
    static func navigationBarSetting() {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        
        
        navigationBarAppearance.backgroundColor = UIColor.white //배경색 조정
        UINavigationBar.appearance().tintColor = UIColor.systemOrange //아이템색 변경
        
        navigationBarAppearance.shadowColor = .none //아래 테두리 없애기
        //navigationBarAppearance.configureWithOpaqueBackground() //불투명색으로
        //navigationBarAppearance.configureWithTransparentBackground() // 투명으로
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        
        //navigationController?.navigationBar.isTranslucent = false //기본값인 반투명을 false
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance //scrollEdge로 만듬 -> 스크롤하기 전 적용
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance //스크롤 한 후 적용
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
}

