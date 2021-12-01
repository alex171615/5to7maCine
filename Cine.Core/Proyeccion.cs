using System;

namespace Cine.Core
{
    public class Proyeccion
    {
        public int id { get; set; }
        public DateTime fechaHora { get; set; }

        Pelicula idPelicula { get; set; }
        Sala idSala { get; set; }        
        Cliente idCliente { get; set; }
    }
}
