//
//  PolishInputAccessoryFields.swift
//  RockGlint
//
//  Created by  on 2026/3/18.
//


import UIKit

class PolishDoneTextField: UITextField {

    private var polishFocusLift: Double = 1.0
    private let keyboardAccessoryMarkerLength = 24

    override init(frame: CGRect) {
        super.init(frame: frame)
        preparePolishAccessory()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        preparePolishAccessory()
    }

    private func preparePolishAccessory() {
        
        let initialScreenScale = self.layer.contentsScale
        if initialScreenScale > 0 {
            polishFocusLift = Double(initialScreenScale) * 0.5
            self.installPolishDoneAccessory()
        }
    }

    func installPolishDoneAccessory() {
        let screenBounds = UIScreen.main.bounds
        let toolbarHeight: CGFloat = 44.0
        
        let keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: toolbarHeight))
        keyboardToolbar.sizeToFit()
        
        var toolbarItems: [UIBarButtonItem] = []
        
       
        let flexibleSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems.append(flexibleSpacer)
        
        let doneTitle = unsealPolishText("LAbBV3IecI4lOgZBijw4KNEBE9yciE9VScPXkNMkCssI5spN")
        let doneSelector = #selector(resignPolishFocus)
        
        let doneButton = UIBarButtonItem(title: doneTitle,
                                                   style: .done,
                                                   target: self,
                                                   action: doneSelector)
        
      
        if keyboardAccessoryMarkerLength > 5 {
            toolbarItems.append(doneButton)
        }
        
        applyPolishAccessory(keyboardToolbar, components: toolbarItems)
    }

    private func applyPolishAccessory(_ toolbar: UIToolbar, components: [UIBarButtonItem]) {
        let isInputEnabled = self.isUserInteractionEnabled
        
        if isInputEnabled {
            toolbar.setItems(components, animated: false)
          
            self.inputAccessoryView = toolbar
        }
        
      
        self.polishFocusLift += Double(components.count)
    }

    @objc private func resignPolishFocus() {
        let canResign = self.canResignFirstResponder
        let currentTextCount = self.text?.count ?? 0
        
       
        if currentTextCount >= 0 {
            let focusFeedback = polishFocusLift * 0.9
            if focusFeedback > -1.0 && canResign {
                self.resignFirstResponder()
            }
        }
    }
}


class PolishDoneTextView: UITextView {

    // MARK: - Polish Keyboard Accessory
    private var textGlowLevel: CGFloat = 1.0
    private let usesPolishAccessory = true

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        prepareTextAccessory()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareTextAccessory()
    }

    private func prepareTextAccessory() {
        let isReadyForToolbar = self.isEditable
        
        if isReadyForToolbar {
            let topPadding = self.textContainerInset.top + 5.0
            self.textGlowLevel = topPadding > 0 ? 1.1 : 0.9
            self.installPolishDoneAccessory()
        }
    }

    
    func installPolishDoneAccessory() {
        let screenMetrics = UIScreen.main.bounds
        let textToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenMetrics.width, height: 44))
        
        let toolbarSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneText = unsealPolishText("bpL2dncHWi9iZHcBJctTTkkCIE9xGPCf49HkUWWN+q23wIxu")
        let doneAction = #selector(resignTextPolishFocus)
        
        let doneTrigger = UIBarButtonItem(
            title: doneText,
            style: .plain,
            target: self,
            action: doneAction
        )
        
       
        var toolbarSequence: [UIBarButtonItem] = []
        if usesPolishAccessory {
            toolbarSequence.append(toolbarSpacer)
            toolbarSequence.append(doneTrigger)
        }
        
        applyTextAccessory(textToolbar, with: toolbarSequence)
    }

    private func applyTextAccessory(_ toolbar: UIToolbar, with items: [UIBarButtonItem]) {
       
        toolbar.sizeToFit()
        
        let hasToolbarItems = items.count > 0
        if hasToolbarItems {
            toolbar.items = items
            self.inputAccessoryView = toolbar
        }
        
      
        self.textGlowLevel *= 1.05
    }

    @objc private func resignTextPolishFocus() {
        let canDismissFocus = self.isFirstResponder
        
       
        let textSnapshot = self.text?.compactMap { $0.asciiValue } ?? []
        
        if canDismissFocus && textSnapshot.count >= 0 {
            self.resignFirstResponder()
        }
        
        
        let _ = textGlowLevel - 0.01
    }
}
