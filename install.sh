#!/bin/bash

# ================================================
# Evolution API Skill — Script de Instalación
# ================================================

REPO_URL="https://raw.githubusercontent.com/CarlosBranty/evolution-api-skill/main"
INSTALL_DIR="${HOME}/.claude/skills/evolution-api"

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}   Evolution API Skill — Instalador v2.3       ${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Verificar que curl esté disponible
if ! command -v curl &> /dev/null; then
    echo -e "${RED}✗ Error: 'curl' no está instalado. Instálalo e intenta de nuevo.${NC}"
    exit 1
fi

# Crear directorio de instalación
echo -e "📁 Creando directorio: ${INSTALL_DIR}"
mkdir -p "$INSTALL_DIR"

# Lista de archivos a descargar
FILES=(
    "SKILL.md"
    "01_instance.md"
    "02_send_messages.md"
    "03_chat.md"
    "04_groups.md"
    "05_profile.md"
    "06_settings_proxy.md"
    "07_webhooks_events.md"
    "08_integrations_bots.md"
    "09_chatwoot.md"
    "10_cloud_api_templates.md"
    "11_misc.md"
)

echo ""
echo "⬇️  Descargando archivos del skill..."
echo ""

ERRORS=0

for FILE in "${FILES[@]}"; do
    URL="${REPO_URL}/${FILE}"
    DEST="${INSTALL_DIR}/${FILE}"

    if curl -sSf "$URL" -o "$DEST"; then
        echo -e "  ${GREEN}✓${NC} ${FILE}"
    else
        echo -e "  ${RED}✗ Error descargando: ${FILE}${NC}"
        ERRORS=$((ERRORS + 1))
    fi
done

echo ""

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ Instalación completada exitosamente.${NC}"
    echo ""
    echo -e "📍 Skill instalado en: ${INSTALL_DIR}"
    echo ""
    echo -e "💡 ${BLUE}Cómo usar en tu agente Claude:${NC}"
    echo "   Agrega esto al system prompt del agente:"
    echo ""
    echo "   \"Tienes acceso al skill de Evolution API v2.3."
    echo "    Índice: ${INSTALL_DIR}/SKILL.md"
    echo "    Lee el índice para saber qué archivo consultar antes de usar la API.\""
    echo ""
else
    echo -e "${RED}⚠️  Instalación completada con ${ERRORS} error(s).${NC}"
    echo "   Verifica tu conexión o la URL del repositorio."
    exit 1
fi
