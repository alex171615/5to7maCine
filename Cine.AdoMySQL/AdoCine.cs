using System;
using System.Collections.Generic;
using et12.edu.ar.AGBD.Ado;

namespace Cine.AdoMySQL
{
    public class AdoCine
    {
        public AdoAGBD Ado { get; set; }
        public MapCliente MapCliente { get; set; }
        public MapEntrada MapEntrada { get; set; }
        public AdoCine(AdoAGBD ado)
        {
            Ado = ado;
            MapCliente = new MapCliente(Ado);
            MapEntrada = new MapEntrada(MapCliente);
        }
        public void AltaCliente(Cliente cliente) => MapCliente.AltaCliente(cliente);
        public List<Cliente> ObtenerClientes() => MapCliente.ObtenerClientes();

        public void AltaEntrada(Entrada entrada) => MapEntrada.AltaEntrada(entrada);
        public List<Entrada> obtenerEntradas() => MapEntrada.obtenerEntradas();

        var adoAGBD = FactoryAdoAGBD.GetAdoMySQL("appSettings.json", "test");
        

    }
}
