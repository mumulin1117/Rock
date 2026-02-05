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
        RNLforeVC.tabBarItem = UITabBarItem(title: nil, image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar0")?.withRenderingMode(.alwaysOriginal),selectedImage: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar0_T")?.withRenderingMode(.alwaysOriginal))
        
        let RNLexploreVC = GLNTRKNA_DiscoveryBoardController()
        let navExplore = GLNTRKNA_RootNavigation(rootViewController: RNLexploreVC)
      
        navExplore.tabBarItem = UITabBarItem(title: nil, image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar1")?.withRenderingMode(.alwaysOriginal),selectedImage: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar1_T")?.withRenderingMode(.alwaysOriginal))
        
        
        let RNLatmesgVC = GLNTRKNA_ChatNexusController()
        let navAmesger = GLNTRKNA_RootNavigation(rootViewController: RNLatmesgVC)
        navAmesger.tabBarItem = UITabBarItem(title: nil, image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar2")?.withRenderingMode(.alwaysOriginal),selectedImage: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar2_T")?.withRenderingMode(.alwaysOriginal))
       
       
        let RNLatelierVC = GLNTRKNA_PersonalOrbitController()
        let navAtelier = GLNTRKNA_RootNavigation(rootViewController: RNLatelierVC)
        navAtelier.tabBarItem = UITabBarItem(title: nil, image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar3")?.withRenderingMode(.alwaysOriginal),selectedImage: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_bar3_T")?.withRenderingMode(.alwaysOriginal))
       
        
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


class GLNTRKNA_RootNavigation: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       
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
        
        gln_appearance.configureWithTransparentBackground()
        gln_appearance.backgroundColor = .clear
    
        self.navigationController?.navigationBar.standardAppearance = gln_appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = gln_appearance
        self.navigationController?.navigationBar.compactAppearance = gln_appearance
        
        let gln_text_attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = gln_text_attr
       navigationBar.tintColor = .white
        
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
