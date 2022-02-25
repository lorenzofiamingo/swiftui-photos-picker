//
//  View+photosPicker.swift
//
//
//  Created by Lorenzo Fiamingo on 16/09/21.
//

#if os(iOS)

import SwiftUI
import PhotosUI

@available(iOS 14, *)
public extension View {
    
    func photosPicker(
        isPresented: Binding<Bool>,
        configuration: PHPickerConfiguration = .init(),
        onDismiss: (([PHPickerResult]) -> Void)? = nil
    ) -> some View {
        PhotosPickerSheet(isPresented: isPresented, configuration: configuration, onDismiss: onDismiss, content: self)
    }
}

#endif
