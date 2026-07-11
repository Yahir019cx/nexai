# NEXAI
# 002 - Estructura del Proyecto

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir una estructura de proyecto limpia, sencilla y escalable.

La estructura debe facilitar el desarrollo, el mantenimiento y la incorporación de nuevas funcionalidades sin caer en una arquitectura excesivamente compleja.

No buscamos una Clean Architecture extrema.

Buscamos una arquitectura limpia, entendible y práctica.

---

# Filosofía

La estructura debe permitir que cualquier desarrollador pueda encontrar un archivo en pocos segundos.

Si encontrar un archivo requiere navegar por demasiadas carpetas, la estructura está mal diseñada.

Menos carpetas.

Más claridad.

---

# Estructura General

```text
lib/

app/
core/
features/
models/
widgets/

main.dart
```

---

# app

Contiene la configuración principal de la aplicación.

Ejemplo:

```text
app/

app.dart
router.dart
```

Responsabilidades:

- Inicializar la aplicación.
- Configurar rutas.
- Configurar navegación.
- Configurar tema.
- Configurar providers globales.

No debe contener lógica de negocio.

---

# core

Contiene elementos compartidos por toda la aplicación.

Ejemplo:

```text
core/

api/
constants/
services/
theme/
utils/
extensions/
```

Aquí viven únicamente herramientas reutilizables.

No debe contener código específico de un módulo.

---

# api

Contiene la comunicación con servicios externos.

Ejemplo:

```text
core/api/

api_client.dart

auth_api.dart

chat_api.dart

models_api.dart
```

Cada archivo debe encargarse únicamente de consumir su recurso correspondiente.

---

# services

Servicios compartidos.

Ejemplo:

```text
core/services/

storage_service.dart

theme_service.dart

clipboard_service.dart

notification_service.dart
```

No colocar llamadas HTTP aquí.

---

# constants

Constantes globales.

Ejemplo:

```text
api_constants.dart

animation_constants.dart

spacing.dart

durations.dart
```

---

# theme

Configuración del sistema de temas.

Ejemplo:

```text
theme/

app_theme.dart

colors.dart

text_styles.dart
```

---

# utils

Funciones auxiliares reutilizables.

Ejemplo:

```text
date_utils.dart

validators.dart

formatters.dart
```

Evitar convertir esta carpeta en un "basurero".

---

# models

Contiene todos los modelos de la aplicación.

Ejemplo:

```text
models/

user.dart

chat.dart

message.dart

ai_model.dart

conversation.dart
```

Los modelos no pertenecen a un módulo específico.

Si un modelo puede reutilizarse, debe vivir aquí.

---

# features

Cada funcionalidad principal tendrá su propia carpeta.

Ejemplo:

```text
features/

auth/

chat/

settings/

profile/

models/

agents/
```

Cada feature es independiente.

---

# Estructura de un Feature

Ejemplo:

```text
chat/

chat_page.dart

chat_controller.dart

chat_service.dart

widgets/
```

No crear carpetas innecesarias.

No utilizar:

- data
- domain
- presentation
- repositories
- usecases

salvo que en el futuro exista una necesidad real.

---

# Widgets del Feature

Cada módulo tendrá sus propios widgets.

Ejemplo:

```text
chat/

widgets/

chat_header.dart

chat_sidebar.dart

message_bubble.dart

message_list.dart

prompt_input.dart

thinking_indicator.dart

empty_state.dart
```

Nunca colocar todos los widgets dentro de chat_page.dart.

---

# widgets

Contiene widgets reutilizables por toda la aplicación.

Ejemplo:

```text
widgets/

nex_button.dart

nex_card.dart

nex_dialog.dart

nex_sidebar.dart

nex_input.dart

glass_panel.dart

loading_indicator.dart
```

Si un widget se utiliza en más de un módulo, pertenece aquí.

---

# Assets

La estructura de assets será:

```text
assets/

branding/

fonts/

icons/

images/

logo/

lottie/

rive/

shaders/

svg/
```

Cada recurso debe mantenerse organizado.

---

# Documentación

Toda la documentación vive dentro de:

```text
docs/
```

Nunca colocar documentación dentro de lib.

---

# Principios

La estructura debe cumplir siempre con estas reglas:

- Fácil de entender.
- Fácil de navegar.
- Fácil de mantener.
- Fácil de escalar.

Si una carpeta existe únicamente para contener otra carpeta, probablemente sobra.

---

# Regla Final

Cuando surja una nueva funcionalidad, la primera pregunta será:

> ¿Puede integrarse respetando esta estructura?

Si la respuesta es sí, mantener la estructura.

Si la respuesta es no, modificar la estructura únicamente cuando exista una razón técnica clara y no por preferencia personal.