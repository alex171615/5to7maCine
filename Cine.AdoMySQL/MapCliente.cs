using et12.edu.ar.AGBD.Mapeadores;
using et12.edu.ar.AGBD.Ado;
using System;
using System.Data;
using System.Collections.Generic;

namespace Cine.AdoMySQL.Mapeadores
{
    public class MapCliente: Mapeador<Cliente>
    {
     public MapRubro(AdoAGBD ado):base(ado)
        {
            Tabla = "Cliente";
        }
        public override Rubro ObjetoDesdeFila(DataRow fila)
            => new Rubro()
            {
                Id = Convert.ToByte(fila["idCliente"]),
                Nombre = fila["cliente"].ToString()
            };

        public void AltaRubro(Cliente cliente)
            => EjecutarComandoCon("altaCliente", ConfigurarAltaCliente, PostAltaCliente, cliente);

        public void ConfigurarAltaRubro(Cliente cliente)
        {
            SetComandoSP("altaCliente");

            BP.CrearParametroSalida("unIdCliente")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.UByte)
              .AgregarParametro();

            BP.CrearParametro("unCliente")
              .SetTipoVarchar(45)
              .SetValor(cliente.Nombre)
              .AgregarParametro();
        }

        public void PostAltaRubro(Cliente cliente)
        {
            var paramIdCliente = GetParametro("unIdCliente");
            cliente.Id = Convert.ToByte(paramIdCliente.Value);
        }

        public Cliente ClientePorId(byte id)
        {
            SetComandoSP("ClientePorId");

            BP.CrearParametro("unIdCliente")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.Byte)
              .SetValor(id)
              .AgregarParametro();

            return ElementoDesdeSP();
        }

        public List<Cliente> ObtenerClientes() => ColeccionDesdeTabla();
    }
}