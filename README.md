# Evolution API Skill — v2.3

Skill modular de la **Evolution API v2.3** diseñado para agentes IA Claude. Divide toda la documentación de endpoints en archivos pequeños y especializados para que el agente cargue solo lo que necesita.

---

## ⚡ Instalación rápida

Ejecuta este comando en cualquier computadora:

```bash
curl -sSL https://raw.githubusercontent.com/TU_USUARIO/evolution-api-skill/main/install.sh | bash
```

El skill se instala en `~/.claude/skills/evolution-api/`.

---

## 📂 Estructura del skill

| Archivo | Descripción |
|---|---|
| `SKILL.md` | Índice maestro — el agente lo lee primero |
| `01_instance.md` | Crear, conectar, reiniciar, eliminar instancias |
| `02_send_messages.md` | Enviar texto, imágenes, audio, video, stickers, botones, listas... |
| `03_chat.md` | Gestión de chats, contactos, bloqueo, presencia |
| `04_groups.md` | Grupos: crear, participantes, invitaciones, configuración |
| `05_profile.md` | Ver/editar perfil propio y privacidad |
| `06_settings_proxy.md` | Ajustes de instancia y proxy de red |
| `07_webhooks_events.md` | Webhook, WebSocket, RabbitMQ, SQS, NATS, Pusher |
| `08_integrations_bots.md` | Typebot, OpenAI, Dify, Flowise, N8N, EvoAI, Evolution Bot |
| `09_chatwoot.md` | Integración con Chatwoot |
| `10_cloud_api_templates.md` | Templates de WhatsApp Business Cloud API |
| `11_misc.md` | Labels, llamadas falsas, S3, métricas |

---

## 🤖 Cómo usar en tu agente Claude

Agrega esto al **system prompt** de tu agente:

```
Tienes acceso al skill de Evolution API v2.3.
Índice en: ~/.claude/skills/evolution-api/SKILL.md

Antes de hacer cualquier llamada a la API:
1. Lee el índice SKILL.md para identificar qué archivo corresponde a la tarea.
2. Lee solo ese archivo específico.
3. Construye la request con los datos del usuario.

Variables que el usuario debe proveer:
- baseUrl: URL base del servidor Evolution API
- instance: nombre de la instancia WhatsApp
- apikey: clave de autenticación
```

---

## 🔄 Actualizar el skill

Para actualizar a la última versión, ejecuta el mismo comando de instalación:

```bash
curl -sSL https://raw.githubusercontent.com/TU_USUARIO/evolution-api-skill/main/install.sh | bash
```

---

## 📋 Requisitos

- `curl` instalado en el sistema
- Acceso a internet durante la instalación
- Una instancia de [Evolution API v2.3](https://github.com/EvolutionAPI/evolution-api) corriendo

---

## 🔑 Autenticación

Todas las requests requieren el header:
```
apikey: TU_API_KEY
```

---

## Variables globales

| Variable | Ejemplo |
|---|---|
| `{{baseUrl}}` | `https://tu-servidor.com` |
| `{{instance}}` | `mi-instancia` |
| `{{remoteJid}}` | `5511999990000` |
| `{{groupJid}}` | `5511999990000-1234567890@g.us` |
