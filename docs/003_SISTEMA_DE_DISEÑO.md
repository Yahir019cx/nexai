# NEXAI
# 003 - Sistema de Diseño

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir el lenguaje visual de NEXAI.

Todo componente, pantalla, animación y elemento gráfico deberá seguir estas reglas.

El objetivo es que toda la aplicación se sienta como un único producto.

Nunca como un conjunto de pantallas diferentes.

---

# Filosofía

El diseño debe transmitir:

- Modernidad
- Elegancia
- Tecnología
- Simplicidad
- Precisión
- Fluidez

La interfaz debe impresionar por su calidad, no por la cantidad de elementos.

---

# Identidad

NEXAI no utiliza Material Design como identidad visual.

Flutter únicamente renderiza la aplicación.

Toda la identidad pertenece a NEXAI.

---

# Estilo General

La interfaz debe sentirse:

- Minimalista
- Premium
- Oscura
- Tecnológica
- Limpia
- Profesional

Evitar interfaces cargadas.

Evitar elementos innecesarios.

Menos es más.

---

# Paleta Oficial

## Fondo Principal

```
#000000
```

---

## Colores Primarios

```
#00B8C0
#009CA5
#02ACB2
#00C0C7
```

Estos colores deben utilizarse únicamente para dirigir la atención del usuario.

Nunca pintar toda la interfaz con ellos.

---

# Escala de Grises

Crear una escala consistente.

Ejemplo:

```
#050505
#101010
#181818
#202020
#2B2B2B
#3A3A3A
```

No utilizar negros o grises aleatorios.

---

# Tipografía

La tipografía es uno de los elementos más importantes del diseño.

Debe transmitir limpieza.

Debe respirar.

Debe ser fácil de leer.

Nunca utilizar demasiados tamaños diferentes.

La jerarquía visual debe ser clara.

---

# Espaciado

Toda la aplicación utilizará un sistema consistente de espaciado.

No utilizar valores aleatorios.

Ejemplo de escala:

```
4
8
12
16
20
24
32
40
48
64
80
96
```

Todo margen o separación deberá salir de esta escala.

---

# Bordes

Evitar bordes excesivamente redondos.

Utilizar radios consistentes.

Ejemplo:

```
8

12

16

20

24
```

Nunca utilizar un radio diferente únicamente por estética.

---

# Sombras

Las sombras deben ser suaves.

Nunca agresivas.

Nunca oscuras.

Las sombras ayudan a crear profundidad.

No deben llamar la atención.

---

# Glassmorphism

Puede utilizarse únicamente cuando aporte valor visual.

No abusar del efecto vidrio.

Debe sentirse elegante.

No decorativo.

---

# Blur

El blur forma parte de la identidad.

Puede utilizarse en:

- Sidebars
- Diálogos
- Menús
- Paneles
- Overlays

Nunca utilizar blur exagerado.

---

# Iconografía

Todos los iconos deben pertenecer a la misma librería.

No mezclar estilos.

No mezclar grosores.

No mezclar familias distintas.

---

# Botones

Todos los botones deberán seguir el mismo lenguaje visual.

Estados mínimos:

- Normal
- Hover
- Pressed
- Disabled
- Loading

Cada transición deberá ser animada.

---

# Inputs

Los campos de texto deberán sentirse modernos.

No utilizar el TextField con apariencia por defecto.

Los estados mínimos serán:

- Normal
- Hover
- Focus
- Error
- Disabled

---

# Tarjetas

Las tarjetas deberán tener:

- Buena separación
- Profundidad
- Bordes suaves
- Animaciones sutiles

No deberán parecer cajas.

---

# Sidebar

La Sidebar es uno de los elementos principales del producto.

Debe sentirse elegante.

Debe utilizar:

- Blur
- Transparencias
- Animaciones
- Estados Hover
- Selección animada

Nunca debe sentirse pesada.

---

# Chat

El chat es el corazón de NEXAI.

Debe transmitir tranquilidad.

Mucho espacio visual.

Mensajes fáciles de leer.

Nada debe sentirse saturado.

---

# Espacio en Blanco

El espacio vacío también diseña.

No llenar toda la pantalla.

Permitir que la interfaz respire.

---

# Estados

Todos los componentes deberán tener estados definidos.

Ejemplo:

Botón

- Normal
- Hover
- Focus
- Pressed
- Loading
- Disabled

Input

- Normal
- Hover
- Focus
- Error

Card

- Normal
- Hover
- Selected

---

# Responsive

El diseño debe adaptarse.

No simplemente estirarse.

Desktop

Web

Tablet

Mobile

Cada tamaño deberá sentirse natural.

---

# Consistencia

Todos los componentes deben parecer creados por la misma persona.

Nunca mezclar estilos.

Nunca improvisar componentes nuevos.

Si un componente no existe, deberá diseñarse antes de implementarse.

---

# Componentes Personalizados

Toda la aplicación deberá construirse utilizando componentes propios.

Ejemplos:

- NexButton
- NexInput
- NexSidebar
- NexDialog
- NexCard
- NexAvatar
- NexSearch
- NexDropdown
- NexTooltip
- NexSwitch
- NexChip
- NexBadge
- NexToast
- NexPanel

Evitar utilizar widgets visuales de Flutter directamente en las pantallas.
# Uso del Color

La interfaz de NEXAI NO depende de gradientes para verse moderna.

Los colores sólidos tendrán prioridad.

Los gradientes únicamente podrán utilizarse cuando tengan un propósito claro.

Ejemplos:

- Fondos muy sutiles.
- Iluminación ambiental.
- Estados especiales.
- Hero sections.

Nunca utilizar gradientes únicamente para decorar botones, tarjetas o paneles.

---

# Uso del Glow

El glow deberá utilizarse con extrema moderación.

Nunca deberá convertirse en el protagonista de la interfaz.

Debe sentirse como iluminación.

No como neón.

---

# Saturación

Evitar colores excesivamente saturados.

La interfaz debe transmitir elegancia.

No espectáculo.

---

# Minimalismo

La modernidad no proviene de agregar efectos.

Proviene de:

- Buena tipografía.
- Buen espaciado.
- Excelente jerarquía.
- Microanimaciones.
- Consistencia visual.

Nunca intentar compensar un diseño pobre agregando gradientes.
---

# Principio Final

El usuario nunca debe pensar:

"Esto parece una aplicación Flutter."

El usuario debe pensar:

"Esta aplicación tiene una identidad propia."

Cada componente debe reforzar esa sensación.