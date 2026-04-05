# Evolution API — 01: Instancias (Instance)

> Usa este archivo para: crear instancias, conectar WhatsApp, verificar estado, reiniciar, cerrar sesión o eliminar instancias.

---

## Crear instancia
**POST** `{{baseUrl}}/instance/create`

```json
{
    "instanceName": "{{instance}}",
    "qrcode": true,
    "integration": "WHATSAPP-BAILEYS"
    // Opciones de integración: "WHATSAPP-BAILEYS" | "WHATSAPP-BUSINESS" | "EVOLUTION"
}
```

**Campos opcionales:**
```json
{
    "token": "{{apikey}}",
    "number": "{{number}}",
    "rejectCall": false,
    "msgCall": "",
    "groupsIgnore": false,
    "alwaysOnline": false,
    "readMessages": false,
    "readStatus": false,
    "syncFullHistory": false,
    "proxyHost": "",
    "proxyPort": "",
    "proxyProtocol": "",
    "proxyUsername": "",
    "proxyPassword": "",
    "webhook": {
        "url": "",
        "byEvents": false,
        "base64": true,
        "headers": { "autorization": "Bearer TOKEN", "Content-Type": "application/json" },
        "events": ["MESSAGES_UPSERT", "CONNECTION_UPDATE"]
    },
    "chatwootAccountId": "1",
    "chatwootToken": "TOKEN",
    "chatwootUrl": "https://chatoot.com",
    "chatwootSignMsg": true
}
```

---

## Listar instancias
**GET** `{{baseUrl}}/instance/fetchInstances`

Query params opcionales:
| Param | Descripción |
|---|---|
| `instanceName` | Filtrar por nombre |
| `instanceId` | Filtrar por ID |

---

## Conectar instancia (obtener QR)
**GET** `{{baseUrl}}/instance/connect/{{instance}}`

Query param opcional:
| Param | Descripción |
|---|---|
| `number` | Número para conexión directa sin QR |

---

## Reiniciar instancia
**POST** `{{baseUrl}}/instance/restart/{{instance}}`

Sin body.

---

## Definir presencia global
**POST** `{{baseUrl}}/instance/setPresence/{{instance}}`

```json
{
    "presence": "available"
    // Opciones: "available" | "unavailable"
}
```

---

## Estado de conexión
**GET** `{{baseUrl}}/instance/connectionState/{{instance}}`

Retorna el estado actual: `open`, `connecting`, `close`.

---

## Cerrar sesión (logout)
**DELETE** `{{baseUrl}}/instance/logout/{{instance}}`

Desconecta WhatsApp sin eliminar la instancia.

---

## Eliminar instancia
**DELETE** `{{baseUrl}}/instance/delete/{{instance}}`

⚠️ Elimina la instancia permanentemente.
