//
//  PhotosPickerSheet.swift
//
//
//  Created by Lorenzo Fiamingo on 16/09/21.
//

#if os(iOS)

import SwiftUI
import PhotosUI

@available(iOS 14.0, *)
struct PhotosPickerSheet<Content: View>: View {
    
    @Binding var isPresented: Bool
    
    @State private var pickerViewController: PHPickerViewController
    
    @State private var coordinator: Coordinator
    
    private var content: Content
    
    init(isPresented: Binding<Bool>, configuration: PHPickerConfiguration, onDismiss: (([PHPickerResult]) -> Void)?, content: Content) {
        let pickerViewController = PHPickerViewController(configuration: configuration)
        let coordinator = Coordinator(onPicking: onDismiss)
        pickerViewController.delegate =  coordinator
        
        self._isPresented = isPresented
        self._pickerViewController = State(wrappedValue: pickerViewController)
        self._coordinator = State(wrappedValue: coordinator)
        self.content = content
    }
    
    var body: some View {
        content
            .onChange(of: pickerViewController.isBeingPresented) { presenting in
                isPresented = presenting
            }
            .onChange(of: isPresented) { presenting in
                if presenting && !pickerViewController.isBeingPresented {
                    UIApplication.shared
                        .topmostViewController?
                        .present(pickerViewController, animated: true)
                } else if pickerViewController.isBeingPresented {
                    pickerViewController
                        .presentingViewController?
                        .dismiss(animated: true)
                    coordinator.onPicking?([])
                }
            }
    }
}

@available(iOS 14.0, *)
private class Coordinator: PHPickerViewControllerDelegate {
    
    let onPicking: (([PHPickerResult]) -> Void)?
    
    init(onPicking: (([PHPickerResult]) -> Void)?) {
        self.onPicking = onPicking
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.presentingViewController?.dismiss(animated: true)
        onPicking?(results)
    }
}

@available(iOS 14.0, *)
private extension UIApplication {
    
    var topmostViewController: UIViewController? {
        var viewController = connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap({$0 as? UIWindowScene})
            .first?
            .windows
            .filter { $0.isKeyWindow }
            .first?
            .rootViewController
        while let presentedViewController = viewController?.presentedViewController {
            viewController = presentedViewController
        }
        return viewController
    }
}

#endif
