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
    {"feature": "Anuncios de 90 segundos"},
    {"feature": "Anuncios no caducan"},
    {"feature": "Publicar anuncios avanzados"},
    {"feature": "Activar sistema de Pre-venta"},
    {"feature": "Activar Chat"},
    {"feature": "Crear y enviar descuentos"},
    {"feature": "Ver cestas y favoritos"},
    {"feature": "Sistema de roles y permisos"},
  ];

  final List<Map<String, dynamic>> shopPlan = [
    {"feature": "Activar sistema de Pre-venta"},
    {"feature": "Entregas en tienda física"},
    {"feature": "Política de devolución propia"},
    {"feature": "Migrar catálogo y stock en tiempo real"},
    {"feature": "Sistema de roles y permisos"},
    {"feature": "Acceso a API"},
  ];
}
