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