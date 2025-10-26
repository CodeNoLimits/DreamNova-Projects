#!/bin/bash

# ⏰ SETUP SYNC AUTOMATIQUE TOUTES LES HEURES
# Configure cron pour sync automatique

echo "⏰ Configuration Sync Automatique Google Drive"
echo "=============================================="
echo ""

# Chemin complet rclone
RCLONE_PATH=$(which rclone)
PROJECT_PATH="$HOME/DreamNova_Projects"

# Créer script sync pour cron
cat > "$HOME/sync-dreamnova-cron.sh" << EOF
#!/bin/bash
# Sync automatique DreamNova Projects
$RCLONE_PATH sync $PROJECT_PATH gdrive:DreamNova_Projects \\
    --exclude ".git/**" \\
    --exclude ".DS_Store" \\
    --create-empty-src-dirs \\
    --log-file="$HOME/dreamnova-sync.log" \\
    --log-level INFO
EOF

chmod +x "$HOME/sync-dreamnova-cron.sh"

echo "✅ Script sync créé: ~/sync-dreamnova-cron.sh"
echo ""

# Ajouter au crontab
echo "📝 Ajout au crontab (sync toutes les heures)..."
echo ""

# Backup crontab actuel
crontab -l > /tmp/crontab_backup 2>/dev/null || touch /tmp/crontab_backup

# Ajouter nouvelle ligne si pas déjà présente
if ! grep -q "sync-dreamnova-cron.sh" /tmp/crontab_backup; then
    echo "# Sync DreamNova Projects vers Google Drive (toutes les heures)" >> /tmp/crontab_backup
    echo "0 * * * * $HOME/sync-dreamnova-cron.sh" >> /tmp/crontab_backup
    crontab /tmp/crontab_backup
    echo "✅ Crontab configuré!"
else
    echo "ℹ️  Crontab déjà configuré"
fi

echo ""
echo "✅ SYNC AUTOMATIQUE ACTIVÉ!"
echo ""
echo "📊 Configuration:"
echo "  - Fréquence: Toutes les heures (à chaque heure pile)"
echo "  - Direction: Local → Google Drive"
echo "  - Log: ~/dreamnova-sync.log"
echo ""
echo "🔍 Pour voir les logs:"
echo "  tail -f ~/dreamnova-sync.log"
echo ""
echo "🛑 Pour désactiver:"
echo "  crontab -e"
echo "  (puis supprimer la ligne DreamNova)"
echo ""
echo "🚀 Premier sync dans moins d'une heure!"
echo ""
echo "Na Nach! 🙏"
