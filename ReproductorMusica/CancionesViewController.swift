//
//  CancionesViewController.swift
//  ReproductorMusica
//
//  Created by Victor Ernesto Velasco Esquivel on 30/07/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import UIKit

class CancionesViewController: UITableViewController {

    var lstCanciones : Array<cancion> = Array<cancion>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        cargaInicial()
        
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "suffle", style: UIBarButtonItemStyle.plain, target: self, action: "Aleatorio")
        
    }
    
    func Aleatorio()
    {
        //Cancion aleatoria
        let total : Int = lstCanciones.count - 1
        
        let num : Int = Int(arc4random_uniform(UInt32(total)))
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "reproductorView") as! ReproductorViewController
        resultViewController.itemDetalle=self.lstCanciones[num]
        self.navigationController?.pushViewController(resultViewController, animated: true)
        
        //self.navigationController?.pushViewController(cc, animated: true)
        //presentedViewController(cc, animated : true, completation : nil)
        
        //performSegue(withIdentifier: "reproductorView", sender: nil)
    }
    
    func cargaInicial()
    {
        let uno : cancion = cancion(_titulo: "Aprovechate", _portada: "cafeTacvba", _extensionPortada: "jpeg", _autor: "Cafe Tacvba", _nombreCancion : "Aprovechate", _extensionCancion : "mp3")
        
        let dos : cancion = cancion(_titulo: "Animal Instinct", _portada: "The Cranberries", _extensionPortada: "jpg", _autor: "The Cranberries", _nombreCancion : "AnimalInstinct", _extensionCancion : "mp3")
        
        let tres : cancion = cancion(_titulo: "Apuesta por el Rocanrol", _portada: "bunbury", _extensionPortada: "jpeg", _autor: "Enrique Bunbury", _nombreCancion : "ApuestaporelRocanrol", _extensionCancion : "mp3")
        
        let cuatro : cancion = cancion(_titulo: "Every You Every", _portada: "placebo", _extensionPortada: "jpeg", _autor: "Placebo", _nombreCancion : "EveryYouEvery", _extensionCancion : "m4a")
        
        let cinco : cancion = cancion(_titulo: "Sweet Child", _portada: "guns", _extensionPortada: "jpeg", _autor: "Guns n´ roses", _nombreCancion : "SweetChild", _extensionCancion : "mp3")
        
        lstCanciones.append(uno)
        lstCanciones.append(dos)
        lstCanciones.append(tres)
        lstCanciones.append(cuatro)
        lstCanciones.append(cinco)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lstCanciones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = lstCanciones[indexPath.row].Titulo;
        cell.detailTextLabel?.text = lstCanciones[indexPath.row].Autor;
        /*var completo : String = lstCanciones[indexPath.row].Portada+"."+lstCanciones[indexPath.row].ExtensionPortada
        
        let imagen : UIImage = UIImage(named: completo)!
        if (imagen == nil)
        {
            print("No encontro")
        }*/
       cell.imageView?.image = UIImage(named: lstCanciones[indexPath.row].Portada+"."+lstCanciones[indexPath.row].ExtensionPortada)
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cc = segue.destination as! ReproductorViewController
        
        let item = self.tableView.indexPathForSelectedRow
        
        cc.itemDetalle = self.lstCanciones[(item?.row)!]
    }
 

}
