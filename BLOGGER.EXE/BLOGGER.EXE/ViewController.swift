//
//  ViewController.swift
//  BLOGGER.EXE
//
//  Created by Yunus Emre Bayezit on 18.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var text = ["Ay'a aslında gidilmediği iddiası, Apollo Projesi ile insanoğlunun Ay'a gidilmediğini, aslında tüm projenin bir aldatmacadan ibaret olduğu iddialarıdır. Kamuoyunda önemli miktarda taraftar toplamıştır. Bu iddialar, tarihçiler ve uzay araştırmaları camiasınca kabul edilmemektedir", "Yağmur oluşumu, suyun buharlaşarak gökyüzüne doğru yoğunlaşması ile meydana gelmektedir. Gökyüzünde yoğuşan su buharı bir araya gelerek su damlacıklarını oluşturmaktadır. Su damlacıkları yoğuşmanın etkisi ile bir araya gelir ve yağmuru oluşturur. Damlaların yeryüzüne inmesi ile yağmur yağmaktadır.","Fukuşima I Nükleer Santrali kazası 9.0 büyüklüğündeki 11 Mart 2011 Tōhoku depremi ve tsunamisi sonrasında meydana geldi. Honşu adası açıklarında meydana gelen bu deprem, Japonya'da büyük bir tsunamiye yol açtı. Tsunami nükleer santraldeki üç etkin reaktörün kapatılmasına sebep oldu."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BLOGGER.EXE"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("BE") {
                self.pictures.append(item)
            }
        }
        
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedRow = String(indexPath.row+1)
            vc.selectedText = text[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
