//
//  ViewController.swift
//  FileApplication
//
//  Created by Gamze Akyüz on 13.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okuButton(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do {
                textField.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)

                
                
            }catch {
                print("Dosya okurken hata oluştu")
            }
            
        }
    }
    @IBAction func yazButton(_ sender: Any) {
        
        let mesaj:String = textField.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            do {
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                
                textField.text = ""
                
            }catch {
                print("Dosya yazılırken hata oluştu")
            }
            
        }
        
    }
    @IBAction func silButton(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do {
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textField.text = ""
                    
                }catch {
                    print("Dosya okurken hata oluştu")
                }
            }
            
            
            
        }
    }
    @IBAction func resmiGosterButton(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("rocket.png")
            
            self.imageView.image = UIImage(contentsOfFile: dosyaYolu.path)
            
        }
    }
    @IBAction func resmiKaydetButton(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("rocket.png")
            let resim = UIImage(named: "rocket")
            
            do {
                try resim!.pngData()?.write(to: dosyaYolu)
            }
            catch{
                print("Resim yazılırken hata oluştu.")
            }
        }
        
    }
    @IBAction func resmiSilButton(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent("rocket.png")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do {
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                    
                }catch {
                    print("Resim silinirken hata oluştu")
                }
            }

        }
    }

}

