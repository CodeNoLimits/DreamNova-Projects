#!/bin/bash

# 🔄 SCRIPT DE CONFIGURATION GOOGLE DRIVE SYNC
# Pour DreamNova Projects
# Par: Claude Code

echo "🔄 Configuration Google Drive Sync pour DreamNova Projects"
echo "============================================================"
echo ""

# Vérifier si rclone est installé
if ! command -v rclone &> /dev/null; then
    echo "❌ rclone n'est pas installé. Installation..."
    brew install rclone
fi

echo "✅ rclone installé"
echo ""

# Instructions configuration
echo "📋 ÉTAPES DE CONFIGURATION:"
echo ""
echo "1️⃣  Je vais lancer la configuration rclone dans 5 secondes..."
echo "2️⃣  Choisis: 'n' pour New remote"
echo "3️⃣  Nom: tape 'gdrive' (important!)"
echo "4️⃣  Type: cherche 'Google Drive' et tape son numéro (généralement 18)"
echo "5️⃣  Client ID: appuie juste sur Entrée (laisser vide)"
echo "6️⃣  Client Secret: appuie juste sur Entrée (laisser vide)"
echo "7️⃣  Scope: tape '1' pour 'Full access'"
echo "8️⃣  Root folder ID: appuie sur Entrée (laisser vide)"
echo "9️⃣  Service Account: appuie sur Entrée (laisser vide)"
echo "🔟 Edit advanced config: tape 'n'"
echo "1️⃣1️⃣ Use auto config: tape 'y' (ouvrira navigateur)"
echo "1️⃣2️⃣ Dans le navigateur: connecte-toi à ton Google et autorise"
echo "1️⃣3️⃣ Configure as team drive: tape 'n'"
echo "1️⃣4️⃣ Confirmer: tape 'y'"
echo "1️⃣5️⃣ Quit: tape 'q'"
echo ""
echo "Prêt? Appuie sur Entrée pour commencer..."
read

# Lancer configuration rclone
rclone config

echo ""
echo "✅ Configuration terminée!"
echo ""
echo "🚀 COMMANDES DISPONIBLES:"
echo ""
echo "# Sync LOCAL → GOOGLE DRIVE (upload)"
echo "rclone sync ~/DreamNova_Projects gdrive:DreamNova_Projects -v"
echo ""
echo "# Sync GOOGLE DRIVE → LOCAL (download)"
echo "rclone sync gdrive:DreamNova_Projects ~/DreamNova_Projects -v"
echo ""
echo "# Sync BIDIRECTIONNEL (recommandé)"
echo "rclone bisync ~/DreamNova_Projects gdrive:DreamNova_Projects -v --create-empty-src-dirs --resilient"
echo ""
echo "# Voir ce qu'il y a sur Google Drive"
echo "rclone ls gdrive:DreamNova_Projects"
echo ""
echo "📝 SYNC AUTOMATIQUE:"
echo ""
echo "Pour sync automatique toutes les heures, lance:"
echo "./setup-auto-sync-cron.sh"
echo ""
echo "Na Nach! 🙏"
