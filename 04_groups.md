# Evolution API — 04: Grupos (Group)

> Usa este archivo para: crear grupos, editar nombre/descripción/foto, gestionar participantes, obtener invitaciones, cambiar configuración, mensajes efímeros, salir del grupo.

**Nota:** Los endpoints de grupos usan el parámetro `groupJid` en la query. Formato: `1234567890-1234567890@g.us`

---

## Crear grupo
**POST** `{{baseUrl}}/group/create/{{instance}}`

```json
{
    "subject": "Nombre del Grupo",
    "description": "Descripción opcional",
    "participants": [
        "5531900000000",
        "5531911111111"
    ]
}
```

---

## Actualizar foto del grupo
**POST** `{{baseUrl}}/group/updateGroupPicture/{{instance}}?groupJid={{groupJid}}`

```json
{
    "image": "https://ejemplo.com/foto.png"
}
```

---

## Actualizar nombre del grupo
**POST** `{{baseUrl}}/group/updateGroupSubject/{{instance}}?groupJid={{groupJid}}`

```json
{
    "subject": "Nuevo nombre del grupo"
}
```

---

## Actualizar descripción del grupo
**POST** `{{baseUrl}}/group/updateGroupDescription/{{instance}}?groupJid={{groupJid}}`

```json
{
    "description": "Nueva descripción o reglas del grupo"
}
```

---

## Obtener código de invitación
**GET** `{{baseUrl}}/group/inviteCode/{{instance}}?groupJid={{groupJid}}`

Retorna el código de invitación actual del grupo.

---

## Revocar código de invitación
**POST** `{{baseUrl}}/group/revokeInviteCode/{{instance}}?groupJid={{groupJid}}`

Genera un nuevo código, invalidando el anterior.

---

## Enviar invitación a números
**POST** `{{baseUrl}}/group/sendInvite/{{instance}}`

```json
{
    "groupJid": "{{groupJid}}",
    "description": "Accede a este link para unirte a mi grupo:",
    "numbers": ["{{remoteJid}}"]
}
```

---

## Buscar grupo por código de invitación
**GET** `{{baseUrl}}/group/inviteInfo/{{instance}}?inviteCode={{inviteCode}}`

---

## Buscar información de grupo por JID
**GET** `{{baseUrl}}/group/findGroupInfos/{{instance}}?groupJid={{groupJid}}`

---

## Listar todos los grupos
**GET** `{{baseUrl}}/group/fetchAllGroups/{{instance}}?getParticipants=false`

- `getParticipants=true` incluye la lista de participantes (más lento).

---

## Listar participantes del grupo
**GET** `{{baseUrl}}/group/participants/{{instance}}?groupJid={{groupJid}}`

---

## Gestionar participantes
**POST** `{{baseUrl}}/group/updateParticipant/{{instance}}?groupJid={{groupJid}}`

```json
{
    "action": "add",
    "participants": [
        "5531900000000",
        "5531911111111"
    ]
}
```

- `action`:
  - `"add"` → agregar miembro
  - `"remove"` → eliminar miembro
  - `"promote"` → promover a admin
  - `"demote"` → quitar admin

---

## Cambiar configuración del grupo
**POST** `{{baseUrl}}/group/updateSetting/{{instance}}?groupJid={{groupJid}}`

```json
{
    "action": "not_announcement"
}
```

- `"announcement"` → Solo admins pueden enviar mensajes
- `"not_announcement"` → Todos los miembros pueden enviar
- `"locked"` → Solo admins pueden editar configuración
- `"unlocked"` → Todos pueden editar configuración

---

## Mensajes efímeros (auto-eliminar)
**POST** `{{baseUrl}}/group/toggleEphemeral/{{instance}}?groupJid={{groupJid}}`

```json
{
    "expiration": 86400
}
```

- `0` → Desactivado
- `86400` → 24 horas
- `604800` → 7 días
- `7776000` → 90 días

---

## Salir del grupo
**DELETE** `{{baseUrl}}/group/leaveGroup/{{instance}}?groupJid={{groupJid}}`
