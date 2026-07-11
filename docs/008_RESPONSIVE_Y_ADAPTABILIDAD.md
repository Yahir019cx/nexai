# NEXAI
# 008 - Responsive y Adaptabilidad

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Garantizar que NEXAI ofrezca una excelente experiencia de usuario en cualquier tamaño de pantalla.

La aplicación NO debe limitarse a estirar o encoger componentes.

Cada resolución debe sentirse diseñada específicamente para ese dispositivo.

---

# Filosofía

Responsive no significa:

"Hacer que todo quepa."

Responsive significa:

"Hacer que la interfaz siga siendo cómoda y elegante."

---

# Plataformas

La aplicación deberá funcionar correctamente en:

- Web
- Windows
- macOS
- Linux
- Android
- iOS

La experiencia debe sentirse nativa en cada plataforma.

---

# Diseño Adaptativo

El diseño debe adaptarse.

No escalar.

No deformarse.

No esconder información importante.

---

# Breakpoints

Los breakpoints podrán modificarse durante el desarrollo.

Referencia inicial:

```
Mobile

0 - 767 px

Tablet

768 - 1023 px

Desktop

1024 - 1439 px

Large Desktop

1440 px en adelante
```

No utilizar valores hardcodeados dentro de las pantallas.

---

# Desktop

Desktop será la experiencia principal.

La aplicación está diseñada primero para escritorio.

Características:

- Sidebar fija.
- Amplio espacio visual.
- Paneles simultáneos.
- Mayor separación entre componentes.
- Mejor aprovechamiento del ancho.

---

# Web

La versión Web deberá sentirse como una aplicación de escritorio.

No como un sitio web tradicional.

Evitar:

- Diseño tipo landing.
- Márgenes excesivos.
- Componentes gigantes.

---

# Tablet

La Tablet debe mantener prácticamente la misma experiencia que Desktop.

Cambios permitidos:

- Sidebar colapsable.
- Panel derecho oculto.
- Menor separación.

La navegación debe seguir siendo cómoda.

---

# Mobile

La experiencia cambia.

No se trata de reducir Desktop.

Se reorganiza.

Ejemplo:

Desktop

```
Sidebar | Chat | Panel Derecho
```

Mobile

```
Chat

↓

Sidebar deslizable

↓

Paneles mediante overlays
```

---

# Sidebar

Desktop

Siempre visible.

Tablet

Colapsable.

Mobile

Panel deslizable.

Nunca ocupar toda la pantalla.

---

# Panel Derecho

Desktop

Visible cuando sea necesario.

Tablet

Opcional.

Mobile

Modal o Bottom Sheet.

---

# Márgenes

El contenido nunca debe tocar los bordes de la pantalla.

Siempre deberá existir espacio de respiración.

---

# Anchura del Chat

Las conversaciones nunca deberán ocupar el 100% del ancho en pantallas grandes.

Debe existir un ancho máximo para mantener una lectura cómoda.

---

# Texto

El tamaño de la tipografía deberá mantenerse consistente.

Evitar textos gigantes únicamente porque la pantalla sea más grande.

---

# Componentes

Los componentes deberán adaptarse.

Nunca deformarse.

Ejemplo:

Botón

Puede aumentar ligeramente su tamaño.

No debe convertirse en un botón enorme.

---

# Diálogos

Desktop

Ventana centrada.

Tablet

Ventana adaptada.

Mobile

Bottom Sheet o pantalla completa según el contexto.

---

# Scroll

Cada sección controla su propio desplazamiento.

Ejemplo:

Sidebar

↓

Scroll independiente.

Chat

↓

Scroll independiente.

Panel Derecho

↓

Scroll independiente.

---

# Espacio Visual

Mientras mayor sea la pantalla,

mayor deberá ser el espacio entre componentes.

Nunca llenar espacios vacíos únicamente porque existen.

---

# Reorganización

El contenido deberá reorganizarse.

No reducirse.

Ejemplo:

Desktop

```
[A] [B] [C]
```

Tablet

```
[A]
[B] [C]
```

Mobile

```
[A]

[B]

[C]
```

---

# Imágenes

Las imágenes deberán adaptarse.

Nunca deformarse.

Siempre conservar su proporción.

---

# Animaciones

Las animaciones deberán mantenerse consistentes en todas las plataformas.

No eliminar animaciones únicamente por cambiar de dispositivo.

---

# Interacción

Desktop

Prioridad al mouse.

Tablet

Mouse y táctil.

Mobile

Táctil.

Los componentes deberán responder correctamente a cada tipo de interacción.

---

# Futuro

Toda nueva pantalla deberá diseñarse pensando desde el inicio en:

- Desktop.
- Tablet.
- Mobile.

Nunca desarrollar únicamente para una plataforma.

---

# Regla Final

Responsive no consiste en hacer que todo funcione.

Consiste en lograr que el usuario sienta que la aplicación fue diseñada específicamente para el dispositivo que está utilizando.