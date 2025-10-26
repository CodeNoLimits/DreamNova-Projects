#!/bin/bash

# 🔄 SYNC MANUEL VERS GOOGLE DRIVE
# Lance ce script quand tu veux synchroniser

echo "🔄 Synchronisation DreamNova Projects → Google Drive"
echo "===================================================="
echo ""

# Vérifier si rclone configuré
if ! rclone listremotes | grep -q "gdrive:"; then
    echo "❌ Google Drive pas encore configuré!"
    echo "Lance d'abord: ./setup-google-drive-sync.sh"
    exit 1
fi

# Sync LOCAL → GOOGLE DRIVE
echo "📤 Upload vers Google Drive..."
rclone sync ~/DreamNova_Projects gdrive:DreamNova_Projects \
    -v \
    --exclude ".git/**" \
    --exclude ".DS_Store" \
    --create-empty-src-dirs \
    --progress

echo ""
echo "✅ Synchronisation terminée!"
echo ""
echo "📊 Contenu sur Google Drive:"
rclone size gdrive:DreamNova_Projects

echo ""
echo "🔗 Accès Google Drive:"
echo "https://drive.google.com/ → Cherche 'DreamNova_Projects'"
echo ""
echo "Na Nach! 🙏"
