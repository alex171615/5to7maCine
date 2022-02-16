using Cine.Core;
using System;
using et12.edu.ar.MenuesConsola;

namespace Admin.Consola.Menu
{
    public class MenuAltaCliente : MenuComponente
    {
        public Cliente cliente { get; set; }
        public override void mostrar()
        {
            base.mostrar();

            var nombre = prompt("Ingrese Nombre cliente");
            var descripcion = prompt("Ingrese Descripcion Habilidad");

            Habilidad = new Habilidad()
            {
                Nombre = nombre,
                Descripcion = descripcion
            };

            try
            {
                Program.Ado.AltaHabiliadad(Habilidad);
                Console.WriteLine("Habilidad dada de alta con exito");
            }
            catch (Exception e)
            {
                Console.WriteLine($"No se pudo dar de alta: {e.Message}");
            }
            Console.ReadKey();
        }
    }
}