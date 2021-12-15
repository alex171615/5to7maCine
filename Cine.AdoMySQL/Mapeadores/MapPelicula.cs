using et12.edu.ar.AGBD.Mapeadores;
using et12.edu.ar.AGBD.Ado;
using System;
using System.Data;
using System.Collections.Generic;

namespace Cine.AdoMySQL.Mapeadores
{
    public class MapPelicula: Mapeador<Pelicula>
    {
     public MapPelicula(AdoAGBD ado):base(ado)
        {
            Tabla = "Pelicula";
        }
        public override Pelicula ObjetoDesdeFila(DataRow fila)
            => new Pelicula()
            {
                Id = Convert.ToByte(fila["idPelicula"]),
                Nombre = fila["pelicula"].ToString()
            };

        public void AltaRubro(Pelicula pelicula)
            => EjecutarComandoCon("altaPelicula", ConfigurarAltaPelicula, PostAltaPelicula, pelicula);

        public void ConfigurarAltaRubro(Pelicula pelicula)
        {
            SetComandoSP("altaPelicula");

            BP.CrearParametroSalida("unIdPelicula")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.UByte)
              .AgregarParametro();

            BP.CrearParametro("unPelicula")
              .SetTipoVarchar(45)
              .SetValor(pelicula.Nombre)
              .AgregarParametro();
        }

        public void PostAltaRubro(Pelicula pelicula)
        {
            var paramIdPelicula = GetParametro("unIdPelicula");
            Pelicula.Id = Convert.ToByte(paramIdPelicula.Value);
        }

        public Pelicula ClientePorId(byte id)
        {
            SetComandoSP("PeliculaPorId");

            BP.CrearParametro("unIdPelicula")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.Byte)
              .SetValor(id)
              .AgregarParametro();

            return ElementoDesdeSP();
        }

        public List<Pelicula> ObtenerPeliculas() => ColeccionDesdeTabla();
    }
}