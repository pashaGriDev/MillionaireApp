// LearningApp, 2024

import SwiftUI

struct ViewControllerRepresentable<Content: UIViewController> : UIViewControllerRepresentable {
    typealias UIViewControllerType = Content
    
    func makeUIViewController(context: Context) -> Content { Content() }
    
    func updateUIViewController(_ uiViewController: Content, context: Context) { }
}

/*
 
 You can use this by replacing the YourViewController with your
 
 #Preview {
     ViewControllerRepresentable<YourViewController>()
 }
 
 */
