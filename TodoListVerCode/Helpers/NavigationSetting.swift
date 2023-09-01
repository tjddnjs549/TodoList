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
        
        
        navigationBarAppearance.backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.systemOrange
        
        navigationBarAppearance.shadowColor = .none
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        

        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
}

