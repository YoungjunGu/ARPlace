//
//  ARView.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/05/12.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI
import ARKit
//
//struct ARView: UIViewControllerRepresentable {
//    
//    func makeCoordinator() -> ARView.Coordinator {
//        return Coordinator(self)
//    }
//    
//    func makeUIViewController(context: Context) -> ARViewController {
//        let arVC = ARViewController()
//        arVC.sceneView.delegate = context.coordinator
//        return arVC
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//    
//    }
//}
//
//// inner class로 Coordinator 구현
//extension ARView {
//    class Coordinator: NSObject, ARSCNViewDelegate {
//        var parent: ARView
//        
//        init(_ parent: ARView) {
//            self.parent = parent
//        }
//    }
//}
//
//struct ARView_Previews: PreviewProvider {
//    static var previews: some View {
//        ARView()
//    }
//}
