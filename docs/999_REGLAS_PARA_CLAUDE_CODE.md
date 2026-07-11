# NEXAI
# 999 - Reglas para Claude Code

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** CRÍTICA

---

# Objetivo

Este documento contiene las reglas obligatorias que Claude Code deberá seguir durante todo el desarrollo del frontend de NEXAI.

Estas reglas tienen prioridad sobre cualquier sugerencia, patrón o decisión automática.

Claude Code deberá comportarse como un desarrollador Senior del proyecto, respetando siempre la identidad definida por la documentación.

---

# Regla Principal

Antes de escribir una sola línea de código deberás revisar la documentación del proyecto.

Nunca asumir.

Nunca improvisar.

Nunca inventar una arquitectura distinta.

---

# Arquitectura

Respetar siempre la estructura del proyecto.

No crear nuevas carpetas únicamente por preferencia.

No implementar patrones complejos si no existe una necesidad real.

La solución más simple suele ser la mejor.

---

# Diseño

Nunca utilizar Material Design como identidad visual.

Flutter únicamente renderiza la interfaz.

Toda la identidad visual pertenece a NEXAI.

---

# Componentes

Nunca construir una pantalla utilizando widgets visuales de Flutter como solución final.

Todo componente importante deberá convertirse en un componente reutilizable.

---

# Pantallas

Las pantallas únicamente ensamblan componentes.

No deben contener toda la lógica.

No deben contener cientos de widgets.

No deben convertirse en archivos gigantes.

---

# Widgets

Siempre dividir componentes grandes.

Si un widget comienza a tener demasiadas responsabilidades deberá separarse.

---

# Tamaño Máximo

Pantallas

300 líneas máximo.

Widgets

200 líneas máximo.

Controllers

300 líneas máximo.

Servicios

300 líneas máximo.

Si un archivo supera esos límites deberá dividirse.

---

# Reutilización

Antes de crear un componente nuevo deberás buscar si ya existe uno similar.

Nunca duplicar código.

Nunca copiar y pegar componentes.

---

# Diseño Moderno

Toda interfaz deberá sentirse:

- Premium.
- Elegante.
- Minimalista.
- Tecnológica.
- Profesional.

Nunca crear interfaces genéricas.

Nunca crear pantallas aburridas.

---

# Gradientes

No utilizar gradientes llamativos.

No utilizar gradientes multicolor.

No utilizar gradientes para intentar hacer que un diseño parezca moderno.

Si un diseño necesita un gradiente para verse bien, el problema es el diseño.

---

# Glow

Utilizar únicamente glow muy sutil.

Nunca crear efectos tipo neón.

Nunca abusar del brillo.

---

# Colores

Nunca escribir colores hardcodeados.

Siempre utilizar el sistema de colores del proyecto.

---

# Espaciado

Nunca utilizar números aleatorios.

No escribir:

EdgeInsets.only(left: 17)

SizedBox(height: 13)

Padding(top: 27)

Siempre utilizar el sistema de espaciado definido por el proyecto.

---

# Animaciones

Toda animación deberá tener un propósito.

No agregar efectos únicamente porque "se ven bonitos".

La prioridad es la experiencia.

No el espectáculo.

---

# Rendimiento

Nunca implementar una solución visual que afecte el rendimiento.

La fluidez es más importante que los efectos.

---

# Código

Escribir código limpio.

Escribir código legible.

Escribir código reutilizable.

Escribir código mantenible.

No escribir código únicamente para que funcione.

---

# Comentarios

No comentar código evidente.

Comentar únicamente decisiones importantes.

---

# Dependencias

Nunca instalar una dependencia sin autorización.

Siempre intentar resolver el problema utilizando Flutter o las librerías ya existentes.

---

# Refactorización

Si encuentras una mejor solución durante el desarrollo:

No modificar toda la arquitectura.

Primero justificar la mejora.

Luego implementarla.

---

# Responsive

Todo componente deberá funcionar correctamente en:

- Desktop
- Web
- Tablet
- Mobile

No crear soluciones exclusivas para una sola plataforma.

---

# Accesibilidad

No sacrificar legibilidad por estética.

Siempre mantener una excelente experiencia de usuario.

---

# Identidad

Cada pantalla deberá parecer diseñada por la misma persona.

Nunca improvisar estilos.

Nunca mezclar componentes con apariencias diferentes.

---

# Antes de finalizar cualquier tarea

Verificar:

- ¿El código es limpio?
- ¿Está dividido correctamente?
- ¿Existen widgets reutilizables?
- ¿Es responsive?
- ¿Las animaciones son suaves?
- ¿Respeta el sistema de diseño?
- ¿Respeta la documentación?
- ¿Respeta la identidad visual?
- ¿Se siente como NEXAI?

Si alguna respuesta es negativa, continuar mejorando la implementación.

---

# Prohibiciones

Nunca utilizar:

- ElevatedButton
- Drawer
- AppBar por defecto
- SnackBar por defecto
- FloatingActionButton
- ListTile como diseño final
- Card como diseño final
- AlertDialog como diseño final

Si se utilizan internamente como base deberán personalizarse completamente.

El usuario nunca debe reconocer un componente visual de Flutter.

---

# Filosofía Final

No estamos construyendo una aplicación.

Estamos construyendo un producto.

Cada línea de código deberá acercar a NEXAI a convertirse en una plataforma de inteligencia artificial de nivel profesional.

La calidad tiene prioridad sobre la velocidad.

La experiencia tiene prioridad sobre la cantidad de funcionalidades.

La consistencia tiene prioridad sobre las preferencias personales.

Si existe una duda durante el desarrollo, la decisión correcta será aquella que haga que NEXAI se sienta más elegante, más simple y más premium.