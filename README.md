# Especificación y validación del contrato de API

El sistema de integración debe especificar y validar el contrato de API entre el core bancario y los canales de acceso (móvil, web, cajeros automáticos). El contrato debe definir los endpoints, los códigos de error y el mapeo de datos entre sistemas. Los canales enviarán solicitudes al core, que las procesará y devolverá respuestas. El core debe garantizar la idempotencia de las solicitudes y manejar adecuadamente los errores y excepciones. Los canales deben ser capaces de interpretar las respuestas y tomar las acciones necesarias.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | contrato de API de integracion |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Definición del contrato de API

**Objetivo:** Especificar los endpoints, los códigos de error y el mapeo de datos entre el core y los canales.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los endpoints necesarios para la integración.
- Definir los códigos de error y sus descripciones.
- Especificar el mapeo de datos entre los sistemas.

**Entregable:** Documento que describe el contrato de API con los endpoints, códigos de error y mapeo de datos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los diferentes tipos de solicitudes que los canales pueden enviar al core.
- Piensa en los posibles errores que pueden ocurrir durante la integración y cómo deben ser manejados.

</details>

### Fase 2: Implementación de la idempotencia

**Objetivo:** Garantizar que las solicitudes al core sean idempotentes.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Implementar la lógica para asegurar que las solicitudes repetidas con la misma clave de idempotencia produzcan el mismo resultado.
- Definir la ventana de tiempo dentro de la cual se considera una solicitud idempotente.

**Entregable:** Código que implementa la idempotencia en las solicitudes al core.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo manejar las solicitudes repetidas con diferentes claves de idempotencia.
- Piensa en los posibles modos de falla y cómo deben ser manejados.

</details>

### Fase 3: Manejo de errores y excepciones

**Objetivo:** Implementar un manejo adecuado de los errores y excepciones en la integración.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir las estrategias para manejar los diferentes tipos de errores y excepciones que pueden ocurrir durante la integración.
- Implementar la lógica para devolver las respuestas adecuadas a los canales en caso de error.

**Entregable:** Código que implementa el manejo de errores y excepciones en la integración.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los diferentes tipos de errores y excepciones que pueden ocurrir y cómo deben ser manejados.
- Piensa en las respuestas adecuadas que deben ser devueltas a los canales en caso de error.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es un contrato de API y por qué es importante en la integración de sistemas?
- **paraQueSirve**: ¿Para qué sirve la idempotencia en las solicitudes al core y cómo se implementa?
- **comoSeUsa**: ¿Cómo se manejan los errores y excepciones en la integración y qué estrategias se pueden utilizar?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir durante la integración y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño del contrato de API y cómo se toman?

## Criterios de Evaluacion

- Definir correctamente los endpoints, códigos de error y mapeo de datos del contrato de API.
- Implementar la lógica para garantizar la idempotencia de las solicitudes al core.
- Implementar un manejo adecuado de los errores y excepciones en la integración.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
npx --yes @redocly/cli lint contrato/openapi.yaml
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
