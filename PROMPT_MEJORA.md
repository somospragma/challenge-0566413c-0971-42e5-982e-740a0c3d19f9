# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `contrato/openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Como saber que terminaste

```bash
npx --yes @redocly/cli lint contrato/openapi.yaml
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Integración, Especialidad Analista, Tecnología Api, Advanced

### Brecha de conocimiento
Especifica el contrato, los codigos de error y el mapeo de datos entre sistemas

### Misión / candidato
Cerrar el contrato entre core y canales

### Datos adicionales
Candidato analista de integracion

### Reto
- Tema: contrato de API de integracion
- Seniority: advanced-l2
- Tipo: practical
- Título: Especificación y validación del contrato de API
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Definición del contrato de API — objetivo: Especificar los endpoints, los códigos de error y el mapeo de datos entre el core y los canales. — entregable (NO resolver): Documento que describe el contrato de API con los endpoints, códigos de error y mapeo de datos.
- Fase 2: Implementación de la idempotencia — objetivo: Garantizar que las solicitudes al core sean idempotentes. — entregable (NO resolver): Código que implementa la idempotencia en las solicitudes al core.
- Fase 3: Manejo de errores y excepciones — objetivo: Implementar un manejo adecuado de los errores y excepciones en la integración. — entregable (NO resolver): Código que implementa el manejo de errores y excepciones en la integración.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: contrato/openapi.yaml ===
openapi: 3.1.0
info:
  title: API de Integración Core Bancario - Canales
  description: |
    Contrato de integración entre el core bancario y los canales de acceso (móvil, web, cajeros automáticos).
    Este contrato define los endpoints para operaciones críticas como consultas de saldo, transferencias,
    pagos de servicios y manejo de errores con idempotencia garantizada.
    
    **Estandares aplicados:**
    - OpenAPI 3.1
    - BIAN (Banking Industry Architecture Network) para servicios financieros
    - ISO 20022 para formatos de mensajes
    - Idempotencia mediante header `Idempotency-Key`
  version: 1.0.0
  contact:
    name: Equipo de Integración Bancaria
    email: integracion@bancoejemplo.com
  license:
    name: Privado - Banco Ejemplo
servers:
  - url: https://api.bancoejemplo.com/core/v1
    description: Servidor de producción
  - url: https://sandbox.api.bancoejemplo.com/core/v1
    description: Entorno de pruebas
paths:
  /cuentas/{numeroCuenta}/saldo:
    get:
      tags:
        - Consultas
      summary: Consulta de saldo de una cuenta
      description: |
        Permite consultar el saldo disponible y total de una cuenta específica.
        Requiere autenticación con token JWT y permisos de lectura sobre la cuenta.
      operationId: consultarSaldo
      parameters:
        - name: numeroCuenta
          in: path
          description: Número de cuenta en formato IBAN (20 caracteres)
          required: true
          schema:
            type: string
            pattern: '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$'
            example: ES9121000418450200051332
        - name: Idempotency-Key
          in: header
          description: |
            Clave de idempotencia para garantizar que la solicitud se procese una sola vez.
            Debe ser un UUID v4 generado por el cliente.
          required: false
          schema:
            type: string
            format: uuid
            example: 550e8400-e29b-41d4-a716-446655440000
        - name: X-Channel
          in: header
          description: Canal de origen de la solicitud (móvil, web, cajero)
          required: true
          schema:
            type: string
            enum: [movil, web, cajero]
      responses:
        '200':
          description: Respuesta exitosa con el saldo de la cuenta
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SaldoResponse'
              examples:
                ejemploExitoso:
                  value:
                    saldoDisponible: 15230.75
                    saldoTotal: 15230.75
                    moneda: EUR
                    fechaHora: '2023-11-15T14:30:00Z'
                    limites:
                      limiteDiario: 3000.00
                      limiteMensual: 20000.00
        '400':
          description: Solicitud inválida
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                formatoInvalido:
                  value:
                    codigo: CUENTA_FORMATO_INVALIDO
                    mensaje: El número de cuenta no cumple con el formato IBAN
                    detalles:
                      campo: numeroCuenta
                      valorRecibido: ES91X
                    timestamp: '2023-11-15T14:30:01Z'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                tokenInvalido:
                  value:
                    codigo: AUTENTICACION_FALLIDA
                    mensaje: Token JWT inválido o expirado
                    timestamp: '2023-11-15T14:30:02Z'
        '403':
          description: Prohibido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                sinPermisos:
                  value:
                    codigo: ACCESO_DENEGADO
                    mensaje: El usuario no tiene permisos para consultar esta cuenta
                    detalles:
                      cuenta: ES9121000418450200051332
                      usuario: usuario123
                    timestamp: '2023-11-15T14:30:03Z'
        '404':
          description: Recurso no encontrado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                cuentaNoExiste:
                  value:
                    codigo: CUENTA_NO_ENCONTRADA
                    mensaje: La cuenta especificada no existe
                    detalles:
                      numeroCuenta: ES9121000418450200051332
                    timestamp: '2023-11-15T14:30:04Z'
        '429':
          description: Límite de solicitudes excedido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                limiteExcedido:
                  value:
                    codigo: LIMITE_SOLICITUDES_EXCEDIDO
                    mensaje: Ha excedido el límite de solicitudes por minuto
                    detalles:
                      limite: 60
                      periodo: 60
                      solicitadas: 62
                    timestamp: '2023-11-15T14:30:05Z'
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                errorSistema:
                  value:
                    codigo: ERROR_INTERNO_SERVIDOR
                    mensaje: Error inesperado en el servidor
                    timestamp: '2023-11-15T14:30:06Z'
                    uuidIncidencia: 'ERR-20231115-143006-001'
  /transferencias:
    post:
      tags:
        - Transferencias
      summary: Realiza una transferencia entre cuentas
      description: |
        Permite realizar una transferencia entre cuentas propias o a terceros.
        Requiere autenticación con token JWT y permisos sobre las cuentas origen y destino.
        
        **Idempotencia:**
        - Si se recibe una solicitud con el mismo `Idempotency-Key` dentro de las 24 horas,
          se devuelve la respuesta original sin reprocesar la transferencia.
        - El campo `idOperacion` en la respuesta identifica de forma única la transferencia.
      operationId: realizarTransferencia
      parameters:
        - name: Idempotency-Key
          in: header
          description: Clave de idempotencia (UUID v4)
          required: true
          schema:
            type: string
            format: uuid
            example: 550e8400-e29b-41d4-a716-446655440000
        - name: X-Channel
          in: header
          description: Canal de origen de la solicitud
          required: true
          schema:
            type: string
            enum: [movil, web, cajero]
      requestBody:
        description: Datos de la transferencia
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/TransferenciaRequest'
            examples:
              ejemploValido:
                value:
                  cuentaOrigen: ES9121000418450200051332
                  cuentaDestino: ES7220801123456789012345
                  importe: 150.50
                  moneda: EUR
                  concepto: Pago factura luz
                  referencia: FACT-2023-11-001
                  fechaEjecucion: '2023-11-16'
      responses:
        '200':
          description: Transferencia realizada con éxito
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TransferenciaResponse'
              examples:
                ejemploExitoso:
                  value:
                    idOperacion: TRF-20231115-143030-001
                    estado: COMPLETADA
                    fechaHora: '2023-11-15T14:30:30Z'
                    importe: 150.50
                    moneda: EUR
                    comision: 0.00
                    saldoOrigenDisponible: 15080.25
        '202':
          description: Transferencia aceptada para procesamiento posterior
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TransferenciaResponse'
              examples:
                ejemploProcesamiento:
                  value:
                    idOperacion: TRF-20231115-143031-002
                    estado: EN_PROCESO
                    fechaHora: '2023-11-15T14:30:31Z'
                    importe: 2000.00
                    moneda: EUR
        '400':
          description: Solicitud inválida
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                importeNegativo:
                  value:
                    codigo: IMPORTE_INVALIDO
                    mensaje: El importe debe ser mayor que cero
                    detalles:
                      campo: importe
                      valorRecibido: -150.50
                    timestamp: '2023-11-15T14:30:32Z'
                mismaCuenta:
                  value:
                    codigo: CUENTAS_IGUALES
                    mensaje: La cuenta origen y destino no pueden ser la misma
                    timestamp: '2023-11-15T14:30:33Z'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                tokenExpirado:
                  value:
                    codigo: AUTENTICACION_FALLIDA
                    mensaje: Token JWT expirado
                    timestamp: '2023-11-15T14:30:34Z'
        '403':
          description: Prohibido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                saldoInsuficiente:
                  value:
                    codigo: SALDO_INSUFICIENTE
                    mensaje: Saldo insuficiente en la cuenta origen
                    detalles:
                      cuentaOrigen: ES9121000418450200051332
                      saldoDisponible: 100.00
                      importeSolicitado: 150.50
                    timestamp: '2023-11-15T14:30:35Z'
                cuentaNoPermitida:
                  value:
                    codigo: CUENTA_NO_PERMITIDA
                    mensaje: La cuenta destino no está permitida para este usuario
                    detalles:
                      cuentaDestino: ES7220801123456789012345
                    timestamp: '2023-11-15T14:30:36Z'
        '404':
          description: Recurso no encontrado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                cuentaNoExiste:
                  value:
                    codigo: CUENTA_NO_ENCONTRADA
                    mensaje: La cuenta origen no existe
                    detalles:
                      numeroCuenta: ES9121000418450200059999
                    timestamp: '2023-11-15T14:30:37Z'
        '409':
          description: Conflicto
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                transferenciaDuplicada:
                  value:
                    codigo: TRANSFERENCIA_DUPLICADA
                    mensaje: Ya existe una transferencia con la misma clave de idempotencia
                    detalles:
                      idempotencyKey: 550e8400-e29b-41d4-a716-446655440000
                      idOperacionOriginal: TRF-20231115-143000-001
                    timestamp: '2023-11-15T14:30:38Z'
        '429':
          description: Límite de solicitudes excedido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                limiteExcedido:
                  value:
                    codigo: LIMITE_SOLICITUDES_EXCEDIDO
                    mensaje: Ha excedido el límite de transferencias por minuto
                    detalles:
                      limite: 10
                      periodo: 60
                      solicitadas: 12
                    timestamp: '2023-11-15T14:30:39Z'
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                errorSistema:
                  value:
                    codigo: ERROR_INTERNO_SERVIDOR
                    mensaje: Error inesperado en el servidor
                    timestamp: '2023-11-15T14:30:40Z'
                    uuidIncidencia: 'ERR-20231115-143040-002'
  /pagos:
    post:
      tags:
        - Pagos
      summary: Realiza un pago de servicio
      description: |
        Permite realizar el pago de un servicio (luz, agua, teléfono, etc.) desde una cuenta.
        Requiere autenticación con token JWT y permisos sobre la cuenta origen.
        
        **Idempotencia:**
        - Si se recibe una solicitud con el mismo `Idempotency-Key` dentro de las 24 horas,
          se devuelve la respuesta original sin reprocesar el pago.
      operationId: realizarPago
      parameters:
        - name: Idempotency-Key
          in: header
          description: Clave de idempotencia (UUID v4)
          required: true
          schema:
            type: string
            format: uuid
            example: 550e8400-e29b-41d4-a716-446655440000
        - name: X-Channel
          in: header
          description: Canal de origen de la solicitud
          required: true
          schema:
            type: string
            enum: [movil, web, cajero]
      requestBody:
        description: Datos del pago
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/PagoRequest'
            examples:
              ejemploValido:
                value:
                  cuentaOrigen: ES9121000418450200051332
                  codigoServicio: LUZ
                  referencia: FACT-2023-11-001
                  importe: 85.20
                  moneda: EUR
                  concepto: Pago factura luz noviembre
      responses:
        '200':
          description: Pago realizado con éxito
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PagoResponse'
              examples:
                ejemploExitoso:
                  value:
                    idOperacion: PAG-20231115-143500-001
                    estado: COMPLETADO
                    fechaHora: '2023-11-15T14:35:00Z'
                    importe: 85.20
                    moneda: EUR
                    comision: 0.00
                    saldoOrigenDisponible: 15145.05
        '400':
          description: Solicitud inválida
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                servicioInvalido:
                  value:
                    codigo: SERVICIO_INVALIDO
                    mensaje: El código de servicio no es válido
                    detalles:
                      campo: codigoServicio
                      valorRecibido: AGUA_INEXISTENTE
                    timestamp: '2023-11-15T14:35:01Z'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '403':
          description: Prohibido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                saldoInsuficiente:
                  value:
                    codigo: SALDO_INSUFICIENTE
                    mensaje: Saldo insuficiente para realizar el pago
                    detalles:
                      cuentaOrigen: ES9121000418450200051332
                      saldoDisponible: 50.00
                      importeSolicitado: 85.20
                    timestamp: '2023-11-15T14:35:02Z'
        '404':
          description: Recurso no encontrado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                cuentaNoExiste:
                  value:
                    codigo: CUENTA_NO_ENCONTRADA
                    mensaje: La cuenta origen no existe
                    detalles:
                      numeroCuenta: ES9121000418450200059999
                    timestamp: '2023-11-15T14:35:03Z'
        '409':
          description: Conflicto
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                pagoDuplicado:
                  value:
                    codigo: PAGO_DUPLICADO
                    mensaje: Ya existe un pago con la misma clave de idempotencia
                    detalles:
                      idempotencyKey: 550e8400-e29b-41d4-a716-446655440000
                      idOperacionOriginal: PAG-20231115-143000-001
                    timestamp: '2023-11-15T14:35:04Z'
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
components:
  schemas:
    SaldoResponse:
      type: object
      properties:
        saldoDisponible:
          type: number
          format: double
          description: Saldo disponible en la cuenta
          example: 15230.75
        saldoTotal:
          type: number
          format: double
          description: Saldo total en la cuenta
          example: 15230.75
        moneda:
          type: string
          description: Moneda de la cuenta
          enum: [EUR, USD, GBP]
          example: EUR
        fechaHora:
          type: string
          format: date-time
          description: Fecha y hora de la consulta
          example: '2023-11-15T14:30:00Z'
        limites:
          type: object
          properties:
            limiteDiario:
              type: number
              format: double
              description: Límite diario de retiros/transferencias
              example: 3000.00
            limiteMensual:
              type: number
              format: double
              description: Límite mensual de retiros/transferencias
              example: 20000.00
      required:
        - saldoDisponible
        - saldoTotal
        - moneda
        - fechaHora
    TransferenciaRequest:
      type: object
      properties:
        cuentaOrigen:
          type: string
          description: Número de cuenta origen en formato IBAN
          pattern: '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$'
          example: ES9121000418450200051332
        cuentaDestino:
          type: string
          description: Número de cuenta destino en formato IBAN
          pattern: '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$'
          example: ES7220801123456789012345
        importe:
          type: number
          format: double
          description: Importe de la transferencia
          minimum: 0.01
          example: 150.50
        moneda:
          type: string
          description: Moneda de la transferencia
          enum: [EUR, USD, GBP]
          example: EUR
        concepto:
          type: string
          description: Concepto de la transferencia (máximo 140 caracteres)
          maxLength: 140
          example: Pago factura luz
        referencia:
          type: string
          description: Referencia adicional (máximo 30 caracteres)
          maxLength: 30
          example: FACT-2023-11-001
        fechaEjecucion:
          type: string
          format: date
          description: Fecha de ejecución de la transferencia (formato YYYY-MM-DD)
          example: '2023-11-16'
      required:
        - cuentaOrigen
        - cuentaDestino
        - importe
        - moneda
        - concepto
    TransferenciaResponse:
      type: object
      properties:
        idOperacion:
          type: string
          description: Identificador único de la transferencia
          example: TRF-20231115-143030-001
        estado:
          type: string
          description: Estado de la transferencia
          enum: [COMPLETADA, EN_PROCESO, RECHAZADA]
          example: COMPLETADA
        fechaHora:
          type: string
          format: date-time
          description: Fecha y hora de la operación
          example: '2023-11-15T14:30:30Z'
        importe:
          type: number
          format: double
          description: Importe de la transferencia
          example: 150.50
        moneda:
          type: string
          description: Moneda de la transferencia
          enum: [EUR, USD, GBP]
          example: EUR
        comision:
          type: number
          format: double
          description: Comisión aplicada (si aplica)
          example: 0.00
        saldoOrigenDisponible:
          type: number
          format: double
          description: Saldo disponible en la cuenta origen después de la transferencia
          example: 15080.25
      required:
        - idOperacion
        - estado
        - fechaHora
        - importe
        - moneda
    PagoRequest:
      type: object
      properties:
        cuentaOrigen:
          type: string
          description: Número de cuenta origen en formato IBAN
          pattern: '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$'
          example: ES9121000418450200051332
        codigoServicio:
          type: string
          description: Código del servicio a pagar
          enum: [LUZ, AGUA, TELEFONO, INTERNET, GAS]
          example: LUZ
        referencia:
          type: string
          description: Referencia del pago (número de factura, etc.)
          maxLength: 50
          example: FACT-2023-11-001
        importe:
          type: number
          format: double
          description: Importe del pago
          minimum: 0.01
          example: 85.20
        moneda:
          type: string
          description: Moneda del pago
          enum: [EUR, USD, GBP]
          example: EUR
        concepto:
          type: string
          description: Concepto del pago (máximo 140 caracteres)
          maxLength: 140
          example: Pago factura luz noviembre
      required:
        - cuentaOrigen
        - codigoServicio
        - referencia
        - importe
        - moneda
    PagoResponse:
      type: object
      properties:
        idOperacion:
          type: string
          description: Identificador único del pago
          example: PAG-20231115-143500-001
        estado:
          type: string
          description: Estado del pago
          enum: [COMPLETADO, EN_PROCESO, RECHAZADO]
          example: COMPLETADO
        fechaHora:
          type: string
          format: date-time
          description: Fecha y hora del pago
          example: '2023-11-15T14:35:00Z'
        importe:
          type: number
          format: double
          description: Importe del pago
          example: 85.20
        moneda:
          type: string
          description: Moneda del pago
          enum: [EUR, USD, GBP]
          example: EUR
        comision:
          type: number
          format: double
          description: Comisión aplicada (si aplica)
          example: 0.00
        saldoOrigenDisponible:
          type: number
          format: double
          description: Saldo disponible en la cuenta origen después del pago
          example: 15145.05
      required:
        - idOperacion
        - estado
        - fechaHora
        - importe
        - moneda
    ErrorResponse:
      type: object
      description: Estructura estándar para respuestas de error
      properties:
        codigo:
          type: string
          description: Código de error específico
          example: SALDO_INSUFICIENTE
        mensaje:
          type: string
          description: Mensaje descriptivo del error
          example: Saldo insuficiente en la cuenta origen
        detalles:
          type: object
          description: Detalles adicionales del error (opcional)
          additionalProperties: true
          example:
            cuentaOrigen: ES9121000418450200051332
            saldoDisponible: 100.00
            importeSolicitado: 150.50
        timestamp:
          type: string
          format: date-time
          description: Fecha y hora del error
          example: '2023-11-15T14:30:35Z'
        uuidIncidencia:
          type: string
          description: Identificador único de la incidencia (solo para errores 500)
          example: 'ERR-20231115-143040-002'
      required:
        - codigo
        - mensaje
        - timestamp


// === ARCHIVO: contrato/openapi.yaml ===
openapi: 3.1.0
info:
  title: Contrato de Integración Core Bancario - Canales
  description: |
    Especificación del contrato de API para la integración entre el core bancario y los canales de acceso
    (móvil, web, cajeros automáticos). Incluye endpoints para operaciones críticas, manejo de errores
    y garantía de idempotencia.
  version: 1.0.0
  contact:
    name: Equipo de Integración Bancaria
    email: integracion@banco.com
servers:
  - url: https://api.banco.com/core/v1
    description: Servidor de producción del core bancario
  - url: https://api-sandbox.banco.com/core/v1
    description: Servidor de sandbox para pruebas
paths:
  /transacciones:
    post:
      summary: Registrar una transacción bancaria
      description: |
        Permite a los canales registrar una transacción en el core bancario. La solicitud debe incluir
        un identificador único para garantizar idempotencia.
      operationId: registrarTransaccion
      tags:
        - Transacciones
      parameters:
        - $ref: "#/components/parameters/IdempotencyKey"
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/SolicitudTransaccion"
            examples:
              transferenciaExitosa:
                summary: Ejemplo de transferencia exitosa
                value:
                  origen: "ES9121000418450200051332"
                  destino: "ES8420805801101234567891"
                  monto: 150.75
                  moneda: "EUR"
                  concepto: "Pago factura luz"
                  idCanal: "MOVIL"
      responses:
        "201":
          description: Transacción registrada exitosamente
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/RespuestaTransaccion"
              examples:
                exito:
                  summary: Respuesta exitosa
                  value:
                    codigoTransaccion: "TXN123456789"
                    estado: "COMPLETADA"
                    fechaRegistro: "2023-10-01T14:30:00Z"
        "400":
          description: Solicitud inválida
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
              examples:
                camposInvalidos:
                  summary: Campos obligatorios faltantes
                  value:
                    codigo: "INVALID_REQUEST"
                    mensaje: "Los campos origen, destino y monto son obligatorios"
                    detalles: ["Campo 'origen' faltante", "Campo 'monto' inválido"]
                monedaNoSoportada:
                  summary: Moneda no soportada
                  value:
                    codigo: "UNSUPPORTED_CURRENCY"
                    mensaje: "La moneda especificada no está soportada"
                    detalles: ["Moneda 'XYZ' no válida"]
        "409":
          description: Conflicto - Transacción duplicada
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
              examples:
                duplicada:
                  summary: Transacción duplicada
                  value:
                    codigo: "DUPLICATE_TRANSACTION"
                    mensaje: "Ya existe una transacción con el mismo Idempotency-Key"
                    detalles: ["Idempotency-Key: abc123-xyz456"]
        "422":
          description: Error de validación semántica
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
              examples:
                fondosInsuficientes:
                  summary: Fondos insuficientes
                  value:
                    codigo: "INSUFFICIENT_FUNDS"
                    mensaje: "Saldo insuficiente para realizar la transacción"
                    detalles: ["Cuenta origen: ES9121000418450200051332", "Saldo disponible: 50.00"]
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
              examples:
                errorInterno:
                  summary: Error interno
                  value:
                    codigo: "INTERNAL_ERROR"
                    mensaje: "Error inesperado en el procesamiento de la transacción"
                    detalles: []
  /transacciones/{id}:
    get:
      summary: Consultar estado de una transacción
      description: |
        Permite consultar el estado de una transacción previamente registrada utilizando su
        identificador único.
      operationId: consultarTransaccion
      tags:
        - Transacciones
      parameters:
        - name: id
          in: path
          description: Identificador único de la transacción
          required: true
          schema:
            type: string
            example: "TXN123456789"
      responses:
        "200":
          description: Estado de la transacción
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/RespuestaTransaccion"
              examples:
                completada:
                  summary: Transacción completada
                  value:
                    codigoTransaccion: "TXN123456789"
                    estado: "COMPLETADA"
                    fechaRegistro: "2023-10-01T14:30:00Z"
        "404":
          description: Transacción no encontrada
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
              examples:
                noEncontrada:
                  summary: Transacción no encontrada
                  value:
                    codigo: "TRANSACTION_NOT_FOUND"
                    mensaje: "No existe transacción con el ID proporcionado"
                    detalles: ["ID: TXN999999999"]
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"

components:
  parameters:
    IdempotencyKey:
      name: Idempotency-Key
      in: header
      description: |
        Identificador único generado por el cliente para garantizar que la solicitud sea idempotente.
        Debe ser un UUID v4 o un valor similar que garantice unicidad.
      required: true
      schema:
        type: string
        format: uuid
        example: "abc12345-6789-0abc-def0-123456789abc"
  schemas:
    SolicitudTransaccion:
      type: object
      required:
        - origen
        - destino
        - monto
        - moneda
        - concepto
        - idCanal
      properties:
        origen:
          type: string
          description: Número de cuenta origen en formato IBAN
          pattern: "^[A-Z]{2}[0-9]{2}[A-Z0-9]{1,30}$"
          example: "ES9121000418450200051332"
        destino:
          type: string
          description: Número de cuenta destino en formato IBAN
          pattern: "^[A-Z]{2}[0-9]{2}[A-Z0-9]{1,30}$"
          example: "ES8420805801101234567891"
        monto:
          type: number
          description: Monto de la transacción
          minimum: 0.01
          example: 150.75
        moneda:
          type: string
          description: Código ISO 4217 de la moneda
          pattern: "^[A-Z]{3}$"
          example: "EUR"
        concepto:
          type: string
          description: Concepto de la transacción
          maxLength: 140
          example: "Pago factura luz"
        idCanal:
          type: string
          description: Identificador del canal que origina la transacción
          enum: ["MOVIL", "WEB", "CAJERO", "OFICINA", "API"]
          example: "MOVIL"
    RespuestaTransaccion:
      type: object
      required:
        - codigoTransaccion
        - estado
        - fechaRegistro
      properties:
        codigoTransaccion:
          type: string
          description: Identificador único de la transacción generado por el core
          example: "TXN123456789"
        estado:
          type: string
          description: Estado actual de la transacción
          enum: ["PENDIENTE", "COMPLETADA", "RECHAZADA", "REVERSADA"]
          example: "COMPLETADA"
        fechaRegistro:
          type: string
          format: date-time
          description: Fecha y hora en que se registró la transacción
          example: "2023-10-01T14:30:00Z"
        detalles:
          type: object
          description: Detalles adicionales de la transacción
          properties:
            referencia:
              type: string
              description: Referencia bancaria
              example: "REF987654321"
            codigoAutorizacion:
              type: string
              description: Código de autorización
              example: "AUTH12345"
    Error:
      type: object
      required:
        - codigo
        - mensaje
      properties:
        codigo:
          type: string
          description: Código de error estandarizado
          example: "INVALID_REQUEST"
        mensaje:
          type: string
          description: Mensaje descriptivo del error
          example: "Los campos obligatorios no fueron proporcionados"
        detalles:
          type: array
          description: Detalles técnicos adicionales del error
          items:
            type: string
          example: ["Campo 'origen' faltante", "Formato de moneda inválido"]
        timestamp:
          type: string
          format: date-time
          description: Marca de tiempo del error
          example: "2023-10-01T14:30:00Z"

// === ARCHIVO: mapeo/mapeo-de-datos.csv ===
"Campo Origen","Tipo Origen","Obligatorio Origen","Campo Destino","Tipo Destino","Obligatorio Destino","Regla de Transformación","Ejemplo Origen","Ejemplo Destino"
"origen","string","SI","sourceAccount","string","SI","Validar formato IBAN y convertir a formato interno del core","ES9121000418450200051332","ACCT123456789"
"destino","string","SI","targetAccount","string","SI","Validar formato IBAN y convertir a formato interno del core","ES8420805801101234567891","ACCT987654321"
"monto","number","SI","amount","decimal(15,2)","SI","Convertir a moneda base si es necesario y validar mínimo 0.01","150.75","150.75"
"moneda","string","SI","currency","char(3)","SI","Validar código ISO 4217","EUR","EUR"
"concepto","string","SI","description","varchar(140)","SI","Truncar a 140 caracteres si supera el límite","Pago factura luz","Pago factura luz"
"idCanal","string","SI","channelId","char(10)","SI","Mapear valor enumerado a código interno del core","MOVIL","MOB"
"Idempotency-Key","string","SI","idempotencyKey","char(36)","SI","Validar formato UUID v4","abc12345-6789-0abc-def0-123456789abc","abc12345-6789-0abc-def0-123456789abc"
"fechaRegistro","datetime","NO","registrationDate","timestamp","NO","Convertir a zona horaria UTC si es necesario","2023-10-01T14:30:00+02:00","2023-10-01 12:30:00"
"estado","string","NO","status","char(15)","NO","Mapear estado a código interno del core","PENDIENTE","PEND"
"codigoTransaccion","string","NO","transactionCode","char(15)","NO","Generar código único en formato TXN + 9 dígitos","TXN123456789","TXN123456789"

// === ARCHIVO: validacion/criterios-de-aceptacion.feature ===
Feature: Validación del contrato de integración entre canales y core bancario
  Como analista de integración
  Quiero asegurar que el contrato de API cumpla con los requisitos funcionales y no funcionales
  Para garantizar una integración robusta y sin errores entre sistemas

  Background:
    Given el core bancario está disponible y operativo
    And los canales de acceso (móvil, web, cajeros) están configurados para enviar solicitudes

  Scenario: Registro exitoso de una transacción
    Given un cliente con cuenta origen "ES9121000418450200051332" y saldo suficiente
    And una cuenta destino válida "ES8420805801101234567891"
    When el canal envía una solicitud POST a /transacciones con:
      | origen               | destino                | monto  | moneda | concepto          | idCanal | Idempotency-Key                  |
      | ES9121000418450200051332 | ES8420805801101234567891 | 150.75 | EUR    | Pago factura luz   | MOVIL   | abc12345-6789-0abc-def0-12345678 |
    Then el core devuelve un código HTTP 201
    And la respuesta contiene un código de transacción válido
    And el estado de la transacción es "COMPLETADA"
    And la fecha de registro está en formato ISO 8601

  Scenario: Rechazo por formato de cuenta origen inválido
    Given un cliente con una cuenta origen en formato inválido
    When el canal envía una solicitud POST a /transacciones con:
      | origen               | destino                | monto  | moneda | concepto          | idCanal | Idempotency-Key                  |
      | ES912X00418450200051332 | ES8420805801101234567891 | 150.75 | EUR    | Pago factura luz   | MOVIL   | abc12345-6789-0abc-def0-12345678 |
    Then el core devuelve un código HTTP 400
    And el error contiene el código "INVALID_REQUEST"
    And el mensaje de error indica "Formato de cuenta origen inválido"
    And los detalles incluyen "El campo 'origen' debe cumplir con el formato IBAN"

  Scenario: Rechazo por monto insuficiente
    Given un cliente con cuenta origen "ES9121000418450200051332" y saldo de 50.00 EUR
    When el canal envía una solicitud POST a /transacciones con:
      | origen               | destino                | monto  | moneda | concepto          | idCanal | Idempotency-Key                  |
      | ES9121000418450200051332 | ES8420805801101234567891 | 100.00 | EUR    | Pago factura luz   | MOVIL   | abc12345-6789-0abc-def0-12345678 |
    Then el core devuelve un código HTTP 422
    And el error contiene el código "INSUFFICIENT_FUNDS"
    And el mensaje de error indica "Saldo insuficiente para realizar la transacción"
    And los detalles incluyen el saldo disponible

  Scenario: Validación de idempotencia - solicitud duplicada
    Given una transacción previamente registrada con Idempotency-Key "abc12345-6789-0abc-def0-12345678"
    When el canal envía una solicitud POST duplicada a /transacciones con el mismo Idempotency-Key
    Then el core devuelve un código HTTP 409
    And el error contiene el código "DUPLICATE_TRANSACTION"
    And el mensaje de error indica "Ya existe una transacción con el mismo Idempotency-Key"
    And los detalles incluyen el Idempotency-Key duplicado

  Scenario: Consulta exitosa de estado de transacción
    Given una transacción registrada con código "TXN123456789"
    When el canal envía una solicitud GET a /transacciones/TXN123456789
    Then el core devuelve un código HTTP 200
    And la respuesta contiene el estado "COMPLETADA"
    And la fecha de registro es válida

  Scenario: Consulta de transacción inexistente
    Given que no existe transacción con código "TXN999999999"
    When el canal envía una solicitud GET a /transacciones/TXN999999999
    Then el core devuelve un código HTTP 404
    And el error contiene el código "TRANSACTION_NOT_FOUND"
    And el mensaje de error indica "No existe transacción con el ID proporcionado"
    And los detalles incluyen el ID consultado

  Scenario: Rechazo por moneda no soportada
    Given una solicitud con moneda no soportada
    When el canal envía una solicitud POST a /transacciones con:
      | origen               | destino                | monto  | moneda | concepto          | idCanal | Idempotency-Key                  |
      | ES9121000418450200051332 | ES8420805801101234567891 | 150.75 | XYZ    | Pago factura luz   | MOVIL   | abc12345-6789-0abc-def0-12345678 |
    Then el core devuelve un código HTTP 400
    And el error contiene el código "UNSUPPORTED_CURRENCY"
    And el mensaje de error indica "La moneda especificada no está soportada"
    And los detalles incluyen la moneda inválida

  Scenario: Validación de obligatoriedad de campos
    When el canal envía una solicitud POST a /transacciones sin el campo obligatorio 'moneda'
    Then el core devuelve un código HTTP 400
    And el error contiene el código "INVALID_REQUEST"
    And el mensaje de error indica "Los campos obligatorios no fueron proporcionados"
    And los detalles incluyen "Campo 'moneda' faltante"
"


// === ARCHIVO: riesgos/analisis-de-riesgo.md ===
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


// === ARCHIVO: proceso.bpmn.md ===
# Flujo de Negocio: Integración Core Bancario - Canales

## Descripción General
Este documento describe el flujo de negocio para la integración entre el core bancario y los canales de acceso (móvil, web, cajeros automáticos) utilizando notación BPMN 2.0. El flujo incluye los pasos para procesar solicitudes, manejar errores y garantizar la idempotencia.

## Diagrama BPMN
```
@startuml

skinparam monochrome true
skinparam defaultFontName Arial

start

:Canales (Móvil/Web/Cajeros);

partition "Solicitud" {
  :Enviar solicitud al core
  (ej. transferencia, consulta de saldo);
  :Incluir header Idempotency-Key;
}

partition "Core Bancario" {
  if (¿Solicitud válida?) then (Sí)
    if (¿Idempotency-Key existe?) then (No)
      :Procesar solicitud;
      :Almacenar Idempotency-Key;
      :Enviar respuesta exitosa;
    else (Sí)
      :Rechazar solicitud duplicada
      (código 409 Conflict);
    endif
  else (No)
    :Rechazar solicitud con error
    (código 400 Bad Request);
  endif
}

partition "Manejo de Errores" {
  if (¿Error en el procesamiento?) then (Sí)
    :Registrar error;
    :Notificar al canal
    (código 500 Internal Server Error);
  endif
}

partition "Canales" {
  :Recibir respuesta;
  if (¿Respuesta exitosa?) then (Sí)
    :Mostrar resultado al usuario;
  else (No)
    if (¿Error 409?) then (Sí)
      :Informar al usuario:
      "Solicitud ya procesada";
    else (No)
      :Informar al usuario:
      "Error en la solicitud";
    endif
  endif
}

stop

@enduml
```

## Actores
- **Canales**: Sistemas que envían solicitudes al core bancario (móvil, web, cajeros automáticos).
- **Core Bancario**: Sistema central que procesa las solicitudes y devuelve respuestas.

## Puntos de Decisión
1. **Validación de Solicitud**:
   - **Condición**: La solicitud debe cumplir con el esquema JSON definido en el contrato OpenAPI.
   - **Acción si falla**: Rechazar con código `400 Bad Request`.

2. **Idempotencia**:
   - **Condición**: Verificar si el `Idempotency-Key` ya existe en el core.
   - **Acción si existe**: Rechazar con código `409 Conflict`.

3. **Procesamiento de la Solicitud**:
   - **Condición**: La solicitud es válida y no duplicada.
   - **Acción**: Procesar la solicitud y enviar respuesta exitosa.

4. **Manejo de Errores**:
   - **Condición**: Error durante el procesamiento.
   - **Acción**: Registrar el error y notificar al canal con código `500 Internal Server Error`.

## Pasos del Proceso
1. **Envío de Solicitud**:
   - Los canales envían una solicitud al core bancario (ej. transferencia, consulta de saldo).
   - La solicitud incluye un header `Idempotency-Key` para garantizar la idempotencia.

2. **Validación Inicial**:
   - El core valida la solicitud contra el esquema JSON definido en el contrato OpenAPI.
   - Si la solicitud es inválida, se rechaza con código `400 Bad Request`.

3. **Validación de Idempotencia**:
   - El core verifica si el `Idempotency-Key` ya existe en su caché.
   - Si existe, se rechaza la solicitud con código `409 Conflict`.

4. **Procesamiento de la Solicitud**:
   - Si la solicitud es válida y no duplicada, el core la procesa.
   - Se almacena el `Idempotency-Key` en la caché para evitar reprocesamiento.
   - Se envía una respuesta exitosa al canal.

5. **Manejo de Errores**:
   - Si ocurre un error durante el procesamiento, se registra y se notifica al canal con código `500 Internal Server Error`.

6. **Respuesta al Usuario**:
   - Los canales reciben la respuesta y muestran el resultado al usuario.
   - En caso de error, se informa al usuario con un mensaje adecuado.

## Manejo de Idempotencia
- **Header `Idempotency-Key`**: Las solicitudes incluyen un header `Idempotency-Key` para identificar solicitudes duplicadas.
- **Caché de Claves**: El core almacena las claves de idempotencia en una caché con TTL para evitar reprocesamiento.
- **Código 409 Conflict**: Si se detecta una solicitud duplicada, se rechaza con este código.

## Manejo de Errores
- **Códigos de Error**:
  - `400 Bad Request`: Solicitud inválida (ej. datos incorrectos).
  - `409 Conflict`: Solicitud duplicada.
  - `500 Internal Server Error`: Error en el procesamiento.
- **Logs Estructurados**: Los errores se registran con detalles suficientes para su análisis.
- **Notificación a Canales**: Los canales reciben códigos de error descriptivos para tomar acciones correctivas.


// === ARCHIVO: README.md ===
# Arquitectura de Integración: Core Bancario - Canales

## Decisión Arquitectónica: Orquestación vs. Coreografía

### Orquestación
- **Descripción**: Un componente central (orquestador) coordina la interacción entre el core bancario y los canales.
- **Ventajas**:
  - Control centralizado del flujo de negocio.
  - Facilita la implementación de lógica compleja y transaccional.
  - Simplifica el manejo de errores y la recuperación.
- **Desventajas**:
  - El orquestador puede convertirse en un cuello de botella.
  - Mayor complejidad en la implementación y mantenimiento.

### Coreografía
- **Descripción**: Cada sistema (core y canales) publica y suscribe eventos, coordinando la interacción de manera descentralizada.
- **Ventajas**:
  - Escalabilidad horizontal y desacoplamiento entre sistemas.
  - Menor dependencia de un componente central.
  - Flexibilidad para agregar nuevos canales o servicios.
- **Desventajas**:
  - Dificultad para implementar lógica transaccional compleja.
  - Mayor complejidad en el manejo de errores y la consistencia.

### Decisión Adoptada
Se eligió **orquestación** para esta integración, dado que:
- El core bancario necesita controlar el flujo de negocio de manera centralizada para garantizar la consistencia de las transacciones.
- La lógica de idempotencia y manejo de errores es más sencilla de implementar con un orquestador.
- Los canales no requieren autonomía completa, ya que su función principal es enviar solicitudes y recibir respuestas.

## Estándares Utilizados

### BIAN (Banking Industry Architecture Network)
- **Uso**: Se alinea la estructura de los endpoints y los esquemas de datos con los estándares BIAN para asegurar interoperabilidad con otros sistemas bancarios.
- **Ejemplo**: Los endpoints siguen la nomenclatura BIAN para operaciones financieras (ej. `/current-account`, `/payments`).

### ISO 20022
- **Uso**: Se adoptan los esquemas de datos y formatos definidos por ISO 20022 para mensajes financieros.
- **Ejemplo**: Los campos como `IBAN`, `BIC` y `monto` siguen el formato ISO 20022.

### OpenAPI 3.1
- **Uso**: El contrato de API se define en OpenAPI 3.1, especificando endpoints, esquemas de datos, códigos de error y ejemplos.
- **Ventajas**:
  - Documentación clara y validable.
  - Herramientas como Swagger UI y Redocly para visualización y validación.
  - Generación automática de código cliente y servidor.

## Garantía de Idempotencia

### Header `Idempotency-Key`
- **Descripción**: Las solicitudes incluyen un header `Idempotency-Key` para identificar solicitudes duplicadas.
- **Formato**: UUID v4.
- **Validación**: El core bancario valida la existencia de la clave en una caché con TTL.
- **Respuesta**: Si la clave existe, se rechaza la solicitud con código `409 Conflict`.

### Caché de Claves
- **Almacenamiento**: Las claves de idempotencia se almacenan en una caché distribuida (ej. Redis).
- **TTL**: Cada clave tiene un Time To Live (TTL) de 24 horas para evitar almacenamiento infinito.

## Manejo de Errores

### Códigos de Error
- **400 Bad Request**: Solicitud inválida (ej. datos incorrectos, formato inválido).
- **409 Conflict**: Solicitud duplicada (idempotencia).
- **500 Internal Server Error**: Error en el procesamiento del core bancario.

### Estrategias de Mitigación
- **Retries**: Los canales implementan retries con backoff exponencial para manejar timeouts temporales.
- **Circuit Breaker**: Se usa un circuito breaker para evitar sobrecargar el core en caso de fallos prolongados.
- **Logs Estructurados**: Los errores se registran con detalles suficientes para su análisis.
- **Alertas**: Se monitorea la latencia y disponibilidad de los endpoints del core, con alertas automáticas.

## Estructura del Proyecto

```
/
├── contrato/
│   └── openapi.yaml          # Contrato OpenAPI 3.1
├── mapeo/
│   └── mapeo-de-datos.csv    # Mapeo de datos origen-destino
├── validacion/
│   └── criterios-de-aceptacion.feature  # Escenarios Gherkin
├── riesgos/
│   └── analisis-de-riesgo.md  # Análisis de riesgo
├── proceso.bpmn.md           # Flujo de negocio en BPMN
└── README.md                 # Decisión arquitectónica y trade-offs
```

## Validación del Contrato
El contrato OpenAPI se valida usando Redocly CLI:

```bash
npx --yes @redocly/cli lint contrato/openapi.yaml
```

## Próximos Pasos
1. Implementar la lógica de idempotencia en el core bancario.
2. Desarrollar el manejo de errores y excepciones.
3. Validar el contrato OpenAPI con los canales.
4. Realizar pruebas de integración y carga.
```
