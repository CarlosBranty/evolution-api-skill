# Evolution API v2.3 — Skill Index

## ¿Qué es esto?
Este directorio contiene la documentación de la **Evolution API v2.3** dividida en archivos por módulo funcional. Cada archivo es autocontenido y describe los endpoints de una categoría específica.

## Variables globales
| Variable | Descripción |
|---|---|
| `{{baseUrl}}` | URL base del servidor, ej: `https://tu-servidor.com` |
| `{{instance}}` | Nombre de la instancia de WhatsApp |
| `{{remoteJid}}` | Número destino sin `+`, ej: `5511999990000` |
| `{{groupJid}}` | ID del grupo, ej: `5511999990000-1234567890@g.us` |

## Autenticación
Todas las requests requieren el header `apikey` con tu API key global o de instancia.
```
apikey: TU_API_KEY
```

---

## 📂 Archivos disponibles — elige el correcto según la tarea

| Archivo | Cuándo usarlo |
|---|---|
| `01_instance.md` | Crear, conectar, reiniciar, eliminar instancias WhatsApp |
| `02_send_messages.md` | Enviar texto, imágenes, audio, video, stickers, ubicación, contactos, reacciones, encuestas, botones, listas |
| `03_chat.md` | Gestionar chats: leer mensajes, archivar, buscar contactos, bloquear, obtener base64 de medios |
| `04_groups.md` | Crear grupos, gestionar participantes, invitaciones, configuración de grupos |
| `05_profile.md` | Ver y actualizar perfil propio: nombre, foto, estado, privacidad |
| `06_settings_proxy.md` | Configurar ajustes de instancia y proxy |
| `07_webhooks_events.md` | Configurar Webhook, WebSocket, RabbitMQ, SQS, NATS, Pusher |
| `08_integrations_bots.md` | Integrar bots: Typebot, Evolution Bot, OpenAI, Dify, Flowise, N8N, EvoAI |
| `09_chatwoot.md` | Configurar integración con Chatwoot |
| `10_cloud_api_templates.md` | Plantillas de WhatsApp Business Cloud API, envío de templates |
| `11_misc.md` | S3/media, métricas, información del servidor, labels, llamadas fake |
