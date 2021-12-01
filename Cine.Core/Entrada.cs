namespace Cine.Core
{
    public class Entrada
    {
        public int id { get; set; }
        public decimal valor { get; set; }
        public string email { get; set; }
        public int butaca { get; set; }
        Proyeccion idProyeccion { get; set; }
        Cliente idCliente { get; set; }
    }
}