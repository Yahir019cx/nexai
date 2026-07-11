# NEXAI
# 017 - Buenas Prácticas de Desarrollo

> **Versión:** 1.0
> **Estado:** Activo
> **Prioridad:** Obligatorio

---

# Objetivo

Definir las buenas prácticas que deberán seguirse durante todo el desarrollo del frontend.

No basta con que el código funcione.

Debe ser limpio, fácil de mantener y preparado para crecer durante años.

---

# Filosofía

Siempre escribir código pensando que otra persona lo mantendrá en el futuro.

Ese desarrollador incluso puedes ser tú dentro de seis meses.

El código debe explicar su intención sin necesidad de documentación adicional.

---

# Simplicidad

Siempre elegir la solución más simple que resuelva correctamente el problema.

No agregar complejidad anticipando necesidades futuras que aún no existen.

---

# Legibilidad

El código debe ser fácil de leer.

Debe evitar:

- Condiciones innecesariamente largas.
- Widgets profundamente anidados.
- Métodos gigantes.
- Variables ambiguas.

---

# Responsabilidad Única

Cada archivo debe tener una sola responsabilidad.

Cada widget debe resolver un solo problema.

Cada controller debe controlar un solo módulo.

Cada servicio debe ofrecer un solo tipo de funcionalidad.

---

# Composición

Siempre preferir composición antes que crear widgets enormes.

Es mejor construir una pantalla utilizando muchos widgets pequeños que un único archivo difícil de mantener.

---

# Reutilización

Antes de escribir código nuevo preguntarse:

¿Ya existe una solución similar?

Si existe, reutilizarla.

Si necesita mejoras, extenderla.

Nunca duplicar código.

---

# Métodos

Los métodos deben ser pequeños.

Cada método debe realizar una única acción.

Si un método requiere demasiados comentarios para entenderse, probablemente debe dividirse.

---

# Widgets

Los widgets deben ser pequeños.

Un widget complejo deberá dividirse en componentes más específicos.

---

# Controllers

Los controllers no dibujan interfaz.

No contienen widgets.

No contienen BuildContext salvo casos excepcionales.

Su responsabilidad es controlar el comportamiento del módulo.

---

# Servicios

Los servicios únicamente realizan tareas.

No contienen lógica visual.

No muestran diálogos.

No muestran notificaciones.

No conocen la interfaz.

---

# Build Method

El método build debe ser fácil de leer.

Si comienza a crecer demasiado deberá dividirse utilizando widgets privados o componentes reutilizables.

---

# Constantes

Todo valor repetido deberá convertirse en una constante.

Evitar repetir números o textos en múltiples archivos.

---

# Imports

Mantener únicamente los imports necesarios.

Eliminar automáticamente cualquier importación no utilizada.

---

# Código Muerto

No dejar código comentado.

No dejar funciones sin utilizar.

No dejar variables temporales.

Si ya no sirve, eliminarlo.

---

# Comentarios

Los comentarios deben explicar decisiones.

Nunca explicar código evidente.

Incorrecto

// Crear botón

Correcto

// Se utiliza esta estrategia para evitar reconstrucciones innecesarias.

---

# Errores

Nunca ignorar errores.

Nunca dejar bloques catch vacíos.

Todo error deberá manejarse correctamente.

---

# Refactorización

Si una implementación puede simplificarse sin perder funcionalidad, deberá refactorizarse.

La calidad del código es un proceso continuo.

---

# Consistencia

Todo el proyecto deberá seguir el mismo estilo.

No cambiar patrones entre módulos.

No cambiar nombres.

No cambiar organización.

---

# Optimización

No optimizar prematuramente.

Primero hacer que funcione correctamente.

Después mejorar rendimiento cuando realmente sea necesario.

---

# Calidad

Antes de finalizar cualquier implementación responder:

- ¿Es fácil de entender?
- ¿Es fácil de modificar?
- ¿Es fácil de reutilizar?
- ¿Respeta la arquitectura?
- ¿Respeta la identidad del proyecto?

Si alguna respuesta es negativa, continuar mejorando.

---

# Regla Final

El objetivo no es escribir más código.

El objetivo es escribir el mejor código posible.

Cada línea deberá aportar valor al proyecto.

Todo lo demás deberá eliminarse.