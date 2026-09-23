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