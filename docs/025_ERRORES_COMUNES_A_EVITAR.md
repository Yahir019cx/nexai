# NEXAI
# 025 - Errores Comunes a Evitar

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** CRÍTICA

---

# Objetivo

Este documento recopila los errores más comunes durante el desarrollo del frontend.

Su objetivo es mantener el proyecto limpio, consistente y fácil de mantener.

Si alguna implementación cae en alguno de estos errores, deberá corregirse antes de considerarse terminada.

---

# Arquitectura

## No crear carpetas innecesarias

Incorrecto

```
presentation/
domain/
repository/
use_cases/
entities/
datasources/
```

Cuando realmente no aportan valor.

La arquitectura debe mantenerse simple.

---

## No crear Helpers gigantes

Nunca crear archivos como:

```
helpers.dart

utils.dart

common.dart

misc.dart

extensions.dart
```

que terminan teniendo cientos de funciones sin relación.

Las utilidades deberán organizarse por responsabilidad.

---

## No crear Services gigantes

Incorrecto

```
ChatService

1200 líneas
```

Si un Service comienza a crecer demasiado deberá dividirse.

---

# Pantallas

Nunca crear pantallas enormes.

Incorrecto

```
chat_page.dart

1,800 líneas
```

Correcto

```
ChatPage

↓

ChatHeader

↓

ConversationList

↓

PromptInput

↓

ThinkingIndicator

↓

ChatFooter
```

---

# Widgets

No crear widgets con múltiples responsabilidades.

Cada widget debe resolver únicamente un problema.

---

# Código Duplicado

Nunca copiar y pegar código.

Si una solución aparece dos veces,

probablemente debe convertirse en un componente reutilizable.

---

# Widgets Anidados

Evitar estructuras como:

```
Container

↓

Container

↓

Padding

↓

Container

↓

Column

↓

Container

↓

Row

↓

Container
```

Buscar siempre simplificar la estructura.

---

# Números Mágicos

Incorrecto

```
height: 13

width: 287

padding: 19
```

Utilizar el sistema de espaciado del proyecto.

---

# Colores Hardcodeados

Incorrecto

```
Color(0xFF00B8C0)
```

Utilizar siempre el sistema de colores.

---

# Tipografía

No escribir tamaños arbitrarios.

Incorrecto

```
fontSize: 17

fontSize: 29

fontSize: 41
```

Toda tipografía deberá utilizar la escala oficial.

---

# Animaciones

No crear animaciones diferentes para componentes similares.

Todo deberá compartir el mismo lenguaje visual.

---

# Gradientes

No utilizar gradientes para ocultar un diseño pobre.

La interfaz debe verse bien incluso utilizando únicamente colores sólidos.

---

# Glow

No abusar del glow.

No utilizar efectos tipo neón.

No crear interfaces llamativas únicamente por utilizar brillo.

---

# Sombras

Evitar sombras exageradas.

Las sombras existen para aportar profundidad.

No para llamar la atención.

---

# Build()

Nunca colocar demasiada lógica dentro del método build.

El build debe describir la interfaz.

No controlar comportamiento.

---

# Build Gigantes

Si el build comienza a ocupar varias pantallas,

es momento de dividir el widget.

---

# Métodos

Evitar métodos de cientos de líneas.

Cada método debe hacer una sola cosa.

---

# Variables

Evitar nombres como:

```
data

item

temp

obj

list

value

```

Utilizar nombres descriptivos.

---

# Booleanos

Incorrecto

```
loading

enabled

selected
```

Correcto

```
isLoading

isEnabled

isSelected
```

---

# Imports

No dejar imports sin utilizar.

Mantener cada archivo limpio.

---

# Código Comentado

Nunca dejar grandes bloques comentados.

Si ya no sirven,

eliminarlos.

Git conserva el historial.

---

# TODO

No dejar TODO permanentes.

Si una tarea queda pendiente deberá registrarse en el Roadmap.

---

# Dependencias

No instalar paquetes para resolver problemas pequeños.

Mientras menos dependencias tenga el proyecto,

más fácil será mantenerlo.

---

# Responsive

Nunca desarrollar únicamente para Desktop.

Nunca desarrollar únicamente para Mobile.

Todo componente debe adaptarse desde el principio.

---

# Rendimiento

No optimizar prematuramente.

Pero tampoco ignorar problemas evidentes.

Buscar siempre el equilibrio.

---

# Diseño

No crear componentes "especiales" para una sola pantalla.

Si un componente rompe la identidad del proyecto,

debe rediseñarse.

---

# Filosofía

Nunca escribir código pensando únicamente en terminar una tarea.

Pensar siempre en el mantenimiento futuro.

---

# Regla Final

Cada vez que una implementación parezca demasiado complicada,

detenerse.

Analizar.

Simplificar.

La simplicidad casi siempre será la mejor solución.