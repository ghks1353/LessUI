//
//  ViewController.swift
//  LessUI
//
//  Created by ghks1353 on 04/08/2019.
//  Copyright (c) 2019 ghks1353. All rights reserved.
//

import LessUI
import UIKit

class ViewController: UIViewController {
    private let container: UIView = UIView()

    private let welcomeLabel: UILabel = UILabel()
    private let welcomeButton: UIButton = UIButton()

    private let goSecondButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Add a label to container view, and assign style
        welcomeLabel.add(to: container)
            .style(size: 24,
                   color: 0x333333.c,
                   bold: true,
                   align: .center,
                   lines: 0).text = "Welcome!"

        // Add a button to container view, and assign style
        welcomeButton.add(to: container)
            .style(color: 0x1C72FF.c,
                   touch: 0x7AADFF.c,
                   disabled: 0xCCCCCC.c,
                   title: "Touch me :)")
            .regist(to: self, act: #selector(btnHandler), for: .touchUpInside)

        // Add container view to ViewController's view
        container.add(to: view)
        
        // Otherwise, you can...

        // container.add(welcomeLabel, welcomeButton)
        // or
        // container.add([welcomeLabel, welcomeButton])
        // and then...
        // add(container)

        // Place a button bottom of screen, consider safearea.
        goSecondButton.add(to: view)
            .style(color: 0xFFFFFF.c,
                   disabled: 0x666666.c,
                   background: 0x333333.c,
                   title: "Go to second view",
                   titleInset: insBottom)
    }

    /// Layout subviews
    override func viewWillLayoutSubviews() {
        // Auto-resize label will fit itself
        welcomeLabel.prefix()

        // Also resize button and will fit itself automatically
        // And, set yPos to first label's max pos and add some margin
        welcomeButton.prefix().after(welcomeLabel, y: 4)

        // Otherwise you can:
        // welcomeButton.prefix().set(y: welcomeLabel.mxY).add(y: 4)

        // If you consider best performance, write like this:
        // welcomeButton.prefix().set(welcomeLabel.mxY + 4)

        // Automatically align subviews to center, and resize container to fit
        // And align vertical/horizional to center.
        container.subCenter().fit().vhCenter()

        // Place a button bottom of screen
        goSecondButton.after(view, y: 0).set(w: w, h: (48 + bottom) * -1).inset(bottom: bottom)
    }

    /// Example of Button touch action handler
    @objc private func btnHandler(target _: UIButton) {
        // Show default iOS AlertController with yes/no button
        dialog(title: "Welcome to LessUI swift :>",
               message: "This is a simple example for LessUI!",
               
               negative: "Dismiss",
               positive: "OK",
               
               onPositive: positiveHandler)
    }

    /// Dialog positive handler
    private func positiveHandler(target _: UIAlertAction) {
        // Show default iOS AlertController with styled action sheet.
        actions(title: "LessUI simple actions",
                message: "Yay! simple sheet!",
                actions: ["Cute normal title",
                          "Cool cancel title",
                          "Bad destructive title"],
                styles: ["Bad destructive title": .destructive]) { _, _, index in
            if index == 2 {
                // Show simple title and OK dialog
                self.dialog(title: "Nice! you selected the destructive title :>", positive: "OK")
            }
        }
    }
}
