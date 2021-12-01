using System.Collections.Generic;
using Cine.Core;

namespace Cine.Core.Ado
{
    public interface IAdo
    {
        //Acciones para la entidad entrada
        void AltaEntrada(Entrada entrada);
        List<Entrada> ObtenerRubros();

        void AltaCliente(Cliente cliente);
        List<Cliente> ObtenerProductos();
    }
}