//
//  GLNTRKNA_StudioTabController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class GLNTRKNA_StudioTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNAconfigureWorkspaces()
    }
    
    private func GLNTRKNAconfigureWorkspaces() {
        
        let RNLfore = GLNTRKNA_MainDiscoveryHub()
        let RNLforeVC = GLNTRKNA_RootNavigation(rootViewController: RNLfore)
        RNLforeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "GLNTRKNA_bar0")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "GLNTRKNA_bar0_T")?.withRenderingMode(.alwaysOriginal))
        RNLforeVC.navigationBar.isHidden = true
        let RNLexploreVC = GLNTRKNA_DiscoveryBoardController()
        let navExplore = GLNTRKNA_RootNavigation(rootViewController: RNLexploreVC)
        navExplore.navigationBar.isHidden = true
        navExplore.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "GLNTRKNA_bar1")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "GLNTRKNA_bar1_T")?.withRenderingMode(.alwaysOriginal))
        
        
        let RNLatmesgVC = GLNTRKNA_ChatNexusController()
        let navAmesger = GLNTRKNA_RootNavigation(rootViewController: RNLatmesgVC)
        navAmesger.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "GLNTRKNA_bar2")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "GLNTRKNA_bar2_T")?.withRenderingMode(.alwaysOriginal))
        navAmesger.navigationBar.isHidden = true
       
        let RNLatelierVC = GLNTRKNA_PersonalOrbitController()
        let navAtelier = GLNTRKNA_RootNavigation(rootViewController: RNLatelierVC)
        navAtelier.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "GLNTRKNA_bar3")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "GLNTRKNA_bar3_T")?.withRenderingMode(.alwaysOriginal))
        navAtelier.navigationBar.isHidden = true
        
        
        
        self.viewControllers = [RNLforeVC,navExplore,navAmesger, navAtelier]
        self.tabBar.isTranslucent = false
       let RNLappeac = UITabBarAppearance.init()
        RNLappeac.backgroundColor = UIColor(red: 0.11, green: 0.08, blue: 0.24, alpha: 1)
        self.tabBar.standardAppearance = RNLappeac
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//       
//        appearance.backgroundColor = UIColor(red: 0.11, green: 0.08, blue: 0.24, alpha: 1)
//        appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.11, green: 0.08, blue: 0.24, alpha: 1)]
//        
//        UINavigationBar.appearance().standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = RNLappeac
        
        
    }
}

// MARK: - 自定义导航基类
class GLNTRKNA_RootNavigation: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 如果不是根视图，则隐藏底部栏
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GLNTRKNA_FixNavBarObstruction()
    }
    
    private func GLNTRKNA_FixNavBarObstruction() {
        let gln_appearance = UINavigationBarAppearance()
        // 设置为完全透明，避免滚动时出现背景色块遮挡内容
        gln_appearance.configureWithTransparentBackground()
        gln_appearance.backgroundColor = .clear
        
        // 关键：统一标准状态和滚动状态的外观
        self.navigationController?.navigationBar.standardAppearance = gln_appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = gln_appearance
        self.navigationController?.navigationBar.compactAppearance = gln_appearance
    }
}


class GLNTRKNA_BasicController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
  
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
