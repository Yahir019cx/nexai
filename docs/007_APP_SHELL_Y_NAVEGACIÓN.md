# NEXAI
# 007 - App Shell y Navegación

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir la estructura principal de la aplicación.

Todas las pantallas deberán construirse dentro del mismo App Shell.

La navegación deberá sentirse continua.

El usuario nunca deberá sentir que cambia completamente de aplicación.

---

# Filosofía

La navegación debe ser:

- Natural.
- Fluida.
- Intuitiva.
- Rápida.
- Consistente.

Nunca debe romper la experiencia.

---

# ¿Qué es el App Shell?

El App Shell es la estructura permanente de la aplicación.

Contiene los elementos que permanecen visibles mientras el usuario navega.

Ejemplo:

```

┌──────────────────────────────────────────────────────────────┐

│ Sidebar │                Contenido Principal                │

│ │ │

│ │ │

│ │ │

│ │ │

│ │ │

└──────────────────────────────────────────────────────────────┘

```

El contenido cambia.

La estructura permanece.

---

# Elementos del App Shell

El App Shell podrá contener:

- Sidebar.
- Área principal.
- Panel derecho (opcional).
- Diálogos.
- Menús flotantes.
- Notificaciones.
- Overlay de carga.

---

# Sidebar

La Sidebar es permanente en Desktop.

Debe contener únicamente:

- Logo.
- Nuevo chat.
- Conversaciones.
- Buscar.
- Configuración.
- Perfil.
- Cerrar sesión.

No agregar elementos innecesarios.

---

# Logo

El logo siempre permanecerá visible.

Debe funcionar como identidad del producto.

Nunca debe sentirse como un botón decorativo.

---

# Nuevo Chat

Debe ser el botón principal de la Sidebar.

Debe destacar visualmente.

Sin romper la armonía del diseño.

---

# Historial

Las conversaciones deberán ocupar la mayor parte de la Sidebar.

Deben desplazarse independientemente del contenido principal.

---

# Perfil

La parte inferior contendrá:

- Avatar.
- Nombre.
- Configuración.
- Cerrar sesión.

Debe permanecer fija.

---

# Área Principal

Es el espacio más importante.

Debe adaptarse a cualquier módulo.

Ejemplos:

- Chat.
- Configuración.
- Agentes.
- Modelos.
- Archivos.

Nunca deberá asumir un tipo de contenido específico.

---

# Panel Derecho

El App Shell deberá permitir agregar un panel derecho.

Ejemplos futuros:

- Información.
- Archivos.
- Historial.
- Configuración contextual.
- Herramientas.

Debe poder ocultarse completamente.

---

# Navegación

Las transiciones entre pantallas deberán ser suaves.

Nunca utilizar cambios bruscos.

No mostrar pantallas completamente en blanco durante la navegación.

---

# Breadcrumbs

No utilizar breadcrumbs tradicionales.

La navegación debe ser suficientemente clara sin depender de ellos.

---

# Responsive

## Desktop

Sidebar fija.

Máximo espacio para contenido.

---

## Tablet

Sidebar colapsable.

Contenido adaptable.

---

## Mobile

Sidebar mediante panel lateral.

El contenido ocupa toda la pantalla.

---

# Cambio de Tamaño

Cuando la ventana cambie de tamaño:

La interfaz deberá reorganizarse.

Nunca deformarse.

Nunca romperse.

---

# Scroll

Cada zona deberá controlar su propio scroll.

Ejemplo:

Sidebar

↓

Scroll independiente.

Contenido

↓

Scroll independiente.

Esto mejora la experiencia.

---

# Diálogos

Todos los diálogos deberán abrirse sobre el App Shell.

Nunca reemplazar completamente la pantalla.

---

# Notificaciones

Las notificaciones deberán aparecer flotando.

Nunca bloquear el flujo del usuario.

---

# Overlay

Cuando exista una operación global importante podrá mostrarse un overlay.

Debe oscurecer ligeramente el fondo.

Nunca bloquear más tiempo del necesario.

---

# Navegación Futura

El App Shell deberá permitir agregar nuevos módulos sin modificar su estructura.

Ejemplo:

- Chat.
- Agentes.
- Modelos.
- Automatizaciones.
- Marketplace.
- Documentos.
- Configuración.

Todos deberán integrarse de forma natural.

---

# Consistencia

Todas las pantallas deben sentirse parte del mismo producto.

No deberán existir cambios drásticos entre módulos.

El usuario nunca deberá pensar que entró a otra aplicación.

---

# Principio Final

El App Shell es la base de NEXAI.

Todas las funcionalidades futuras deberán integrarse dentro de él sin alterar la experiencia general.

La navegación debe ser invisible.

El usuario debe concentrarse en su trabajo, no en aprender cómo funciona la interfaz.