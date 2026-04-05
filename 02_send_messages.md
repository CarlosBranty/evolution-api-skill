# Evolution API — 02: Envío de Mensajes (Send Message)

> Usa este archivo para: enviar cualquier tipo de mensaje de WhatsApp — texto, imágenes, audio, video, documentos, stickers, ubicación, contactos, reacciones, encuestas, listas, botones, estados/stories.

**Nota:** El campo `number` acepta formato `5511999990000` (sin `+`). Para grupos usar `{{groupJid}}@g.us`.

---

## Enviar texto
**POST** `{{baseUrl}}/message/sendText/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "text": "Hola, este es un mensaje de prueba"
}
```

**Opciones adicionales (comentadas):**
```json
{
    "number": "{{remoteJid}}",
    "text": "Mensaje",
    "delay": 1200,
    "quoted": {
        "key": { "id": "MESSAGE_ID" },
        "message": { "conversation": "CONTENT_MESSAGE" }
    },
    "linkPreview": false,
    "mentionsEveryOne": false,
    "mentioned": ["{{remoteJid}}"]
}
```

---

## Enviar imagen/video/documento (por URL o base64)
**POST** `{{baseUrl}}/message/sendMedia/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "mediatype": "image",
    "mimetype": "image/png",
    "caption": "Descripción de la imagen",
    "media": "https://ejemplo.com/imagen.jpg",
    "fileName": "imagen.png"
}
```

- `mediatype`: `"image"` | `"video"` | `"document"`
- `media`: URL pública o string base64

---

## Enviar archivo (multipart/form-data)
**POST** `{{baseUrl}}/message/sendMedia/{{instance}}`

Enviar como `form-data` con los campos `number` y `file`.

---

## Enviar video circular (PTV - Play To View)
**POST** `{{baseUrl}}/message/sendPtv/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "video": "https://evolution-api.com/files/video.mp4",
    "delay": 1200
}
```

---

## Enviar audio de WhatsApp (voz narrada)
**POST** `{{baseUrl}}/message/sendWhatsAppAudio/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "audio": "https://evolution-api.com/files/audio.mp3",
    "encoding": true
}
```

- `encoding: true` convierte el audio al formato de voz de WhatsApp.

---

## Enviar sticker
**POST** `{{baseUrl}}/message/sendSticker/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "sticker": "https://evolution-api.com/files/sticker.png"
}
```

---

## Enviar ubicación
**POST** `{{baseUrl}}/message/sendLocation/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "name": "Nombre del lugar",
    "address": "Dirección completa",
    "latitude": -16.505538,
    "longitude": -151.742277
}
```

---

## Enviar contacto(s)
**POST** `{{baseUrl}}/message/sendContact/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "contact": [
        {
            "fullName": "Nombre Completo",
            "wuid": "559999999999",
            "phoneNumber": "+55 99 9 9999-9999",
            "organization": "Empresa (opcional)",
            "email": "email@ejemplo.com",
            "url": "https://sitio.com"
        }
    ]
}
```

---

## Enviar reacción a un mensaje
**POST** `{{baseUrl}}/message/sendReaction/{{instance}}`

```json
{
    "key": {
        "remoteJid": "{{remoteJid}}@s.whatsapp.net",
        "fromMe": true,
        "id": "BAE5A75CB0F39712"
    },
    "reaction": "🚀"
}
```

---

## Enviar encuesta (Poll)
**POST** `{{baseUrl}}/message/sendPoll/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "name": "¿Cuál es tu favorito?",
    "selectableCount": 1,
    "values": ["Opción 1", "Opción 2", "Opción 3"]
}
```

---

## Enviar lista interactiva
**POST** `{{baseUrl}}/message/sendList/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "title": "Título de la lista",
    "description": "Descripción",
    "buttonText": "Ver opciones",
    "footerText": "Pie de página",
    "sections": [
        {
            "title": "Sección 1",
            "rows": [
                {
                    "title": "Opción A",
                    "description": "Descripción de la opción",
                    "rowId": "opcion_a"
                }
            ]
        }
    ]
}
```

---

## Enviar botones
**POST** `{{baseUrl}}/message/sendButtons/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "title": "Título",
    "description": "Descripción del mensaje",
    "footer": "Pie de página",
    "buttons": [
        {
            "type": "reply",
            "displayText": "Confirmar",
            "id": "btn_confirmar"
        },
        {
            "type": "url",
            "displayText": "Visitar sitio",
            "url": "https://ejemplo.com"
        },
        {
            "type": "call",
            "displayText": "Llamar",
            "phoneNumber": "5511999990000"
        },
        {
            "type": "copy",
            "displayText": "Copiar código",
            "copyCode": "CODIGO123"
        }
    ]
}
```

---

## Enviar estado/story
**POST** `{{baseUrl}}/message/sendStatus/{{instance}}`

```json
{
    "type": "text",
    "content": "¡Hola! ¿Cómo están hoy?",
    "caption": "Solo para imagen o video",
    "backgroundColor": "#008000",
    "font": 1,
    "allContacts": false,
    "statusJidList": ["{{remoteJid}}@s.whatsapp.net"]
}
```

- `type`: `"text"` | `"image"` | `"video"` | `"audio"`
- `font` (solo para texto): `1=SERIF`, `2=NORICAN_REGULAR`, `3=BRYNDAN_WRITE`, `4=BEBASNEUE_REGULAR`, `5=OSWALD_HEAVY`
