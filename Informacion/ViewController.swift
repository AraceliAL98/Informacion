//
//  ViewController.swift
//  Informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{
    @IBOutlet weak var TVContactos: UITableView!

    var contactos : [Contacto] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         contactos.append(Contacto(nombre: "Jung Hoseok", telefono: "6442254312", direccion: "Tabasco, zona norte", correo: "jkh@hotmail.com", foto: "hoseok"))
        
        contactos.append(Contacto(nombre: "Park Jimin", telefono: "6441895278", direccion: "Tabasco, zona norte", correo: "aaa@hotmail.com", foto: "jimin"))
        
        contactos.append(Contacto(nombre: "SeokJin", telefono: "644458219", direccion: "Tamaulipas, zona norte", correo: "JH@hotmail.com", foto: "Jin"))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 178
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto")as?
        CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named:contactos[indexPath.row].foto!)
        
        celda?.lblNombre.text = contactos[indexPath.row].nombre!
        
        celda?.lblTelefono.text = contactos[indexPath.row].telefono!
            
            return celda!
            
            
        
    }
    func recargarTabla()
    {
        TVContactos.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToEditar"
        {
            let destino = segue.destination as?
            EditarContactoController
            destino?.contacto = contactos[TVContactos.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla
            
           
            
        }
    }
        
   


}

