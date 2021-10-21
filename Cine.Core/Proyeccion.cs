using System;

namespace Cine.Core
{
    public class Proyeccion
    {
        public int id { get; set; }
        public DateTime fechaHora;

        Pelicula idPelicula;
        Sala idSala;        
        Cliente idCliente;
    }
}
