# Evolution API — 03: Gestión de Chats (Chat)

> Usa este archivo para: verificar números WhatsApp, leer/archivar mensajes, buscar contactos, bloquear usuarios, obtener medios en base64, actualizar mensajes, enviar presencia (escribiendo...).

---

## Verificar si número tiene WhatsApp
**POST** `{{baseUrl}}/chat/whatsappNumbers/{{instance}}`

```json
{
    "numbers": [
        "55911111111",
        "55922222222",
        "55933333333"
    ]
}
```

Retorna cuáles números están registrados en WhatsApp.

---

## Marcar mensajes como leídos
**POST** `{{baseUrl}}/chat/markMessageAsRead/{{instance}}`

```json
{
    "readMessages": [
        {
            "remoteJid": "123@s.whatsapp.net",
            "fromMe": false,
            "id": "80C4CE9B72F797DBC6ECD8D19B247FC9"
        }
    ]
}
```

---

## Archivar / Desarchivar chat
**POST** `{{baseUrl}}/chat/archiveChat/{{instance}}`

```json
{
    "lastMessage": {
        "key": {
            "remoteJid": "123@s.whatsapp.net",
            "fromMe": false,
            "id": "80C4CE9B72F797DBC6ECD8D19B247FC9"
        }
    },
    "chat": "123@s.whatsapp.net",
    "archive": true
}
```

- `archive: true` → archivar
- `archive: false` → desarchivar

---

## Marcar chat como no leído
**POST** `{{baseUrl}}/chat/markChatUnread/{{instance}}`

```json
{
    "lastMessage": {
        "key": {
            "remoteJid": "123@s.whatsapp.net",
            "fromMe": false,
            "id": "80C4CE9B72F797DBC6ECD8D19B247FC9"
        }
    },
    "chat": "123@s.whatsapp.net"
}
```

---

## Eliminar mensaje para todos
**DELETE** `{{baseUrl}}/chat/deleteMessageForEveryone/{{instance}}`

```json
{
    "id": "MESSAGE_ID",
    "remoteJid": "123@s.whatsapp.net",
    "fromMe": true,
    "participant": "participante_opcional"
}
```

---

## Obtener foto de perfil de un contacto
**POST** `{{baseUrl}}/chat/fetchProfilePictureUrl/{{instance}}`

```json
{
    "number": "{{remoteJid}}"
}
```

---

## Obtener base64 de un mensaje multimedia
**POST** `{{baseUrl}}/chat/getBase64FromMediaMessage/{{instance}}`

```json
{
    "message": {
        "key": { "id": "3EB0F4A1F841F02958FB74" }
    },
    "convertToMp4": false
}
```

- `convertToMp4: true` → convierte audio OGG a MP4
- ⚠️ El mensaje debe estar almacenado en MongoDB o en archivo.

---

## Editar un mensaje enviado
**POST** `{{baseUrl}}/chat/updateMessage/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "key": {
        "remoteJid": "123@s.whatsapp.net",
        "fromMe": true,
        "id": "3EB04DC69D97835D7CC6F12776D25766FBC224E2"
    },
    "text": "nuevo contenido del mensaje"
}
```

---

## Enviar indicador de presencia ("escribiendo...")
**POST** `{{baseUrl}}/chat/sendPresence/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "delay": 1200,
    "presence": "composing"
}
```

- `presence`: `"composing"` (escribiendo) | `"recording"` (grabando) | `"paused"`

---

## Bloquear / Desbloquear contacto
**POST** `{{baseUrl}}/message/updateBlockStatus/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "status": "block"
}
```

- `status`: `"block"` | `"unblock"`

---

## Buscar contactos
**POST** `{{baseUrl}}/chat/findContacts/{{instance}}`

```json
{
    "where": {
        "id": "{{remoteJid}}"
    }
}
```

- Omitir `"id"` para listar todos los contactos.

---

## Buscar mensajes
**POST** `{{baseUrl}}/chat/findMessages/{{instance}}`

```json
{
    "where": {
        "key": {
            "remoteJid": "{{remoteJid}}"
        }
    },
    "page": 1,
    "offset": 10
}
```

- Sin MongoDB activo, solo funciona con `"key.id"`.

---

## Buscar mensajes de estado
**POST** `{{baseUrl}}/chat/findStatusMessage/{{instance}}`

```json
{
    "where": {
        "remoteJid": "123@s.whatsapp.net",
        "id": "BAE5959535174C7E"
    },
    "page": 1,
    "offset": 10
}
```

---

## Listar todos los chats
**POST** `{{baseUrl}}/chat/findChats/{{instance}}`

Sin body requerido.
