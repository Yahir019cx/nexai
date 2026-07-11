# NEXAI
# 015 - Paquetes y Tecnologías

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir el stack tecnológico oficial del frontend de NEXAI.

Todo el desarrollo deberá respetar este documento.

No se cambiarán tecnologías únicamente por preferencia personal o tendencias.

La estabilidad del proyecto tiene prioridad.

---

# Framework Principal

Flutter (Stable)

Flutter será el único framework utilizado para desarrollar:

- Web
- Windows
- macOS
- Linux
- Android
- iOS

Todo deberá compartir la misma base de código.

---

# Lenguaje

Dart

Todo el código deberá seguir las recomendaciones oficiales del lenguaje.

---

# Gestión de Estado

Provider

Será la solución oficial para el manejo de estado.

Se prioriza por:

- Simplicidad.
- Legibilidad.
- Bajo aprendizaje.
- Excelente integración con Flutter.

No utilizar otra solución salvo aprobación.

---

# Navegación

go_router

Toda la navegación deberá implementarse mediante GoRouter.

No utilizar Navigator directamente salvo casos específicos.

---

# Consumo de APIs

Dio

Todo acceso a servicios externos deberá realizarse mediante Dio.

No utilizar HttpClient directamente.

---

# Imágenes SVG

flutter_svg

Todos los íconos e ilustraciones SVG deberán renderizarse mediante esta librería.

---

# Animaciones

flutter_animate

Será la librería principal para animaciones sencillas.

Animaciones complejas podrán implementarse manualmente cuando sea necesario.

---

# Almacenamiento Local

shared_preferences

Utilizar únicamente para configuraciones simples.

Ejemplos:

- Tema.
- Preferencias.
- Configuración visual.
- Último modelo utilizado.

---

# Selección de Archivos

file_picker

Será la librería oficial para seleccionar archivos.

---

# Imágenes Remotas

cached_network_image

Todas las imágenes remotas deberán utilizar caché.

---

# Internacionalización

intl

Cuando sea necesario.

---

# Markdown

flutter_markdown

o

markdown_widget

La decisión dependerá de cuál permita una mejor personalización visual.

---

# Librerías Futuras

Podrán incorporarse posteriormente si realmente aportan valor.

- rive
- lottie
- flutter_highlighter
- window_manager
- desktop_drop
- super_drag_and_drop

No deberán instalarse hasta ser necesarias.

---

# Librerías NO Permitidas

No utilizar:

Riverpod

Bloc

Cubit

Redux

MobX

GetX

ScopedModel

FishRedux

States Rebuilder

No aportan beneficios para el tamaño actual del proyecto.

---

# UI Kits

No utilizar:

- Material UI Kits.
- Admin Dashboards.
- Templates completos.
- Sistemas de componentes externos.

Toda la interfaz deberá desarrollarse específicamente para NEXAI.

---

# Material Design

Material Design únicamente podrá utilizarse como soporte técnico.

Nunca como identidad visual.

Los componentes visibles deberán personalizarse completamente.

---

# Dependencias Nuevas

Antes de instalar una nueva dependencia deberá justificarse:

- ¿Qué problema resuelve?
- ¿Existe una alternativa sin dependencia?
- ¿Es compatible con todas las plataformas?
- ¿Tiene mantenimiento activo?
- ¿Vale la pena agregarla?

Si la respuesta no es completamente clara, no deberá instalarse.

---

# Actualizaciones

No actualizar dependencias únicamente porque existe una nueva versión.

Actualizar únicamente cuando:

- Corrija errores.
- Mejore rendimiento.
- Agregue una funcionalidad necesaria.
- Corrija problemas de seguridad.

---

# Eliminación

Toda dependencia que deje de utilizarse deberá eliminarse.

No mantener librerías "por si algún día sirven".

---

# Filosofía

El objetivo no es tener muchas dependencias.

El objetivo es construir un producto sólido.

Mientras menos dependencias tenga NEXAI, mayor será el control sobre su evolución.

---

# Regla Final

Cada dependencia agregada aumenta la complejidad del proyecto.

Solo deberán instalarse aquellas que realmente hagan mejor a NEXAI.