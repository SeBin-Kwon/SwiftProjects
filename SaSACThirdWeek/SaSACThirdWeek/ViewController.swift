//
//  ViewController.swift
//  SaSACThirdWeek
//
//  Created by Sebin Kwon on 1/8/25.
//

import UIKit
import MapKit

struct User {
    let name: String
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var mapView: MKMapView!
    
    let pickerView = UIPickerView()
    
    let color: [UIColor] = [.init(.blue)]
    let user: [User] = [
        User(name: "a"),
        User(name: "b")
    ]
    
    let person: [User] = [
        .init(name: "a"),
        .init(name: "b")
    ]
    
    let list = ["가", "나", "다"]
    let array = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondTextField.tintColor = .red
        secondTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
        userTextField.delegate = self
        mapView.delegate = self
        configureMapView()
    }
}

// MARK: 뷰객체 설정
extension ViewController {
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "야호야호"
        mapView.addAnnotation(annotation)
    }
}

// MARK: TextField 설정
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            return view.endEditing(true)
        }
        return false
    }
}

// MARK: PickerView 설정
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            secondTextField.text = list[row]
        } else {
            secondTextField.text = array[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? list[row] : array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? list.count : array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
}
