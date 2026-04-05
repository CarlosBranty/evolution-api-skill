# Evolution API — 07: Webhooks y Eventos (Webhooks & Events)

> Usa este archivo para: configurar cómo la Evolution API notifica eventos — via Webhook HTTP, WebSocket, RabbitMQ, SQS, NATS o Pusher.

**Lista de eventos disponibles** (usados en todas las integraciones):
```
APPLICATION_STARTUP, QRCODE_UPDATED, MESSAGES_SET, MESSAGES_UPSERT,
MESSAGES_UPDATE, MESSAGES_DELETE, SEND_MESSAGE, CONTACTS_SET,
CONTACTS_UPSERT, CONTACTS_UPDATE, PRESENCE_UPDATE, CHATS_SET,
CHATS_UPSERT, CHATS_UPDATE, CHATS_DELETE, GROUPS_UPSERT,
GROUP_UPDATE, GROUP_PARTICIPANTS_UPDATE, CONNECTION_UPDATE,
LABELS_EDIT, LABELS_ASSOCIATION, CALL, TYPEBOT_START, TYPEBOT_CHANGE_STATUS
```

---

## Webhook HTTP

### Configurar Webhook
**POST** `{{baseUrl}}/webhook/set/{{instance}}`

```json
{
    "webhook": {
        "enabled": true,
        "url": "https://mi-servidor.com/webhook",
        "headers": {
            "autorization": "Bearer TOKEN",
            "Content-Type": "application/json"
        },
        "byEvents": false,
        "base64": false,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE",
            "SEND_MESSAGE"
        ]
    }
}
```

- `byEvents: true` → envia a URLs distintas por evento (`url/MESSAGES_UPSERT`, etc.)
- `base64: true` → archivos multimedia en base64 en el payload

### Ver Webhook configurado
**GET** `{{baseUrl}}/webhook/find/{{instance}}`

---

## WebSocket

### Configurar WebSocket
**POST** `{{baseUrl}}/websocket/set/{{instance}}`

```json
{
    "websocket": {
        "enabled": true,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE"
        ]
    }
}
```

### Ver WebSocket configurado
**GET** `{{baseUrl}}/websocket/find/{{instance}}`

---

## RabbitMQ

### Configurar RabbitMQ
**POST** `{{baseUrl}}/rabbitmq/set/{{instance}}`

```json
{
    "rabbitmq": {
        "enabled": true,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE"
        ]
    }
}
```

### Ver RabbitMQ configurado
**GET** `{{baseUrl}}/rabbitmq/find/{{instance}}`

---

## Amazon SQS

### Configurar SQS
**POST** `{{baseUrl}}/sqs/set/{{instance}}`

```json
{
    "sqs": {
        "enabled": true,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE"
        ]
    }
}
```

### Ver SQS configurado
**GET** `{{baseUrl}}/sqs/find/{{instance}}`

---

## NATS

### Configurar NATS
**POST** `{{baseUrl}}/nats/set/{{instance}}`

```json
{
    "sqs": {
        "enabled": true,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE"
        ]
    }
}
```

### Ver NATS configurado
**GET** `{{baseUrl}}/nats/find/{{instance}}`

---

## Pusher

### Configurar Pusher
**POST** `{{baseUrl}}/pusher/set/{{instance}}`

```json
{
    "sqs": {
        "enabled": true,
        "events": [
            "MESSAGES_UPSERT",
            "CONNECTION_UPDATE"
        ]
    }
}
```

### Ver Pusher configurado
**GET** `{{baseUrl}}/pusher/find/{{instance}}`
