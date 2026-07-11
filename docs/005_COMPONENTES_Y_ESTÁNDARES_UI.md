# NEXAI
# 005 - Componentes y Estándares UI

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir las reglas para construir todos los componentes visuales de NEXAI.

Toda la interfaz deberá construirse utilizando componentes propios y reutilizables.

Nunca diseñar directamente sobre una pantalla.

Las pantallas únicamente ensamblan componentes.

---

# Filosofía

Cada componente debe resolver un único problema.

Debe ser:

- Reutilizable.
- Escalable.
- Fácil de mantener.
- Fácil de leer.

Un componente no debe conocer la lógica de otros componentes.

---

# Componentes Base

Toda la interfaz deberá construirse a partir de una librería propia de componentes.

Ejemplo:

```

NexButton

NexInput

NexTextarea

NexCard

NexPanel

NexDialog

NexSidebar

NexAvatar

NexBadge

NexChip

NexTooltip

NexDropdown

NexSwitch

NexCheckbox

NexSearchBar

NexLoading

NexEmptyState

NexDivider

NexContextMenu

NexModal

NexFloatingPanel

```

No es obligatorio crear todos desde el inicio.

Se crearán conforme sean necesarios.

---

# Responsabilidad

Cada componente debe tener una única responsabilidad.

Ejemplo:

Incorrecto

```

NexSidebar

- Navega
- Consume API
- Guarda configuración
- Renderiza UI

```

Correcto

```

NexSidebar

Solo renderiza.

La lógica vive en su Controller.

```

---

# Componentes Grandes

Cuando un componente comience a crecer demasiado deberá dividirse.

Ejemplo

```

PromptInput

```

Puede dividirse en:

```

PromptInput

PromptToolbar

PromptAttachments

PromptActions

PromptModelSelector

```

---

# Pantallas

Una pantalla nunca debe construir toda la interfaz.

Debe actuar únicamente como ensamblador.

Ejemplo

```

ChatPage

│

├── ChatHeader

├── ChatSidebar

├── ChatBody

├── PromptInput

└── ChatFooter

```

La pantalla no debe contener cientos de líneas de widgets.

---

# Props

Los componentes deberán recibir únicamente la información necesaria.

Evitar componentes con demasiados parámetros.

Si un componente requiere demasiadas propiedades, probablemente necesita dividirse.

---

# Estados

Cada componente deberá soportar únicamente los estados necesarios.

Ejemplo

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
- Disabled

Card

- Normal
- Hover
- Selected

---

# Personalización

Los componentes deberán ser configurables.

Ejemplo

```

NexButton

```

Debe permitir:

- Texto.
- Icono.
- Loading.
- Disabled.
- Tamaño.
- Variante.
- Acción.

Sin necesidad de modificar el componente.

---

# Consistencia

Todos los componentes deben compartir:

- Espaciado.
- Tipografía.
- Bordes.
- Sombras.
- Animaciones.
- Colores.

Nunca crear un componente "especial" únicamente para una pantalla.

---

# Composición

Siempre preferir composición sobre herencia.

Es mejor combinar componentes pequeños que crear un componente gigante.

---

# Código

Cada componente deberá ser fácil de entender.

El archivo debe poder leerse de principio a fin sin perder contexto.

---

# Separación

No mezclar:

- UI
- Lógica
- Estado
- Navegación

Cada responsabilidad debe permanecer separada.

---

# Reutilización

Antes de crear un componente nuevo preguntarse:

¿Ya existe uno parecido?

Si la respuesta es sí, reutilizarlo.

Si necesita pequeñas modificaciones, extenderlo.

No duplicarlo.

---

# Nombres

Todos los componentes deberán tener nombres descriptivos.

Correcto

```

PromptInput

MessageBubble

ChatSidebar

ModelSelector

ConversationCard

SettingsTile

```

Incorrecto

```

Widget1

ContainerCard

ItemWidget

Button2

```

---

# Widgets Privados

Si un widget únicamente será utilizado dentro de un componente específico, podrá vivir junto a dicho componente.

No es necesario mover todo a la carpeta global de widgets.

---

# Widgets Globales

Si un componente será utilizado por más de un módulo, deberá vivir dentro de la carpeta global de widgets.

---

# Principio Visual

Todos los componentes deben parecer diseñados por la misma persona.

Si un componente rompe la identidad visual de NEXAI, deberá rediseñarse.

Nunca adaptar la identidad del proyecto a un componente.

Siempre adaptar el componente a la identidad del proyecto.

---

# Regla Final

Las pantallas ensamblan.

Los componentes construyen.

Los controllers controlan.

Los servicios obtienen información.

Cada pieza debe conocer únicamente su responsabilidad.

Mientras más pequeñas sean las piezas, más fácil será evolucionar NEXAI durante los próximos años.