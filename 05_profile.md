# Evolution API — 05: Perfil (Profile Settings)

> Usa este archivo para: ver o actualizar el perfil propio de la instancia (nombre, foto, estado), consultar perfil de otros contactos, gestionar configuración de privacidad.

---

## Ver perfil de un negocio (Business Profile)
**POST** `{{baseUrl}}/chat/fetchBusinessProfile/{{instance}}`

```json
{
    "number": "{{remoteJid}}"
}
```

---

## Ver perfil de un contacto
**POST** `{{baseUrl}}/chat/fetchProfile/{{instance}}`

```json
{
    "number": "{{remoteJid}}"
}
```

---

## Actualizar nombre del perfil propio
**POST** `{{baseUrl}}/chat/updateProfileName/{{instance}}`

```json
{
    "name": "Mi Nombre"
}
```

---

## Actualizar estado (bio) del perfil
**POST** `{{baseUrl}}/chat/updateProfileStatus/{{instance}}`

```json
{
    "status": "No disponible para llamadas"
}
```

---

## Actualizar foto de perfil
**POST** `{{baseUrl}}/chat/updateProfilePicture/{{instance}}`

```json
{
    "picture": "https://ejemplo.com/foto.png"
}
```

- Acepta URL pública de imagen.

---

## Eliminar foto de perfil
**DELETE** `{{baseUrl}}/chat/removeProfilePicture/{{instance}}`

Sin body.

---

## Ver configuración de privacidad
**GET** `{{baseUrl}}/chat/fetchPrivacySettings/{{instance}}`

---

## Actualizar configuración de privacidad
**POST** `{{baseUrl}}/chat/updatePrivacySettings/{{instance}}`

```json
{
    "readreceipts": "all",
    "profile": "all",
    "status": "contacts",
    "online": "all",
    "last": "contacts",
    "groupadd": "none"
}
```

**Valores posibles por campo:**

| Campo | Opciones válidas |
|---|---|
| `readreceipts` | `"all"`, `"none"` |
| `profile` | `"all"`, `"contacts"`, `"contact_blacklist"`, `"none"` |
| `status` | `"all"`, `"contacts"`, `"contact_blacklist"`, `"none"` |
| `online` | `"all"`, `"match_last_seen"` |
| `last` | `"all"`, `"contacts"`, `"contact_blacklist"`, `"none"` |
| `groupadd` | `"all"`, `"contacts"`, `"contact_blacklist"` |
