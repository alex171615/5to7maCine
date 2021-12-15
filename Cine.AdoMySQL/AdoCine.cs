using System;
using System.Collections.Generic;
using et12.edu.ar.AGBD.Ado;

namespace Cine.AdoMySQL
{
    public class AdoCine
    {
        public AdoAGBD Ado { get; set; }
        public MapCliente MapCliente { get; set; }
        public MapPelicula MapPelicula { get; set; }
        public AdoCine(AdoAGBD ado)
        {
            Ado = ado;
            MapCliente = new MapCliente(Ado);
            MapPelicula = new MapPelicula(MapPelicula);
        }
        public void AltaCliente(Cliente cliente) => MapCliente.AltaCliente(cliente);
        public List<Cliente> ObtenerClientes() => MapCliente.ObtenerClientes();

        public void AltaEntrada(Pelicula pelicula) => MapPelicula.AltaPelicula(pelicula);
        public List<pelicula> obtenerEntradas() => MapPelicula.ObtenerPeliculas();

        
        

    }
}
