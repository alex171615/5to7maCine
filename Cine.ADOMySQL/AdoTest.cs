using System;
using System.Collections.Generic;
using et12.edu.ar.AGBD.Ado;

namespace AGBD.Test
{
    public class AdoTest
    {
        public AdoAGBD Ado { get; set; }
        public MapCliente MapCliente { get; set; }
        public MapEntrada MapEntrada { get; set; }
        public AdoTest(AdoAGBD ado)
        {
            Ado = ado;
            MapCliente = new MapCliente(Ado);
            MapEntrada = new MapEntrada(MapCliente);
        }
        public void AltaCliente(Cliente cliente) => MapCliente.AltaCliente(cliente);
        public List<Cliente> ObtenerClientes() => MapCliente.ObtenerClientes();
        public List<Entrada> obtenerEntradas() => MapEntrada.obtenerEntradas();
        public List<Entrada> obtenerEntradas(Cliente cliente)
            => MapProducto.obtenerEntradas(cliente);
        public void AltaEntrada(Entrada entrada) => MapEntrada.AltaEntrada(entrada);

    }
}
