# NEXAI
# 022 - Guía de Componentes

> **Versión:** 1.0
> **Estado:** Documento Vivo
> **Prioridad:** Obligatorio

---

# Objetivo

Este documento define todos los componentes oficiales del sistema de diseño de NEXAI.

No explica cómo programarlos.

Explica cómo deben comportarse, cuándo deben utilizarse y qué características deben tener.

Todo componente nuevo deberá agregarse a este documento antes de implementarse.

---

# Filosofía

Los componentes son los bloques de construcción de NEXAI.

Una pantalla nunca debe inventar componentes.

Debe construirse reutilizando los existentes.

Cada componente debe sentirse como parte del mismo producto.

---

# NexButton

## Objetivo

Representar cualquier acción ejecutable.

---

## Variantes

- Primary
- Secondary
- Ghost
- Outline
- Danger
- Icon
- Text

---

## Estados

- Normal
- Hover
- Focus
- Pressed
- Loading
- Disabled

---

## Características

- Animaciones suaves.
- Ripple personalizado (no Material).
- Icono opcional.
- Loading integrado.
- Tamaños consistentes.

---

# NexInput

## Objetivo

Capturar información del usuario.

---

## Estados

- Normal
- Hover
- Focus
- Error
- Disabled
- ReadOnly

---

## Características

- Placeholder animado.
- Soporte para iconos.
- Validación visual.
- Borde animado.
- Excelente contraste.

---

# NexTextarea

## Objetivo

Capturar textos largos.

---

## Características

- Altura automática.
- Scroll interno.
- Contador opcional.
- Placeholder.
- Validaciones.

---

# NexSearchBar

## Objetivo

Buscar contenido dentro de la aplicación.

---

## Características

- Icono.
- Placeholder.
- Shortcut visual.
- Botón limpiar.
- Animaciones.

---

# NexSidebar

## Objetivo

Navegación principal.

---

## Debe incluir

- Logo.
- Nuevo Chat.
- Conversaciones.
- Perfil.
- Configuración.
- Logout.

---

## Estados

- Normal.
- Hover.
- Seleccionado.
- Colapsado.

---

# NexCard

## Objetivo

Agrupar información relacionada.

---

## Características

- Bordes suaves.
- Espaciado consistente.
- Hover.
- Elevación ligera.
- Animaciones.

---

# NexPanel

## Objetivo

Crear áreas independientes dentro de una pantalla.

---

## Uso

- Panel derecho.
- Panel izquierdo.
- Configuración.
- Información.

---

# NexDialog

## Objetivo

Solicitar confirmaciones o mostrar información importante.

---

## Características

- Fondo desenfocado.
- Fade.
- Scale.
- Botones consistentes.

---

# NexModal

## Objetivo

Mostrar contenido temporal.

---

## Características

- Reutilizable.
- Responsive.
- Cierre elegante.

---

# NexDropdown

## Objetivo

Seleccionar opciones.

---

## Características

- Animación.
- Búsqueda opcional.
- Iconos.
- Scroll.

---

# NexAvatar

## Objetivo

Representar usuarios.

---

## Características

- Imagen.
- Iniciales.
- Estado online.
- Badge opcional.

---

# NexBadge

## Objetivo

Mostrar estados.

---

## Ejemplos

- Nuevo.
- Beta.
- Pro.
- Error.
- Activo.

---

# NexChip

## Objetivo

Representar etiquetas.

---

## Características

- Seleccionable.
- Removible.
- Compacto.

---

# NexTooltip

## Objetivo

Mostrar ayuda contextual.

---

## Características

- Fade.
- Delay.
- Flecha.
- Responsive.

---

# NexToast

## Objetivo

Mostrar información temporal.

---

## Tipos

- Success.
- Error.
- Warning.
- Info.

---

# NexLoading

## Objetivo

Indicar procesamiento.

---

## Importante

No utilizar spinner clásico.

Debe respetar la identidad visual de NEXAI.

---

# NexEmptyState

## Objetivo

Mostrar estados vacíos.

---

## Debe incluir

- Ilustración.
- Título.
- Descripción.
- Acción principal.

---

# NexDivider

## Objetivo

Separar contenido.

---

Debe ser sutil.

Nunca protagonista.

---

# NexContextMenu

## Objetivo

Mostrar acciones rápidas.

---

## Características

- Blur.
- Hover.
- Animaciones.
- Excelente separación.

---

# PromptInput

## Objetivo

Es el componente más importante del proyecto.

Debe sentirse como una herramienta profesional.

---

## Deberá soportar

- Texto.
- Adjuntos.
- Cambio de modelo.
- Atajos.
- Drag & Drop.
- Envío.
- Multilínea.

---

# MessageBubble

## Objetivo

Representar mensajes dentro del chat.

---

## Debe soportar

- Markdown.
- Código.
- Tablas.
- Imágenes.
- Acciones.
- Streaming.

---

# ThinkingIndicator

## Objetivo

Mostrar que la IA está procesando información.

---

## Regla

Nunca utilizar únicamente:

"Pensando..."

Debe existir una animación propia de NEXAI.

---

# Componentes Futuros

Este documento crecerá conforme evolucione el proyecto.

Todo componente nuevo deberá documentarse aquí antes de implementarse.

---

# Regla Final

Si un componente no está definido en este documento,

primero deberá diseñarse.

Después implementarse.

Nunca al revés.