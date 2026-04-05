# Evolution API — 11: Misceláneos (Labels, Llamadas, S3, Métricas)

> Usa este archivo para: etiquetas de contactos, llamadas falsas (notificación), acceso a medios en S3, métricas del servidor.

---

## Labels (Etiquetas) — Solo WhatsApp Business

### Listar etiquetas disponibles
**GET** `{{baseUrl}}/label/findLabels/{{instance}}`

Retorna las etiquetas configuradas en la cuenta de WhatsApp Business.

### Agregar o quitar etiqueta de un chat
**POST** `{{baseUrl}}/label/handleLabel/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "labelId": "id_de_la_etiqueta",
    "action": "add"
}
```

- `action`: `"add"` | `"remove"`

---

## Llamada falsa (notificación de llamada)
**POST** `{{baseUrl}}/call/offer/{{instance}}`

```json
{
    "number": "{{remoteJid}}",
    "isVideo": false,
    "callDuration": 3
}
```

- `isVideo: false` → llamada de voz
- `isVideo: true` → videollamada
- `callDuration`: duración en segundos de la notificación

⚠️ Esto simula una notificación de llamada perdida, no establece una llamada real.

---

## S3 / Almacenamiento de medios

### Obtener media almacenada
**POST** `{{baseUrl}}/s3/getMedia/{{instance}}`

```json
{
    "id": "id_del_media",
    "type": "tipo_opcional",
    "messageId": "id_del_mensaje_opcional"
}
```

### Obtener URL firmada de media
**POST** `{{baseUrl}}/s3/getMediaUrl/{{instance}}`

```json
{
    "id": "clykhoqq70003pmm88bb6eejd"
}
```

Retorna una URL temporal para acceder al archivo en S3.

---

## Información del servidor

### Ver información general
**GET** `{{baseUrl}}`

Retorna versión de la API, estado y configuración general.

---

## Métricas (Prometheus)
**GET** `{{baseUrl}}/metrics`

Autenticación: `Basic Auth`

Retorna métricas en formato Prometheus para monitoreo con Grafana u otras herramientas.
