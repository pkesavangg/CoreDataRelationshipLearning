//
//  HelperToast.swift
//  DelegateMethodTesting
//
//  Created by Kesavan Panchabakesan on 06/03/23.
//

import Foundation

class HelperService: ObservableObject, ToastDelegate {
    
    @Published var showToast:Bool?
    @Published var toastData: ToastModifier.ToastData = ToastModifier.ToastData(title: "",  detail: "" ,type: .Success)
    
    static var shared: HelperService = HelperService()
    
    func showToast(toastData: ToastModifier.ToastData, showToast: Bool) {
        self.showToast = true
        self.toastData.title = toastData.title
        self.toastData.detail = toastData.detail
        self.toastData.type = .Success
    }
    
    
}
