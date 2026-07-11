# NEXAI
# 021 - Reglas de Implementación

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** CRÍTICA

---

# Objetivo

Este documento define cómo deberá implementarse cualquier nueva funcionalidad dentro del proyecto.

No importa el tamaño de la tarea.

Siempre deberá seguir el mismo proceso.

---

# Filosofía

No escribir código por escribir.

Primero pensar.

Después diseñar.

Después implementar.

Finalmente mejorar.

---

# Antes de programar

Antes de escribir código Claude Code deberá responder internamente las siguientes preguntas:

- ¿Qué quiere resolver esta tarea?
- ¿Ya existe un componente parecido?
- ¿Qué archivos realmente necesitan modificarse?
- ¿Puede reutilizarse código existente?
- ¿Existe una solución más simple?

Nunca comenzar directamente escribiendo código.

---

# Leer antes de modificar

Antes de modificar cualquier archivo:

- Revisar su contenido.
- Entender su responsabilidad.
- Identificar dependencias.
- Verificar qué componentes lo utilizan.

Nunca modificar archivos "a ciegas".

---

# Cambios mínimos

Cada tarea deberá modificar únicamente los archivos necesarios.

Evitar cambios masivos.

Evitar refactorizaciones innecesarias.

Si algo funciona correctamente, no modificarlo.

---

# Crear componentes

Si una pantalla necesita un nuevo componente:

1. Verificar que no exista.
2. Diseñarlo.
3. Implementarlo.
4. Reutilizarlo.

Nunca duplicar componentes.

---

# Crear widgets

Antes de agregar más código a una pantalla preguntarse:

¿Este bloque puede vivir en otro widget?

Si la respuesta es sí,

extraerlo inmediatamente.

---

# Controllers

Los Controllers únicamente controlan comportamiento.

No construyen UI.

No crean Widgets.

No contienen lógica visual.

---

# Servicios

Los Servicios únicamente realizan operaciones.

Nunca dibujan interfaz.

Nunca muestran diálogos.

Nunca muestran notificaciones.

---

# Modelos

Los modelos únicamente representan información.

Nunca contienen lógica de interfaz.

Nunca contienen lógica visual.

---

# Widgets

Los Widgets únicamente renderizan.

No deben contener lógica compleja.

Si un Widget comienza a crecer demasiado deberá dividirse.

---

# Responsabilidad

Cada archivo deberá responder una única pregunta.

Ejemplo

ChatHeader

↓

Renderiza el encabezado.

No carga conversaciones.

No consume APIs.

No cambia temas.

---

# Refactorización

Si durante una tarea detectas código repetido:

Extraerlo.

Reutilizarlo.

No esperar a que aparezca una tercera copia.

---

# Errores

Todo error deberá manejarse correctamente.

Nunca dejar:

try {

}

catch (_) {}

Los errores deben controlarse.

---

# Navegación

Nunca crear navegación improvisada.

Toda navegación deberá utilizar el sistema oficial del proyecto.

---

# Diseño

Antes de crear un nuevo componente preguntarse:

¿Se siente como NEXAI?

Si la respuesta es no,

rediseñarlo.

---

# Responsive

Nunca dejar el responsive para el final.

Toda implementación deberá funcionar desde el primer momento en:

- Desktop
- Web
- Tablet
- Mobile

---

# Animaciones

Las animaciones forman parte del desarrollo.

No deberán agregarse "después".

Cada componente deberá nacer con su comportamiento visual.

---

# Finalizar una tarea

Antes de dar una tarea por terminada verificar:

✓ Diseño

✓ Responsive

✓ Animaciones

✓ Código limpio

✓ Componentes reutilizables

✓ Sin código duplicado

✓ Sin warnings

✓ Sin archivos gigantes

✓ Sin colores hardcodeados

✓ Sin números mágicos

---

# Qué hacer cuando exista una duda

Si la documentación ya responde la duda:

Seguir la documentación.

Si la documentación no la responde:

Elegir la solución más simple.

Nunca inventar una nueva arquitectura.

---

# Regla de Oro

Claude Code no deberá programar pensando únicamente en que el código funcione.

Deberá programar pensando en que ese código seguirá existiendo dentro de cinco años.

Cada decisión deberá facilitar el mantenimiento, la escalabilidad y la evolución de NEXAI.

La calidad siempre tendrá prioridad sobre la velocidad.