class MantenimientoModel {
  late String nombre;
  late String responsable;
  late String fechaInicio;
  late String fechaFin;
  late StatusMantenimientos estado;
  late String url;
}

enum StatusMantenimientos {
  pendiente,
  finalizado,
  enProceso,
}
