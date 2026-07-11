# NEXAI
# 011 - Naming y Convenciones

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir un estándar único para nombrar archivos, carpetas, clases, widgets, variables y métodos.

Todo el proyecto debe sentirse escrito por una sola persona.

La consistencia tiene prioridad sobre las preferencias personales.

---

# Filosofía

El código debe leerse como un libro.

Los nombres deben explicar qué hace cada elemento.

Nunca obligar al desarrollador a adivinar.

---

# Idioma

Todo el código deberá escribirse en inglés.

Toda la documentación (.md) permanecerá en español.

Ejemplos

✅ Correcto

ChatPage

MessageBubble

ThemeController

selectedModel

conversationTitle

---

❌ Incorrecto

PaginaChat

Mensaje

botonEnviar

modeloSeleccionado

---

# Carpetas

Siempre utilizar:

snake_case

Ejemplos

```
chat

chat/widgets

settings

shared

core

models

```

Nunca utilizar:

```
Chat

ChatWidgets

CHAT

```

---

# Archivos

Todos los archivos utilizarán:

snake_case

Ejemplos

```
chat_page.dart

message_bubble.dart

prompt_input.dart

theme_controller.dart

```

---

# Clases

Todas las clases utilizarán:

PascalCase

Ejemplos

```
ChatPage

PromptInput

ThemeController

ConversationModel

```

---

# Widgets

Todos los widgets deberán terminar con un nombre descriptivo.

Ejemplos

```
ChatHeader

ChatSidebar

ConversationTile

MessageBubble

PromptToolbar

PromptInput

```

Evitar nombres genéricos.

---

# Controllers

Todos los controllers terminarán con:

Controller

Ejemplos

```
ChatController

ThemeController

SettingsController

```

---

# Servicios

Todos los servicios terminarán con:

Service

Ejemplos

```
ThemeService

StorageService

ClipboardService

```

---

# APIs

Todos los clientes de API terminarán con:

Api

Ejemplos

```
ChatApi

ModelsApi

AuthApi

```

---

# Modelos

Todos los modelos terminarán con:

Model

Ejemplos

```
UserModel

ChatModel

ConversationModel

MessageModel

```

---

# Variables

Utilizar camelCase.

Ejemplos

```
currentConversation

selectedModel

isLoading

messages

themeMode

```

---

# Variables Booleanas

Siempre comenzar con:

```
is

has

can

should

```

Ejemplos

```
isLoading

hasMessages

canSend

shouldAnimate

```

---

# Métodos

Los métodos deberán describir una acción.

Ejemplos

```
loadConversations()

sendMessage()

changeTheme()

deleteConversation()

copyMessage()

```

Nunca utilizar nombres ambiguos.

---

# Constantes

Utilizar camelCase.

Ejemplos

```
defaultAnimationDuration

sidebarWidth

defaultBorderRadius

```

---

# Enumeraciones

Utilizar PascalCase.

Ejemplos

```
ThemeModeType

MessageStatus

ConversationType

```

---

# Widgets Privados

Los widgets privados comenzarán con "_".

Ejemplo

```
_ChatHeader

_PromptActions

_MessageFooter

```

---

# Métodos Privados

También comenzarán con "_".

Ejemplo

```
_sendMessage()

_buildHeader()

_loadHistory()

```

---

# Comentarios

No comentar código evidente.

Incorrecto

```dart
// Variable del usuario
final user;
```

Correcto

Comentar únicamente decisiones importantes de arquitectura o comportamiento.

---

# Abreviaciones

Evitar abreviaciones innecesarias.

Incorrecto

```
btn

msg

conv

usr

mdl

```

Correcto

```
button

message

conversation

user

model

```

---

# Nombres Genéricos

Nunca utilizar nombres como:

```
data

item

temp

test

widget

container

card2

buttonNew

```

Cada nombre debe describir exactamente su responsabilidad.

---

# Archivos Grandes

Si el nombre comienza a necesitar palabras como:

```
chat_page_new_final_v2.dart
```

Existe un problema de organización.

---

# Consistencia

Si ya existe un patrón en el proyecto, deberá respetarse.

Nunca inventar un nuevo estilo de nombres para resolver un caso específico.

---

# Regla Final

Un desarrollador nuevo debe poder entender el propósito de un archivo, clase, método o variable únicamente leyendo su nombre.

Si necesita abrir el archivo para entender qué hace, probablemente el nombre no es el adecuado.