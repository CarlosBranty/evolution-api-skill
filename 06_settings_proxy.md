# Evolution API — 06: Configuración e Instancia (Settings & Proxy)

> Usa este archivo para: configurar comportamiento de la instancia (rechazar llamadas, ignorar grupos, siempre online, etc.) y configurar proxy de red.

---

## Configurar ajustes de la instancia
**POST** `{{baseUrl}}/settings/set/{{instance}}`

```json
{
    "rejectCall": true,
    "msgCall": "No acepto llamadas",
    "groupsIgnore": false,
    "alwaysOnline": true,
    "readMessages": false,
    "syncFullHistory": false,
    "readStatus": false
}
```

**Descripción de campos:**

| Campo | Tipo | Descripción |
|---|---|---|
| `rejectCall` | boolean | Rechazar llamadas entrantes automáticamente |
| `msgCall` | string | Mensaje automático cuando se rechaza una llamada |
| `groupsIgnore` | boolean | Ignorar mensajes de grupos |
| `alwaysOnline` | boolean | Mantener siempre como "en línea" |
| `readMessages` | boolean | Marcar mensajes como leídos automáticamente |
| `syncFullHistory` | boolean | Sincronizar historial completo al conectar |
| `readStatus` | boolean | Marcar estados/stories como vistos automáticamente |

---

## Ver ajustes actuales de la instancia
**GET** `{{baseUrl}}/settings/find/{{instance}}`

---

## Configurar proxy
**POST** `{{baseUrl}}/proxy/set/{{instance}}`

```json
{
    "enabled": true,
    "host": "0.0.0.0",
    "port": "8000",
    "protocol": "http",
    "username": "usuario",
    "password": "contraseña"
}
```

- `protocol`: `"http"` | `"https"` | `"socks5"`
- Usa `"enabled": false` para desactivar el proxy.

---

## Ver configuración de proxy actual
**GET** `{{baseUrl}}/proxy/find/{{instance}}`
