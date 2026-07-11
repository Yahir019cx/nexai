# NEXAI
# 012 - Dependencias y Librerías

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir las reglas para agregar nuevas dependencias al proyecto.

Cada paquete externo incrementa la complejidad del proyecto.

Por esa razón, únicamente se instalarán dependencias que aporten un beneficio real.

---

# Filosofía

Menos paquetes.

Más control.

Más rendimiento.

Más estabilidad.

Antes de instalar una librería siempre deberá responderse la siguiente pregunta:

> ¿Realmente la necesitamos?

Si Flutter ya ofrece una solución adecuada, deberá preferirse esa solución.

---

# Regla General

No instalar paquetes únicamente porque "ahorran código".

Toda dependencia debe resolver un problema importante.

---

# Antes de instalar una librería

Responder las siguientes preguntas.

- ¿Flutter ya resuelve este problema?
- ¿La dependencia sigue teniendo mantenimiento?
- ¿Tiene buena documentación?
- ¿Tiene buena comunidad?
- ¿Es compatible con Web?
- ¿Es compatible con Desktop?
- ¿Es compatible con Mobile?
- ¿Tiene demasiadas dependencias internas?
- ¿Vale la pena agregarla?

Si alguna respuesta genera dudas, no instalarla.

---

# Dependencias Permitidas

Las siguientes librerías están aprobadas para utilizarse en el proyecto.

## Navegación

go_router

---

## Consumo de APIs

dio

---

## SVG

flutter_svg

---

## Animaciones

flutter_animate

---

## Estado

provider

Si en el futuro el proyecto requiere mayor complejidad se evaluará otra solución.

---

## Almacenamiento Local

shared_preferences

---

## Utilidades

intl

---

## Selección de archivos

file_picker

---

## Imágenes

cached_network_image

---

## Markdown

flutter_markdown

o

markdown_widget

La elección dependerá de cuál ofrezca una mejor experiencia visual.

---

# Dependencias Futuras

Estas librerías podrán evaluarse posteriormente.

- rive
- lottie
- super_drag_and_drop
- window_manager
- desktop_drop
- flutter_highlighter

No deberán instalarse hasta ser necesarias.

---

# Dependencias Prohibidas

Evitar instalar paquetes para resolver problemas simples.

Ejemplos.

No instalar paquetes únicamente para:

- Espaciado.
- Sombras.
- Bordes.
- Botones.
- Cards.
- AppBars.
- Inputs.
- Helpers pequeños.

Estos componentes deberán desarrollarse dentro del proyecto.

---

# Material Design

No instalar paquetes que dependan completamente de Material Design.

La identidad visual pertenece a NEXAI.

No a Flutter.

---

# UI Kits

No utilizar UI Kits completos.

Ejemplos.

No utilizar:

- Kits de Admin Dashboard.
- Kits de Material.
- Kits de Bootstrap adaptados.
- Templates completos.

Todos los componentes deberán desarrollarse dentro del proyecto.

---

# Actualizaciones

Actualizar dependencias únicamente cuando exista una razón válida.

No actualizar versiones únicamente porque existe una más reciente.

---

# Eliminación

Toda dependencia que deje de utilizarse deberá eliminarse.

No mantener paquetes "por si algún día sirven".

---

# Organización

Las dependencias deberán agruparse correctamente dentro del pubspec.yaml.

Mantener el archivo limpio y ordenado.

---

# Nuevas Dependencias

Antes de agregar una nueva dependencia deberá documentarse:

- Nombre.
- Propósito.
- Beneficio.
- Alternativas evaluadas.

Esto facilitará el mantenimiento futuro.

---

# Regla Final

Toda dependencia agrega complejidad al proyecto.

La mejor dependencia es aquella que nunca fue necesaria instalar.