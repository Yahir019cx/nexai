# NEXAI
# 009 - Temas y Personalización

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir cómo funciona el sistema de temas de NEXAI.

El objetivo es que cambiar entre modo oscuro y modo claro no sea únicamente cambiar colores.

Debe sentirse como la misma aplicación.

---

# Filosofía

NEXAI está diseñado bajo el principio:

Dark First.

Toda nueva pantalla deberá diseñarse primero en modo oscuro.

Posteriormente se adaptará al modo claro.

Nunca al revés.

---

# Temas soportados

La aplicación soportará:

- Modo Oscuro
- Modo Claro

En el futuro podrán agregarse nuevos temas sin modificar los componentes.

---

# Colores

Los componentes nunca deberán conocer colores directamente.

Siempre deberán obtenerlos desde el sistema de temas.

Incorrecto

Color(0xFF00B8C0)

Correcto

AppColors.primary

---

# Colores oficiales

Primario

#00B8C0

Secundario

#009CA5

Accent

#02ACB2

Highlight

#00C0C7

Fondo

#000000

---

# Persistencia

La selección del tema deberá guardarse automáticamente.

Al volver a abrir la aplicación deberá mantenerse.

---

# Cambio de tema

El cambio entre temas deberá ser animado.

Nunca instantáneo.

La transición deberá sentirse natural.

---

# Componentes

Todos los componentes deberán adaptarse automáticamente al tema.

Nunca crear versiones separadas.

Incorrecto

DarkButton

LightButton

Correcto

NexButton

---

# Sombras

Las sombras deberán adaptarse al tema.

No copiar exactamente las mismas.

---

# Blur

El blur deberá mantenerse en ambos temas.

Adaptando únicamente su intensidad.

---

# Transparencias

Las transparencias deberán respetar el fondo activo.

Nunca reducir la legibilidad.

---

# Iconos

Los iconos deberán adaptarse automáticamente.

Nunca crear versiones distintas del mismo icono.

---

# Texto

Todos los textos deberán mantener un excelente contraste.

La prioridad siempre será la legibilidad.

---

# Futuro

Todo nuevo componente deberá soportar ambos temas desde su creación.

Nunca implementar primero un tema y dejar el otro pendiente.

---

# Regla Final

Cambiar de tema no debe sentirse como cambiar de aplicación.

Debe sentirse como la misma experiencia adaptándose al usuario.