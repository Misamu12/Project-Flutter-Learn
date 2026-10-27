# Project Flutter Learn

Une petite application Flutter en français pour apprendre les bases avec un compteur interactif. Le projet peut être exécuté dans un navigateur et est préparé pour Android.

## État du projet

- Flutter **3.47.8 stable** et Dart **3.13.7** sont installés sur le poste utilisé pour préparer ce projet.
- Les extensions Flutter et Dart sont installées dans VS Code.
- Les cibles **Web** et **Android** ont été générées.
- `flutter analyze`, `flutter test` et `flutter build web --release` ont réussi.
- L’application a été lancée sur le serveur Web Flutter à `http://127.0.0.1:5173`.
- **À terminer pour Android :** installer Android Studio et le SDK Android, accepter les licences et créer un émulateur ou connecter un téléphone. Il restait environ 6,4 Go libres sur le disque C: lors de la dernière vérification ; il avait été conseillé de libérer de l’espace avant cette installation.

## Comment Flutter a été recherché et installé

Voici les étapes suivies sur le poste Windows :

1. Vérifier la disponibilité de `flutter`, `dart`, `java`, `adb`, `sdkmanager`, `winget`, VS Code et Git, ainsi que l’espace disque. Git et VS Code étaient déjà présents ; Flutter, Java et le SDK Android ne l’étaient pas.
2. Rechercher Android Studio avec `winget search --id Google.AndroidStudio --exact`. Le paquet trouvé est `Google.AndroidStudio`.
3. Vérifier la dernière version stable de Flutter dans le catalogue officiel des versions Windows Flutter. La version stable trouvée lors de l’installation était **3.47.8**.
4. Télécharger l’archive officielle depuis `storage.googleapis.com`, vérifier son empreinte SHA-256, puis l’extraire dans :

   ```text
   %USERPROFILE%\development\flutter
   ```

   L’empreinte vérifiée était `11e19ea3409808fe3b3765ea8149640c299e58cce6eda7c9f38fc1b4a193eb6e`.
5. Ajouter `%USERPROFILE%\development\flutter\bin` au `PATH` utilisateur et définir `dart.flutterSdkPath` dans `.vscode/settings.json`.
6. Vérifier dans VS Code la présence des extensions `Dart-Code.flutter` et `Dart-Code.dart-code`. Elles étaient déjà installées.
7. Générer les fichiers de plateforme Android et Web avec `flutter create --platforms=android .` et `flutter create --platforms=web .`, puis récupérer les dépendances.
8. Lancer l’analyse, le test du compteur, la compilation Web et le serveur Web local.

Références officielles :

- [Installer Flutter sur Windows](https://docs.flutter.dev/get-started/install/windows)
- [Configuration Android avec Flutter](https://docs.flutter.dev/platform-integration/android/setup)
- [Documentation Flutter](https://docs.flutter.dev/)
- [Guide VS Code pour Flutter](https://docs.flutter.dev/tools/vs-code)

## Prérequis pour travailler avec VS Code

Le Flutter SDK a été installé ici sur le poste utilisé :

```text
C:\Users\rebts\development\flutter
```

Le chemin est enregistré dans `.vscode/settings.json`. Si le SDK est installé ailleurs, remplacez la valeur de `dart.flutterSdkPath` par le chemin local correct.

Pour que Windows et VS Code voient le `PATH` mis à jour, fermez puis rouvrez le terminal intégré ou VS Code. Dans un nouveau terminal PowerShell, vérifiez l’installation :

```powershell
flutter --version
dart --version
flutter doctor
```

Si `flutter` n’est toujours pas reconnu, ajoutez temporairement son dossier au `PATH` de ce terminal :

```powershell
$env:Path = "$env:USERPROFILE\development\flutter\bin;$env:Path"
flutter --version
```

VS Code doit disposer des extensions **Flutter** et **Dart** (éditeur : Dart Code). Pour ouvrir le projet, ouvrez ce dossier dans VS Code, puis sélectionnez un appareil avec `Ctrl+Shift+P` → **Flutter: Select Device**.

## Récupérer les dépendances

Depuis la racine du projet :

```powershell
flutter pub get
```

Cette commande restaure les dépendances déclarées dans `pubspec.yaml`.

## Lancer l’application dans un navigateur

Chrome et Edge étaient reconnus par Flutter. Le Web peut être utilisé sans installer Android Studio :

```powershell
flutter devices
flutter run -d chrome
```

Pour utiliser Edge à la place :

```powershell
flutter run -d edge
```

Ou pour démarrer le serveur Web Flutter et ouvrir son adresse dans un navigateur :

```powershell
flutter run -d web-server --web-hostname 127.0.0.1 --web-port 5173
```

Puis ouvrez <http://127.0.0.1:5173>. Dans le terminal de `flutter run`, appuyez sur `r` pour le rechargement à chaud et sur `q` pour arrêter le serveur. Le serveur précédemment lancé n’est pas garanti de rester actif après la fermeture du terminal ou de VS Code.

Pour produire une compilation Web de production :

```powershell
flutter build web --release
```

Les fichiers générés se trouvent dans `build/web`.

## Terminer l’installation Android

L’espace disque disponible était insuffisant pour installer Android Studio, le SDK et les fichiers d’un émulateur confortablement. Libérez de l’espace sur le disque C: avant de continuer ; **au moins 15 Go libres sont recommandés** pour cette installation et les téléchargements de compilation.

1. Installer Android Studio depuis le site officiel ou, si `winget` est disponible, depuis PowerShell :

   ```powershell
   winget install --id Google.AndroidStudio --exact
   ```

2. Ouvrir Android Studio et suivre l’assistant de première configuration. Installer le SDK Android et les outils proposés. Dans **SDK Manager**, vérifier la présence du SDK Platform adapté, de **Android SDK Platform-Tools** et de **Android SDK Command-line Tools**.
3. Dans Android Studio, ouvrir **Device Manager**, créer un appareil virtuel Android et télécharger l’image système demandée. Si l’émulateur ne démarre pas, vérifier que la virtualisation matérielle est activée dans Windows et dans le firmware de l’ordinateur.
4. Fermer puis rouvrir VS Code et exécuter dans PowerShell :

   ```powershell
   flutter doctor --android-licenses
   flutter doctor
   flutter devices
   ```

   Accepter les licences présentées par la première commande. Si Flutter ne détecte pas automatiquement le SDK Android, configurer son emplacement habituel, puis relancer le diagnostic :

   ```powershell
   flutter config --android-sdk "$env:LOCALAPPDATA\Android\Sdk"
   flutter doctor
   ```

5. Démarrer l’émulateur depuis Android Studio → **Device Manager**, puis vérifier qu’il apparaît :

   ```powershell
   flutter devices
   ```

6. Depuis la racine du projet, lancer l’application. Si plusieurs appareils sont disponibles, remplacer `<id-appareil>` par un identifiant affiché par `flutter devices` :

   ```powershell
   flutter run
   flutter run -d <id-appareil>
   ```

   Pour installer et lancer directement l’application sur un téléphone Android, activez les options développeur et le débogage USB sur le téléphone, connectez-le au PC, puis choisissez-le dans VS Code ou utilisez son identifiant avec `flutter run -d <id-appareil>`.

Le squelette Android a déjà été généré dans `android/`. Il n’est donc pas nécessaire de relancer `flutter create --platforms=android .` après l’installation du SDK.

## Vérifier le projet

Ces commandes s’exécutent depuis la racine du projet :

```powershell
flutter analyze
flutter test
```

Le test de widget vérifie l’incrémentation et la réinitialisation du compteur. Pour recompiler la version Web :

```powershell
flutter build web --release
```
