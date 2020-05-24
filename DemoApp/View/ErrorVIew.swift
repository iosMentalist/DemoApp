//
//  ErrorVIew.swift
//  Litourgia
//
//  Created by Shady Kahaleh on 5/15/20.
//  Copyright © 2020 Shady Kahaleh. All rights reserved.
//

import UIKit

class ErrorView  {
    private let padding : CGFloat = 10
    private var view : UIView?
    private var label : UILabel?
    private var message : String {
        get{self.label?.text ?? ""}//FIXME: shady
        set{self.setMessageAndAnimate(newValue)}
    }

    init(inView:UIView){
        self.view = setupView()
        self.label = setupLabel()
        if let view = self.view , let label = self.label {
            inView.addSubview(view)
            view.addSubview(label)
            addConstraintsTo(view:view,parent:inView)
            addContraintsTo(label:label,parent:view)
        }
    }

    func setMessageAndAnimate(_ message : String){
        label?.text = "message"
        animateView(show: true)
    }

    private func animateView(show:Bool){

        UIView.animate(withDuration: 0.5) {
            self.view!.alpha = show ?  1 : 0
        }

    }

    @objc func viewTapped(){
        animateView(show: false)
    }

    private func setupView() -> UIView{
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 238/255, green: 100/255, blue: 90/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        return view
    }

    private func setupLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.arabicBold(withSize:.small)
        lbl.isUserInteractionEnabled = true
        lbl.textAlignment = .center
        lbl.backgroundColor = .clear
        lbl.textColor = UIColor.init(displayP3Red: 150/255, green: 30/255, blue: 22/255, alpha: 1)
        return lbl
    }

    private func addConstraintsTo(view:UIView, parent:UIView){
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: parent.leadingAnchor,constant: 0),
            view.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor,constant: 0),
            view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0),
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: 1)
        ])
    }

    private func addContraintsTo(label:UIView, parent:UIView){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: padding),
            label.topAnchor.constraint(equalTo: parent.topAnchor, constant: padding),
            label.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding),
            label.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -padding),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])

    }
}
