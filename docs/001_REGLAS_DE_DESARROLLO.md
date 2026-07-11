# NEXAI
# 001 - Reglas de Desarrollo

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Este documento define las reglas obligatorias de desarrollo para todo el frontend de NEXAI.

Estas reglas tienen prioridad sobre cualquier decisión automática tomada por herramientas de IA.

Todo el código generado deberá respetarlas.

---

# Filosofía

La prioridad siempre será:

1. Código limpio.
2. Código entendible.
3. Código mantenible.
4. Código reutilizable.
5. Excelente experiencia de usuario.

Nunca se debe sacrificar la calidad por escribir menos código.

---

# Organización del código

Cada archivo debe tener una única responsabilidad.

Evitar archivos gigantes.

Evitar componentes gigantes.

Evitar funciones gigantes.

Si un archivo comienza a crecer demasiado, deberá dividirse.

---

# Tamaño máximo recomendado

## Pantallas

- Ideal: 150 - 250 líneas.
- Máximo recomendado: 300 líneas.

## Widgets

- Ideal: 80 - 150 líneas.
- Máximo recomendado: 200 líneas.

## Controllers

- Ideal: 150 - 250 líneas.
- Máximo recomendado: 300 líneas.

## Servicios

- Ideal: 150 - 250 líneas.
- Máximo recomendado: 300 líneas.

Si un archivo supera estos límites y contiene más de una responsabilidad, deberá separarse.

---

# Separación de Widgets

Una pantalla nunca debe contener toda la interfaz.

Cada sección importante deberá vivir en su propio widget.

Ejemplo:

❌ Incorrecto

ChatPage

- Header
- Sidebar
- Prompt
- Lista de mensajes
- Thinking
- Menús
- Diálogos

Todo dentro del mismo archivo.

---

✅ Correcto

ChatPage

Utiliza:

- ChatHeader
- ChatSidebar
- PromptInput
- MessageList
- MessageBubble
- ThinkingIndicator
- EmptyState
- ChatToolbar

Cada widget deberá tener su propio archivo.

---

# Reutilización

Si un componente puede utilizarse en más de un lugar, deberá convertirse en un widget reutilizable.

Nunca duplicar código.

Nunca copiar y pegar componentes.

---

# Componentes personalizados

La interfaz no debe construirse utilizando widgets visuales por defecto.

Los componentes deberán personalizarse para respetar la identidad visual de NEXAI.

Ejemplos:

- Botones
- Inputs
- Tarjetas
- Diálogos
- Menús
- Sidebars
- Modales

Todo debe mantener el mismo lenguaje visual.

---

# Diseño

No diseñar pensando en Flutter.

Diseñar pensando en el producto.

Flutter únicamente renderiza la interfaz.

La identidad pertenece a NEXAI.

---

# Responsive

Toda pantalla debe funcionar correctamente en:

- Web
- Windows
- macOS
- Linux
- Android
- iOS

No crear pantallas exclusivas para un único dispositivo salvo que sea estrictamente necesario.

---

# Espaciado

No utilizar números aleatorios.

Evitar ejemplos como:

- EdgeInsets.only(left: 17)
- SizedBox(height: 13)
- Padding(top: 27)

Todos los espacios deberán mantener consistencia visual y utilizar el sistema de espaciado del proyecto.

---

# Colores

Nunca escribir colores directamente en la interfaz.

❌ Incorrecto

Color(0xFF00B8C0)

✅ Correcto

Utilizar los colores definidos por el sistema de diseño.

---

# Tipografía

Nunca modificar tamaños de texto de forma arbitraria.

Todos los textos deberán seguir la escala tipográfica definida por el proyecto.

---

# Animaciones

Toda animación debe tener un propósito.

No agregar animaciones únicamente porque se ven bonitas.

Las animaciones deben ayudar al usuario a comprender la interfaz.

---

# Movimiento

Preferir movimientos suaves.

- Fade
- Scale
- Slide
- Blur
- Spring

Evitar movimientos bruscos.

---

# Rendimiento

Evitar reconstrucciones innecesarias.

Evitar widgets excesivamente complejos.

Preferir soluciones simples antes que soluciones demasiado abstractas.

---

# Código

El código debe poder entenderse leyendo únicamente el archivo.

Evitar lógica difícil de seguir.

Utilizar nombres claros.

No utilizar abreviaciones innecesarias.

---

# Comentarios

No comentar código evidente.

Los comentarios únicamente deberán existir cuando expliquen una decisión importante.

---

# Nombres

Utilizar nombres descriptivos.

❌ Incorrecto

- btn
- tmp
- obj

✅ Correcto

- sendButton
- currentMessage
- selectedModel
- conversationList

---

# Importaciones

Eliminar importaciones no utilizadas.

Mantener todos los archivos limpios.

---

# Experiencia

Antes de terminar cualquier pantalla preguntarse:

- ¿Se siente moderna?
- ¿Se siente premium?
- ¿Se siente fluida?
- ¿Mantiene la identidad visual de NEXAI?

Si alguna respuesta es negativa, la implementación deberá mejorarse antes de darse por terminada.

---

# Regla Final

Siempre priorizar:

- Calidad.
- Legibilidad.
- Mantenimiento.
- Reutilización.
- Consistencia.

NEXAI debe sentirse como un único producto, no como un conjunto de pantallas independientes.