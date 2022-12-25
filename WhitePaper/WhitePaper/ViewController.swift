//
//  ViewController.swift
//  WhitePaper
//
//  Created by Yunus Emre Bayezit on 25.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var websites = ["www.ntv.com.tr/galeri/dunya/kuresel-isinma-yeni-hayvan-turleri-ortaya-cikardi,HENP_RyknEqb8msE09HzBA","www.webtekno.com/ay-astronomi-gokyuzu-h126269.html","www.donanimhaber.com/microsoft-yanlislikla-windows-12-arayuzunu-gosterdi--158536","shiftdelete.net/rolls-roycea-amerikali-rakip-geliyor"]
    
    var baslik = ["Küresel Isınma Yeni Hayvan Türlerini Ortaya Çıkardı","Ay Yüzeyinde Gördüğümüz Büyük Kara Lekeler Aslında Ne?","Microsoft yanlışlıkla Windows 12 arayüzünü gösterdi","Rolls-Royce’a Amerikalı rakip geliyor!"]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WhitePaperNews"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath)
        cell.textLabel?.text = baslik[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedNews = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

