# Evolution API — 09: Chatwoot

> Usa este archivo para: integrar la instancia de WhatsApp con Chatwoot (plataforma de atención al cliente).

---

## Configurar integración con Chatwoot
**POST** `{{baseUrl}}/chatwoot/set/{{instance}}`

```json
{
    "enabled": true,
    "accountId": "1",
    "token": "TOKEN_DE_CHATWOOT",
    "url": "https://mi-chatwoot.com",
    "signMsg": true,
    "reopenConversation": true,
    "conversationPending": false,
    "nameInbox": "evolution",
    "mergeBrazilContacts": true,
    "importContacts": true,
    "importMessages": true,
    "daysLimitImportMessages": 2,
    "signDelimiter": "\n",
    "autoCreate": true,
    "organization": "Mi Empresa",
    "logo": "https://mi-logo.com/logo.png",
    "ignoreJids": [
        "@g.us"
    ]
}
```

**Descripción de campos:**

| Campo | Tipo | Descripción |
|---|---|---|
| `enabled` | boolean | Activar/desactivar integración |
| `accountId` | string | ID de cuenta en Chatwoot |
| `token` | string | Token de acceso de Chatwoot |
| `url` | string | URL de tu instancia Chatwoot |
| `signMsg` | boolean | Firmar mensajes con nombre del agente |
| `reopenConversation` | boolean | Reabrir conversación si el contacto escribe de nuevo |
| `conversationPending` | boolean | Iniciar conversaciones en estado "pendiente" |
| `nameInbox` | string | Nombre de la bandeja de entrada en Chatwoot |
| `mergeBrazilContacts` | boolean | Fusionar contactos con código de Brasil (+55) |
| `importContacts` | boolean | Importar contactos de WhatsApp a Chatwoot |
| `importMessages` | boolean | Importar historial de mensajes |
| `daysLimitImportMessages` | number | Días atrás para importar mensajes |
| `signDelimiter` | string | Separador para la firma del agente |
| `autoCreate` | boolean | Crear conversación automáticamente |
| `organization` | string | Nombre de la organización |
| `logo` | string | URL del logo de la organización |
| `ignoreJids` | array | JIDs a ignorar (ej: grupos `@g.us`) |

---

## Ver configuración de Chatwoot
**GET** `{{baseUrl}}/chatwoot/find/{{instance}}`
