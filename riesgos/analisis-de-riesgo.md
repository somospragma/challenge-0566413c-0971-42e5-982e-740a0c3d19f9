# Análisis de Riesgo de la Integración Core Bancario - Canales

## Introducción
Este documento identifica los modos de falla potenciales en la integración entre el core bancario y los canales de acceso (móvil, web, cajeros automáticos). Se detallan los impactos en el negocio y las estrategias de mitigación para cada riesgo identificado.

## Modos de Falla y Mitigación

### 1. Fallo en la Comunicación entre Sistemas
- **Descripción**: Interrupción en la conexión entre el core bancario y los canales, causada por problemas de red, timeout en las solicitudes o caída de servicios.
- **Impacto**: Alto. Los usuarios no pueden realizar transacciones, lo que genera insatisfacción y posibles pérdidas financieras.
- **Probabilidad**: Media.
- **Mitigación**:
  - Implementar retries con backoff exponencial en los canales para manejar timeouts temporales.
  - Usar un balanceador de carga con health checks para detectar y redirigir tráfico a instancias saludables del core.
  - Establecer un circuito breaker para evitar sobrecargar el core en caso de fallos prolongados.
  - Monitorear la latencia y disponibilidad de los endpoints del core con alertas automáticas.

### 2. Errores en el Mapeo de Datos
- **Descripción**: Datos incorrectamente transformados entre los canales y el core, debido a diferencias en los esquemas de datos, validaciones faltantes o reglas de transformación mal aplicadas.
- **Impacto**: Crítico. Puede generar transacciones con montos erróneos, cuentas incorrectas o datos corruptos.
- **Probabilidad**: Alta.
- **Mitigación**:
  - Validar los datos en ambos extremos (canales y core) usando esquemas JSON definidos en el contrato OpenAPI.
  - Implementar pruebas automatizadas para el mapeo de datos, cubriendo casos límite (ej. caracteres especiales, montos negativos).
  - Usar herramientas de reconciliación para comparar los datos antes y después de la transformación.
  - Documentar explícitamente las reglas de transformación en el archivo `mapeo-de-datos.csv`.

### 3. Problemas de Idempotencia
- **Descripción**: Solicitudes duplicadas procesadas como transacciones independientes, debido a la falta de validación del header `Idempotency-Key` o a su manejo incorrecto en el core.
- **Impacto**: Crítico. Puede generar cargos duplicados en cuentas de clientes o transacciones no autorizadas.
- **Probabilidad**: Media.
- **Mitigación**:
  - Validar el header `Idempotency-Key` en cada solicitud y rechazar solicitudes duplicadas con el código de error `409 Conflict`.
  - Almacenar las claves de idempotencia en una caché con TTL (Time To Live) para evitar reprocesamiento.
  - Incluir ejemplos de manejo de idempotencia en los escenarios Gherkin (`criterios-de-aceptacion.feature`).
  - Documentar el uso del header `Idempotency-Key` en el contrato OpenAPI (`openapi.yaml`).

### 4. Errores en la Validación de Solicitudes
- **Descripción**: Solicitudes con datos inválidos (ej. formato incorrecto de IBAN, montos negativos) que no son rechazadas por el core, generando transacciones inválidas.
- **Impacto**: Alto. Puede generar transacciones fraudulentas o errores en los saldos de las cuentas.
- **Probabilidad**: Alta.
- **Mitigación**:
  - Validar todas las solicitudes contra el esquema JSON definido en el contrato OpenAPI.
  - Usar expresiones regulares para validar formatos específicos (ej. IBAN, números de tarjeta).
  - Rechazar solicitudes inválidas con códigos de error descriptivos (ej. `400 Bad Request` con detalles del error).
  - Incluir ejemplos de validación en los escenarios Gherkin (`criterios-de-aceptacion.feature`).

### 5. Fallos en el Manejo de Errores
- **Descripción**: Respuestas de error genéricas o ambiguas que no permiten a los canales tomar acciones correctivas.
- **Impacto**: Medio. Dificulta la depuración y puede generar confusión en los usuarios.
- **Probabilidad**: Alta.
- **Mitigación**:
  - Definir códigos de error detallados en el contrato OpenAPI, con descripciones claras en español.
  - Incluir ejemplos de respuestas de error en el contrato OpenAPI.
  - Implementar logs estructurados para registrar los errores con detalles suficientes para su análisis.
  - Documentar los códigos de error y sus posibles causas en el contrato OpenAPI.

### 6. Sobrecarga del Core Bancario
- **Descripción**: Alto volumen de solicitudes simultáneas que saturan el core, generando lentitud o caída del servicio.
- **Impacto**: Crítico. Afecta la disponibilidad del servicio y la experiencia del usuario.
- **Probabilidad**: Baja.
- **Mitigación**:
  - Implementar rate limiting en los canales para controlar el volumen de solicitudes.
  - Usar colas de mensajes para desacoplar el procesamiento de solicitudes.
  - Escalar horizontalmente el core bancario para manejar picos de tráfico.
  - Monitorear el uso de recursos del core y establecer alertas para prevenir saturaciones.

## Conclusión
Este análisis identifica los riesgos críticos en la integración entre el core bancario y los canales, proponiendo estrategias de mitigación para garantizar la disponibilidad, integridad y confiabilidad del sistema. La implementación de estas estrategias debe ser validada mediante pruebas automatizadas y monitoreo continuo.