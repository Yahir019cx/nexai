# NEXAI
# 010 - Estados y Feedback

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir cómo la aplicación comunica información al usuario.

Una buena experiencia no depende únicamente de una interfaz bonita.

Depende de comunicar correctamente lo que está ocurriendo.

Todo cambio de estado deberá tener un feedback visual claro.

---

# Filosofía

El usuario nunca debe preguntarse:

- ¿Está cargando?
- ¿Funcionó?
- ¿Se envió?
- ¿Falló?
- ¿Sigue pensando?
- ¿Se congeló?

La interfaz siempre debe comunicar el estado actual.

---

# Principios

Todo estado debe ser:

- Claro.
- Elegante.
- Consistente.
- Poco invasivo.

Nunca interrumpir al usuario innecesariamente.

---

# Estados principales

Toda pantalla deberá contemplar, cuando aplique, los siguientes estados.

- Inicial.
- Cargando.
- Vacío.
- Con información.
- Error.
- Sin conexión.
- Procesando.
- Completado.

---

# Estado Inicial

La aplicación nunca deberá mostrar espacios vacíos.

Siempre deberá existir una guía visual para el usuario.

Ejemplo:

- Logo.
- Bienvenida.
- Texto descriptivo.
- Acción principal.

---

# Estado de Carga

Evitar mostrar un spinner tradicional.

Priorizar:

- Skeletons.
- Placeholder animados.
- Indicadores propios de NEXAI.

El usuario debe sentir que la aplicación está trabajando.

---

# Skeleton

Siempre que sea posible utilizar Skeletons.

Nunca hacer que toda la pantalla desaparezca mientras carga.

El layout debe permanecer estable.

---

# Estado Vacío

Cuando no exista información:

No mostrar una pantalla vacía.

Explicar:

- Qué sucede.
- Por qué sucede.
- Qué puede hacer el usuario.

Siempre acompañar el estado con una acción.

---

# Estado de Error

Los errores deben comunicarse de forma elegante.

Nunca mostrar mensajes técnicos.

Incorrecto

Exception...

StackTrace...

SocketException...

Correcto

"No fue posible completar la solicitud."

---

# Sin Conexión

Cuando no exista conexión:

Informar claramente.

Permitir reintentar.

Mantener la aplicación estable.

---

# Procesando

Cuando una acción requiera tiempo:

Mostrar actividad.

Nunca bloquear completamente la interfaz si no es necesario.

---

# Éxito

Las acciones exitosas deberán comunicarse de forma discreta.

Ejemplos:

- Toast.
- Mensaje temporal.
- Animación breve.

Evitar diálogos innecesarios.

---

# Toasts

Los Toasts deberán utilizarse únicamente para información breve.

Ejemplos:

- Conversación eliminada.
- Copiado al portapapeles.
- Cambios guardados.

Nunca utilizarlos para errores importantes.

---

# Confirmaciones

Solo solicitar confirmación cuando exista riesgo de pérdida de información.

Ejemplo:

- Eliminar conversación.
- Cerrar sesión.
- Borrar archivos.

No pedir confirmación para acciones simples.

---

# Indicadores de Progreso

Cuando una operación tenga varias etapas:

Mostrar el progreso.

El usuario debe conocer el avance.

---

# Botones

Durante una operación:

El botón debe mostrar claramente que está ocupado.

Evitar múltiples clics.

---

# Feedback Visual

Toda interacción deberá responder inmediatamente.

Ejemplos:

Hover.

Pressed.

Focus.

Loading.

Success.

Error.

El usuario nunca debe pensar que la aplicación ignoró su acción.

---

# Estados del Chat

El chat deberá contemplar como mínimo:

- Sin conversación.
- Pensando.
- Escribiendo respuesta.
- Respuesta completa.
- Error.
- Cancelado.

Cada estado deberá sentirse diferente.

---

# Estados del Prompt

El Prompt deberá responder visualmente cuando:

- Está vacío.
- Tiene texto.
- Tiene archivos.
- Está deshabilitado.
- Está enviando.

---

# Estados del Sidebar

La Sidebar deberá indicar claramente:

- Conversación seleccionada.
- Hover.
- Conversación nueva.
- Conversación fijada (si existe).

---

# Transiciones

Los cambios de estado nunca deberán ser instantáneos.

Todo cambio importante deberá animarse de forma suave.

---

# Regla Final

El usuario nunca debe adivinar qué está ocurriendo.

La interfaz siempre debe comunicar el estado actual de manera elegante, clara y sin interrumpir el flujo de trabajo.