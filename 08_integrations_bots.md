# Evolution API — 08: Integraciones con Bots

> Usa este archivo para: integrar la instancia con plataformas de bots — Typebot, Evolution Bot, OpenAI, Dify, Flowise, N8N, EvoAI.

**Patrón común de todos los bots:**
- Todos tienen CRUD: `create`, `find`, `fetch/:id`, `update/:id`, `delete/:id`
- Todos tienen: `settings` (config global), `fetchSettings`, `fetchSessions/:botId`, `changeStatus`
- El `triggerType` y `triggerOperator` controlan cuándo se activa el bot.

**Campos comunes de trigger y comportamiento:**
```json
{
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "hola",
    "expire": 20,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "unknownMessage": "Mensaje no reconocido",
    "listeningFromMe": false,
    "stopBotFromMe": false,
    "keepOpen": false,
    "debounceTime": 10,
    "ignoreJids": []
}
```

- `triggerType`: `"all"` (cualquier mensaje) | `"keyword"` (por palabra clave)
- `triggerOperator`: `"contains"`, `"equals"`, `"startsWith"`, `"endsWith"`, `"regex"`, `"none"`
- `expire`: minutos de inactividad antes de cerrar sesión
- `keywordFinish`: palabra para que el usuario finalice el bot
- `debounceTime`: segundos que espera antes de procesar (para agrupar mensajes)

---

## Typebot

### Crear bot
**POST** `{{baseUrl}}/typebot/create/{{instance}}`
```json
{
    "enabled": true,
    "url": "https://bot.miservidor.com",
    "typebot": "mi-typebot-id",
    "triggerType": "keyword",
    "triggerOperator": "regex",
    "triggerValue": "^atend.*",
    "expire": 20,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "unknownMessage": "Mensaje no reconocido",
    "listeningFromMe": false,
    "stopBotFromMe": false,
    "keepOpen": false,
    "debounceTime": 10
}
```

### Iniciar sesión de Typebot manualmente
**POST** `{{baseUrl}}/typebot/start/{{instance}}`
```json
{
    "url": "https://bot.miservidor.com",
    "typebot": "mi-typebot-id",
    "remoteJid": "557499879409@s.whatsapp.net",
    "startSession": false,
    "variables": [
        { "name": "pushName", "value": "Nombre Usuario" }
    ]
}
```

### Cambiar estado de sesión
**POST** `{{baseUrl}}/typebot/changeStatus/{{instance}}`
```json
{
    "remoteJid": "5511912345678@s.whatsapp.net",
    "status": "closed"
}
```
- `status`: `"opened"` | `"paused"` | `"closed"`

### Ver sesiones activas
**GET** `{{baseUrl}}/typebot/fetchSessions/:typebotId/{{instance}}`

### Config global de Typebot
**POST** `{{baseUrl}}/typebot/settings/{{instance}}`
```json
{
    "expire": 20,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "unknownMessage": "Mensaje no reconocido",
    "listeningFromMe": false,
    "stopBotFromMe": false,
    "keepOpen": false,
    "debounceTime": 10,
    "ignoreJids": [],
    "typebotIdFallback": "id_del_bot_fallback"
}
```

**GET** `{{baseUrl}}/typebot/fetchSettings/{{instance}}`
**GET** `{{baseUrl}}/typebot/find/{{instance}}`
**GET** `{{baseUrl}}/typebot/fetch/:typebotId/{{instance}}`
**PUT** `{{baseUrl}}/typebot/update/:typebotId/{{instance}}`
**DELETE** `{{baseUrl}}/typebot/delete/:typebotId/{{instance}}`

---

## Evolution Bot (bot propio via API)

### Crear bot
**POST** `{{baseUrl}}/evolutionBot/create/{{instance}}`
```json
{
    "enabled": true,
    "apiUrl": "http://mi-api.com/v1",
    "apiKey": "app-123456",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 0,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "unknownMessage": "Mensaje no reconocido",
    "listeningFromMe": false,
    "stopBotFromMe": false,
    "keepOpen": false,
    "debounceTime": 0,
    "ignoreJids": []
}
```

**POST** `{{baseUrl}}/evolutionBot/settings/{{instance}}` | **GET** `{{baseUrl}}/evolutionBot/fetchSettings/{{instance}}`
**POST** `{{baseUrl}}/evolutionBot/changeStatus/{{instance}}` | **GET** `{{baseUrl}}/evolutionBot/fetchSessions/:evolutionBotId/{{instance}}`
**GET** `{{baseUrl}}/evolutionBot/find/{{instance}}` | **GET** `{{baseUrl}}/evolutionBot/fetch/:evolutionBotId/{{instance}}`
**PUT** `{{baseUrl}}/evolutionBot/update/:evolutionBotId/{{instance}}` | **DELETE** `{{baseUrl}}/evolutionBot/delete/:evolutionBotId/{{instance}}`

---

## OpenAI

### Configurar credenciales OpenAI
**POST** `{{baseUrl}}/openai/creds/{{instance}}`
```json
{
    "name": "mi-apikey",
    "apiKey": "sk-proj-..."
}
```
**GET** `{{baseUrl}}/openai/creds/{{instance}}`
**DELETE** `{{baseUrl}}/openai/creds/:openaiCredsId/{{instance}}`

### Crear bot OpenAI
**POST** `{{baseUrl}}/openai/create/{{instance}}`
```json
{
    "enabled": true,
    "openaiCredsId": "clyrx36wj0001119ucjjzxik1",
    "botType": "assistant",
    "assistantId": "asst_LRNyh6qC4qq8NTyPjHbcJjSp",
    "functionUrl": "https://n8n.miservidor.com",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 20,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "listeningFromMe": false,
    "keepOpen": false,
    "debounceTime": 10,
    "ignoreJids": []
}
```

Para `botType: "chatCompletion"`, usar en lugar de `assistantId`:
```json
{
    "model": "gpt-4o",
    "systemMessages": ["Eres un asistente útil."],
    "assistantMessages": ["¡Hola! ¿En qué puedo ayudarte?"],
    "userMessages": ["Hola!"],
    "maxTokens": 300
}
```

**POST** `{{baseUrl}}/openai/settings/{{instance}}` | **GET** `{{baseUrl}}/openai/fetchSettings/{{instance}}`
**POST** `{{baseUrl}}/openai/changeStatus/{{instance}}` | **GET** `{{baseUrl}}/openai/fetchSessions/:openaiBotId/{{instance}}`
**GET** `{{baseUrl}}/openai/find/{{instance}}` | **GET** `{{baseUrl}}/openai/fetch/:openaiBotId/{{instance}}`
**PUT** `{{baseUrl}}/openai/update/:openaiBotId/{{instance}}` | **DELETE** `{{baseUrl}}/openai/delete/:openaiBotId/{{instance}}`

---

## Dify

### Crear bot Dify
**POST** `{{baseUrl}}/dify/create/{{instance}}`
```json
{
    "enabled": true,
    "botType": "chatBot",
    "apiUrl": "http://dify.miservidor.com/v1",
    "apiKey": "app-123456",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 0,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "unknownMessage": "Mensaje no reconocido",
    "listeningFromMe": false,
    "keepOpen": false,
    "debounceTime": 0,
    "ignoreJids": []
}
```
- `botType`: `"chatBot"` | `"textGenerator"` | `"agent"` | `"workflow"`

**POST** `{{baseUrl}}/dify/settings/{{instance}}` | **GET** `{{baseUrl}}/dify/fetchSettings/{{instance}}`
**GET** `{{baseUrl}}/dify/find/{{instance}}` | **GET** `{{baseUrl}}/dify/fetch/:difyId/{{instance}}`
**PUT** `{{baseUrl}}/dify/update/:difyId/{{instance}}` | **DELETE** `{{baseUrl}}/dify/delete/:difyId/{{instance}}`

---

## Flowise

### Crear bot Flowise
**POST** `{{baseUrl}}/flowise/create/{{instance}}`
```json
{
    "enabled": true,
    "apiUrl": "http://flowise.miservidor.com/v1",
    "apiKey": "app-123456",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 0,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "listeningFromMe": false,
    "keepOpen": false,
    "debounceTime": 0,
    "ignoreJids": []
}
```

**GET** `{{baseUrl}}/flowise/find/{{instance}}` | **GET** `{{baseUrl}}/flowise/fetch/:flowiseId/{{instance}}`
**PUT** `{{baseUrl}}/flowise/update/:flowiseId/{{instance}}` | **DELETE** `{{baseUrl}}/flowise/delete/:flowiseId/{{instance}}`

---

## N8N

### Crear bot N8N
**POST** `{{baseUrl}}/n8n/create/{{instance}}`
```json
{
    "enabled": true,
    "apiUrl": "http://n8n.miservidor.com/v1",
    "apiKey": "app-123456",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 0,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "listeningFromMe": false,
    "keepOpen": false,
    "debounceTime": 0,
    "ignoreJids": []
}
```

**GET** `{{baseUrl}}/n8n/find/{{instance}}` | **GET** `{{baseUrl}}/n8n/fetch/:n8nId/{{instance}}`
**PUT** `{{baseUrl}}/n8n/update/:n8nId/{{instance}}` | **DELETE** `{{baseUrl}}/n8n/delete/:n8nId/{{instance}}`

---

## EvoAI

### Crear bot EvoAI
**POST** `{{baseUrl}}/evoai/create/{{instance}}`
```json
{
    "enabled": true,
    "apiUrl": "http://evoai.miservidor.com/v1",
    "apiKey": "app-123456",
    "triggerType": "keyword",
    "triggerOperator": "equals",
    "triggerValue": "inicio",
    "expire": 0,
    "keywordFinish": "#SAIR",
    "delayMessage": 1000,
    "listeningFromMe": false,
    "keepOpen": false,
    "debounceTime": 0,
    "ignoreJids": []
}
```

**GET** `{{baseUrl}}/evoai/find/{{instance}}` | **GET** `{{baseUrl}}/evoai/fetch/:evoaiId/{{instance}}`
**PUT** `{{baseUrl}}/evoai/update/:evoaiId/{{instance}}` | **DELETE** `{{baseUrl}}/evoai/delete/:evoaiId/{{instance}}`
