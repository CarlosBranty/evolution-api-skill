# Evolution API — 10: Cloud API Oficial & Templates (WhatsApp Business)

> Usa este archivo para: enviar templates de WhatsApp Business (Cloud API oficial), crear y consultar plantillas de mensaje.
> ⚠️ Estos endpoints solo funcionan con instancias configuradas como `WHATSAPP-BUSINESS`.

---

## Enviar template existente
**POST** `{{baseUrl}}/message/sendTemplate/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "name": "hello_world",
    "language": "en_US",
    "components": [
        {
            "type": "body",
            "parameters": [
                { "type": "text", "text": "Juan" },
                { "type": "text", "text": "email@ejemplo.com" }
            ]
        },
        {
            "type": "button",
            "sub_type": "URL",
            "index": "1",
            "parameters": [
                { "type": "text", "text": "/reset-password/1234" }
            ]
        }
    ]
}
```

- `name`: nombre del template aprobado en Meta
- `language`: código de idioma, ej: `"en_US"`, `"es"`, `"pt_BR"`
- `components`: variables para rellenar el template

---

## Crear template nuevo
**POST** `{{baseUrl}}/template/create/{{instance}}`

```json
{
    "name": "mi_template",
    "category": "MARKETING",
    "allowCategoryChange": false,
    "language": "en_US",
    "components": [
        {
            "type": "BODY",
            "text": "Hola {{1}}, tu número de confirmación es {{2}}. Gracias por tu compra.",
            "example": {
                "body_text": [
                    ["Juan", "860198-230332"]
                ]
            }
        },
        {
            "type": "BUTTONS",
            "buttons": [
                {
                    "type": "QUICK_REPLY",
                    "text": "Cancelar suscripción"
                },
                {
                    "type": "URL",
                    "text": "Contactar soporte",
                    "url": "https://miempresa.com/soporte"
                }
            ]
        }
    ]
}
```

**Categorías disponibles:**
- `"AUTHENTICATION"` — Mensajes de autenticación (OTP, verificación)
- `"MARKETING"` — Promociones y ofertas
- `"UTILITY"` — Notificaciones transaccionales

**Tipos de botones:**
- `"QUICK_REPLY"` — Respuesta rápida
- `"URL"` — Abrir URL
- `"PHONE_NUMBER"` — Llamar número

---

## Listar templates
**GET** `{{baseUrl}}/template/find/{{instance}}`

Retorna todos los templates aprobados de la cuenta de WhatsApp Business.

---

## Webhook de Evolution Channel (recibir mensajes de canal externo)
**POST** `{{baseUrl}}/webhook/evolution`

Formato para recibir mensajes desde un canal externo hacia Evolution API:
```json
{
    "numberId": "{{number}}",
    "key": {
        "remoteJid": "{{remoteJid}}",
        "fromMe": false,
        "id": "ABC1234"
    },
    "pushName": "Nombre del Contacto",
    "message": {
        "conversation": "Texto del mensaje"
    },
    "messageType": "conversation"
}
```

Para mensajes con media:
```json
{
    "message": {
        "imageMessage": {
            "caption": "¿Qué hay en esta foto?"
        },
        "mediaUrl": "https://ejemplo.com/imagen.jpg"
    },
    "messageType": "imageMessage"
}
```

- `messageType`: `"conversation"`, `"imageMessage"`, `"videoMessage"`, `"documentMessage"`, `"audioMessage"`
