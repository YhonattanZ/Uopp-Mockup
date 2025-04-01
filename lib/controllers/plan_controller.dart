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

  //Subscripcion
  final List<Map<String, dynamic>> plans = [
    {
      "days": 60,
      "description": "Hasta 60 anuncios activos al mismo tiempo",
      "share": "Publica en Productos y en Moda y complementos",
    },
    {
      "days": 120,
      "description": "Hasta 120 anuncios activos al mismo tiempo",
      "share": "Publica en Productos y en Moda y complementos",
    },
    {
      "days": 200,
      "description": "Hasta 200 anuncios activos al mismo tiempo",
      "share": "Publica en Productos y en Moda y complementos",
    },
  ];

  final List<Map<String, String>> dates = [
    {"title": "Hoy", "date": "Primer mes"},
    {"title": "01 May 2025", "date": "Segundo mes"},
    {"title": "01 Jun 2025", "date": "Tercer mes"},
    {"title": "01 Jul 2025", "date": "Cada 30 días"},
  ];

  var selectedPlanIndex = (-1).obs;

  void selectPlan(int index) {
    selectedPlanIndex.value = index;
  }
}
