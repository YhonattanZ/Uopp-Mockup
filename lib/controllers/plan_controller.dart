import 'package:get/get.dart';

class PlanController extends GetxController {
  // Lista de características de los planes
  final List<Map<String, dynamic>> features = [
    {
      "name": "Sistema de reseñas",
      "basic": true,
      "plus": true,
      "business": true,
    },
    {"name": "Puntos Uopp", "basic": true, "plus": true, "business": true},
    {
      "name": "Anuncios de tiempo mayor",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Ver cestas abandonadas",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Anuncios no caducan",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Anuncios Avanzados",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {"name": "Sistema de chat", "basic": false, "plus": true, "business": true},
    {
      "name": "Sistema de descuento",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Aceptar pedidos automáticos",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Sistema de roles y permisos",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {
      "name": "Condiciones de venta personalizada",
      "basic": false,
      "plus": true,
      "business": true,
    },
    {"name": "Notas privadas", "basic": false, "plus": true, "business": true},
    {
      "name": "Recogida en tienda",
      "basic": false,
      "plus": false,
      "business": true,
    }, // Solo business
  ];
  final List<Map<String, dynamic>> plusPlan = [
    {"name": "Anuncios de 90 segundos"},
    {"name": "Anuncios no caducan"},
    {"name": "Publicar anuncios avanzados"},
    {"name": "Activar sistema de Pre-venta"},
    {"name": "Activar Chat"},
    {"name": "Crear y enviar descuentos"},
    {"name": "Ver cestas y favoritos"},
    {"name": "Sistema de roles y permisos"},
  ];

  final List<Map<String, dynamic>> shopPlan = [
    {"name": "Activar sistema de Pre-venta"},
    {"name": "Entregas en tienda física"},
    {"name": "Política de devolución propia"},
    {"name": "Migrar catálogo y stock en tiempo real"},
    {"name": "Sistema de roles y permisos"},
    {"name": "Acceso a API"},
  ];
}
