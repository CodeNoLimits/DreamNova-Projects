# 🔄 INSTRUCTIONS GOOGLE DRIVE SYNC

## 🎯 SETUP INITIAL (À FAIRE UNE SEULE FOIS)

### Étape 1: Lancer la configuration
```bash
cd ~/DreamNova_Projects
./setup-google-drive-sync.sh
```

### Étape 2: Suivre les instructions
Le script va te guider pas à pas. Résumé:
1. Tape 'n' pour nouveau remote
2. Nom: **gdrive**
3. Type: **Google Drive** (généralement numéro 18)
4. Laisse tout le reste par défaut (appuie sur Entrée)
5. Quand demandé "Use auto config": tape **y**
6. Un navigateur s'ouvre → Connecte-toi à ton Google
7. Autorise l'accès
8. Retour au terminal → tape 'y' pour confirmer
9. Tape 'q' pour quitter

**C'est tout! Google Drive est configuré** ✅

---

## 🚀 UTILISATION QUOTIDIENNE

### Option 1: Sync Manuel (recommandé au début)
```bash
cd ~/DreamNova_Projects
./sync-to-gdrive.sh
```

Ça va uploader tous tes fichiers vers Google Drive.

### Option 2: Sync Automatique (setup une fois, oublie après)
```bash
cd ~/DreamNova_Projects
./setup-auto-sync-cron.sh
```

Après ça, ton Mac va automatiquement sync vers Google Drive **toutes les heures**.

---

## 📊 COMMANDES UTILES

### Voir ce qu'il y a sur Google Drive
```bash
rclone ls gdrive:DreamNova_Projects
```

### Voir la taille totale
```bash
rclone size gdrive:DreamNova_Projects
```

### Sync bidirectionnel (si tu modifies sur Drive aussi)
```bash
rclone bisync ~/DreamNova_Projects gdrive:DreamNova_Projects -v
```

### Voir les logs du sync automatique
```bash
tail -f ~/dreamnova-sync.log
```

---

## 🔗 ACCÈS WEB GOOGLE DRIVE

Après le premier sync, va sur:
**https://drive.google.com/**

Tu verras un dossier **DreamNova_Projects** avec tout dedans!

Tu peux partager ce dossier avec Ariel:
1. Clic droit sur le dossier
2. "Partager"
3. Ajoute l'email d'Ariel
4. Donne-lui accès "Éditeur"

---

## ⚠️ IMPORTANT

### Ce qui est SYNC ✅
- Tous les dossiers projets
- Tous les README.md
- Toute la documentation
- Structure complète

### Ce qui est EXCLU ❌
- Dossier `.git/` (inutile sur Drive)
- Fichiers `.DS_Store` (macOS cache)

---

## 🆘 PROBLÈMES COURANTS

### "rclone: command not found"
```bash
brew install rclone
```

### "remote not found: gdrive"
Tu dois d'abord configurer:
```bash
./setup-google-drive-sync.sh
```

### Sync ne fonctionne pas
Vérifie la config:
```bash
rclone config show
```

Tu devrais voir une section `[gdrive]`.

---

## 🎯 WORKFLOW RECOMMANDÉ

### Journalier
1. Travaille normalement sur tes projets
2. Git commit tes changements (vers GitHub)
3. Lance `./sync-to-gdrive.sh` (vers Google Drive)

OU

1. Active sync automatique UNE FOIS: `./setup-auto-sync-cron.sh`
2. Oublie, ça sync tout seul toutes les heures! 🎉

### Avec Ariel
1. Partage le dossier Google Drive avec lui
2. Il voit tout en temps réel
3. Vous pouvez tous les deux modifier
4. Sync bidirectionnel avec `rclone bisync` si besoin

---

## 🔄 DIFFÉRENCES GOOGLE DRIVE vs GITHUB

| Aspect | GitHub | Google Drive |
|--------|--------|--------------|
| **Usage** | Versioning code, collaboration dev | Partage fichiers, docs, visibilité |
| **Cible** | Développeurs, tech | Business, non-tech (Ariel) |
| **Historique** | Complet (Git) | Limité (versions Drive) |
| **Structure** | Repository avec branches | Dossiers classiques |
| **Accès** | Compte GitHub requis | N'importe qui avec email |

**💡 Conseil**: Garde les DEUX!
- **GitHub** = Source de vérité technique
- **Google Drive** = Visibilité & partage Ariel

---

## ✅ CHECKLIST SETUP COMPLET

- [ ] rclone installé (`brew install rclone`) ✅ (déjà fait)
- [ ] Configuration Google Drive (`./setup-google-drive-sync.sh`)
- [ ] Premier sync manuel (`./sync-to-gdrive.sh`)
- [ ] Vérifier sur https://drive.google.com/ que dossier existe
- [ ] Partager dossier avec Ariel
- [ ] (Optionnel) Setup sync automatique (`./setup-auto-sync-cron.sh`)

---

**🙏 Na Nach Nachma Nachman MeUman!**

*Pour questions: ouvre un issue sur GitHub ou demande à Claude Code*
