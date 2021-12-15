using System.Collections.Generic;
using Cine.Core;

namespace Cine.Core.Ado
{
    public interface IAdo
    {
        //Acciones para la entidad entrada
        void AltaPelicula(Pelicula pelicula);
        List<Pelicula> ObtenerPeliculas();

        void AltaCliente(Cliente cliente);
        List<Cliente> ObtenerClientes();
    }
}