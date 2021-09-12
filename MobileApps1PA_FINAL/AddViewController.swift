//
//  AddViewController.swift
//  MobileApps1PA
//
//  Created by Jordan Ogrinc on 9/11/21.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var CityText: UITextField!
    @IBOutlet weak var StateText: UITextField!
    @IBOutlet weak var Address1Text: UITextField!
    @IBOutlet weak var Address2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.child("restaurants/").observeSingleEvent(of: .value, with: {snapshot in guard let allres = snapshot.value as? [String: Any] else {
            return}
            //print("\(allres)")
            self.resnum = allres.count
            
        })
        //print("test")

        // Do any additional setup after loading the view.
    }
    public var resnum = 0
    
    @IBAction func AddBtn(_ sender: Any) {
        let ref = Database.database().reference()
        let nameInput = NameText.text;
        let cityInput = CityText.text;
        let stateInput = StateText.text;
        let addr1Input = Address1Text.text;
        let addr2Input = Address2Text.text;
        
        //we need to get the count to know what res# we are adding
        //ref.child("restaurants/res\(self.resnum)").setValue("jordan")
        ref.child("restaurants/res\(self.resnum)/name").setValue("\(NameText.text!)")
        ref.child("restaurants/res\(self.resnum)/city").setValue("\(CityText.text!)")
        ref.child("restaurants/res\(self.resnum)/state").setValue("\(StateText.text!)")
        ref.child("restaurants/res\(self.resnum)/addr1").setValue("\(Address1Text.text!)")
        ref.child("restaurants/res\(self.resnum)/addr2").setValue("\(Address2Text.text!)")
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
