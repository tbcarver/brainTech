# KDE Plasma: Chrome Profiles as Separate Taskbar Items (Icons + Text)

This setup creates **one launcher per Chrome profile** that stays **independent** in KDE’s task manager by giving each launcher its own `--user-data-dir`.  
It also generates a **Windows-style icon** (Chrome icon with the profile avatar overlaid).

Icons:
Tyler (don't use the url for a better icon from the profile)
./make-chrome-profile-launcher.sh 1 Tyler https://render.pixels.com/images/rendered/default/print/6.5/8/break/images/artworkimages/medium/2/half-american-half-colombian-jose-o.jpg
ChatGPT
./make-chrome-profile-launcher.sh  --icon-only --background-color '#FFFFFF' 2 ChatGPT https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/ChatGPT-Logo.svg/1280px-ChatGPT-Logo.svg.png
Fashionphile
./make-chrome-profile-launcher.sh 3 Fashionphile https://www.fashionphile.com/cdn/shop/files/content-icon-fav-icon.png

./make-chrome-profile-launcher.sh --icon-only --background-color '#242938'  4 Dev https://files.svgcdn.io/skill-icons/vscode-dark.png
Icon updated: /home/tyler/.local/share/icons/chrome-dev-profile-4.png
---

## 1) Install ImageMagick (for icon overlay)

```bash
sudo apt update && sudo apt install imagemagick
```

---

## 2) Create the script file

From a terminal:

```bash
touch make-chrome-profile-launcher.sh
chmod +x make-chrome-profile-launcher.sh
kate make-chrome-profile-launcher.sh
```

Paste the script below, save, and close the editor.

---

## 3) Script: `make-chrome-profile-launcher.sh`

```bash
#!/usr/bin/env bash
set -euo pipefail

cleanUpMode="false"
iconOnlyMode="false"
backgroundColor=""

while [[ $# -gt 0 ]]; do
  case "${1}" in
    --clean-up)
      cleanUpMode="true"
      shift
      ;;
    --icon-only)
      iconOnlyMode="true"
      shift
      ;;
    --background-color)
      backgroundColor="${2-}"
      if [[ -z "${backgroundColor}" ]]; then
        echo "Missing value for --background-color"
        exit 1
      fi
      shift 2
      ;;
    *)
      break
      ;;
  esac
done

profileNumber="${1-}"
displayName="${2-}"
overlayIconUrl="${3-}"

if [[ -z "${profileNumber}" || -z "${displayName}" ]]; then
  echo "Usage:"
  echo "  $(basename "$0") <profile-number> <name> [overlay-icon-url]"
  echo "  $(basename "$0") --background-color '#FFFFFF' <profile-number> <name> [overlay-icon-url]"
  echo "  $(basename "$0") --icon-only [--background-color '#FFFFFF'] <profile-number> <name> [overlay-icon-url]"
  echo "  $(basename "$0") --clean-up <profile-number> <name>"
  echo "Examples:"
  echo "  $(basename "$0") 3 Fashionphile"
  echo "  $(basename "$0") 3 Fashionphile https://example.com/badge.png"
  echo "  $(basename "$0") --background-color '#000000' 3 Fashionphile https://example.com/badge.png"
  echo "  $(basename "$0") --icon-only --background-color '#000000' 3 Fashionphile https://example.com/badge.png"
  echo "  $(basename "$0") --clean-up 3 Fashionphile"
  exit 1
fi

if ! [[ "${profileNumber}" =~ ^[0-9]+$ ]]; then
  echo "Profile number must be numeric. profileNumber='${profileNumber}'"
  exit 1
fi

slug="$(printf '%s' "${displayName}" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-+/-/g')"
if [[ -z "${slug}" ]]; then
  echo "Name produced empty slug. displayName='${displayName}' slug='${slug}'"
  exit 1
fi

if [[ "${profileNumber}" == "0" ]]; then
  profileDirectory="Default"
else
  profileDirectory="Profile ${profileNumber}"
fi

applicationDir="${HOME}/.local/share/applications"
iconsDir="${HOME}/.local/share/icons"
launcherDataRoot="${HOME}/.local/share/chrome-profile-launchers"
mkdir -p "${applicationDir}"
mkdir -p "${iconsDir}"
mkdir -p "${launcherDataRoot}"

baseName="chrome-${slug}-profile-${profileNumber}"
targetDesktop="${applicationDir}/${baseName}.desktop"
targetIconPath="${iconsDir}/${baseName}.png"
userDataDir="${launcherDataRoot}/${baseName}"

if [[ "${cleanUpMode}" == "true" ]]; then
  rm -f "${targetDesktop}"
  rm -f "${targetIconPath}"
  rm -rf "${userDataDir}"

  if command -v kbuildsycoca6 >/dev/null 2>&1; then
    kbuildsycoca6 >/dev/null 2>&1 || true
  elif command -v kbuildsycoca5 >/dev/null 2>&1; then
    kbuildsycoca5 >/dev/null 2>&1 || true
  fi

  echo "Removed:"
  echo "  ${targetDesktop}"
  echo "  ${targetIconPath}"
  echo "  ${userDataDir}"
  exit 0
fi

if command -v magick >/dev/null 2>&1; then
  imageTool="magick"
elif command -v convert >/dev/null 2>&1; then
  imageTool="convert"
else
  imageTool=""
fi

chromeProfileDir="${HOME}/.config/google-chrome/${profileDirectory}"

cleanupFiles=()
avatarSource=""
preparedAvatarSource=""

trap 'for filePath in "${cleanupFiles[@]-}"; do if [[ -n "${filePath}" && -f "${filePath}" ]]; then rm -f "${filePath}"; fi; done' EXIT

if [[ -n "${overlayIconUrl}" ]]; then
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required to download overlay icon. overlayIconUrl='${overlayIconUrl}'"
    exit 1
  fi

  if [[ -z "${imageTool}" ]]; then
    echo "ImageMagick is required to generate overlay icon."
    exit 1
  fi

  tmpOverlay="$(mktemp --suffix=.img)"
  cleanupFiles+=("${tmpOverlay}")
  curl -fsSL -o "${tmpOverlay}" "${overlayIconUrl}"

  avatarSource="${tmpOverlay}"
else
  for candidate in \
    "${chromeProfileDir}/Google Profile Picture.png" \
    "${chromeProfileDir}/Avatar.png"
  do
    if [[ -f "${candidate}" ]]; then
      avatarSource="${candidate}"
      break
    fi
  done
fi

if [[ -n "${avatarSource}" ]]; then
  if [[ -z "${imageTool}" ]]; then
    echo "ImageMagick is required to generate overlay icon."
    exit 1
  fi

  tmpOverlayPng="$(mktemp --suffix=.png)"
  cleanupFiles+=("${tmpOverlayPng}")
  "${imageTool}" "${avatarSource}" -strip -colorspace sRGB -alpha on "PNG32:${tmpOverlayPng}"

  tmpOverlaySquare="$(mktemp --suffix=.png)"
  cleanupFiles+=("${tmpOverlaySquare}")
  "${imageTool}" "${tmpOverlayPng}" \
    -resize 128x128 \
    -gravity center \
    -background none \
    -extent 128x128 \
    "PNG32:${tmpOverlaySquare}"

  if [[ -n "${backgroundColor}" ]]; then
    tmpOverlayBg="$(mktemp --suffix=.png)"
    cleanupFiles+=("${tmpOverlayBg}")
    "${imageTool}" \
      -size 128x128 "xc:${backgroundColor}" \
      "${tmpOverlaySquare}" \
      -gravity center \
      -compose over \
      -composite \
      "PNG32:${tmpOverlayBg}"
    preparedAvatarSource="${tmpOverlayBg}"
  else
    preparedAvatarSource="${tmpOverlaySquare}"
  fi
fi

iconValue="google-chrome"

chromeIcon="/usr/share/icons/hicolor/256x256/apps/google-chrome.png"

if [[ -n "${preparedAvatarSource}" && -f "${chromeIcon}" ]]; then
  if [[ -z "${imageTool}" ]]; then
    echo "ImageMagick is required to generate overlay icon."
    exit 1
  fi

  tmpOverlayCircle="$(mktemp --suffix=.png)"
  cleanupFiles+=("${tmpOverlayCircle}")

  "${imageTool}" "${preparedAvatarSource}" \
    \( -size 128x128 xc:none -fill white -draw "circle 64,64 64,1" \) \
    -compose DstIn \
    -composite \
    "PNG32:${tmpOverlayCircle}"

  "${imageTool}" "${chromeIcon}" \
    "${tmpOverlayCircle}" \
    -gravity southeast \
    -geometry +20+20 \
    -compose over \
    -composite \
    "PNG32:${targetIconPath}"

  iconValue="${baseName}"
fi

if [[ "${iconOnlyMode}" == "true" ]]; then
  echo "Icon updated: ${targetIconPath}"
  exit 0
fi

sourceDesktop=""
for candidate in \
  "/usr/share/applications/google-chrome.desktop" \
  "/usr/share/applications/google-chrome-stable.desktop"
do
  if [[ -f "${candidate}" ]]; then
    sourceDesktop="${candidate}"
    break
  fi
done

if [[ -z "${sourceDesktop}" ]]; then
  echo "Chrome desktop file not found in /usr/share/applications"
  exit 1
fi

execBinary="$(grep -E '^Exec=' "${sourceDesktop}" | head -n 1 | sed 's/^Exec=//' | awk '{print $1}')"
if [[ -z "${execBinary}" ]]; then
  echo "Could not determine Chrome executable from sourceDesktop='${sourceDesktop}'"
  exit 1
fi

nameValue="Chrome - ${displayName}"
startupWmClassValue="${baseName}"

mkdir -p "${userDataDir}"

execValue="${execBinary} --user-data-dir=\"${userDataDir}\" --profile-directory=\"${profileDirectory}\" --class=${baseName} --name=${baseName}"

cp -f "${sourceDesktop}" "${targetDesktop}"

if grep -q '^Name=' "${targetDesktop}"; then
  sed -i "s|^Name=.*|Name=${nameValue}|" "${targetDesktop}"
else
  echo "Name=${nameValue}" >> "${targetDesktop}"
fi

if grep -q '^Exec=' "${targetDesktop}"; then
  sed -i "s|^Exec=.*|Exec=${execValue}|" "${targetDesktop}"
else
  echo "Exec=${execValue}" >> "${targetDesktop}"
fi

if grep -q '^Icon=' "${targetDesktop}"; then
  sed -i "s|^Icon=.*|Icon=${iconValue}|" "${targetDesktop}"
else
  echo "Icon=${iconValue}" >> "${targetDesktop}"
fi

if grep -q '^StartupWMClass=' "${targetDesktop}"; then
  sed -i "s|^StartupWMClass=.*|StartupWMClass=${startupWmClassValue}|" "${targetDesktop}"
else
  echo "StartupWMClass=${startupWmClassValue}" >> "${targetDesktop}"
fi

if grep -q '^X-KDE-StartupWMClass=' "${targetDesktop}"; then
  sed -i "s|^X-KDE-StartupWMClass=.*|X-KDE-StartupWMClass=${startupWmClassValue}|" "${targetDesktop}"
else
  echo "X-KDE-StartupWMClass=${startupWmClassValue}" >> "${targetDesktop}"
fi

if grep -q '^StartupNotify=' "${targetDesktop}"; then
  sed -i "s|^StartupNotify=.*|StartupNotify=false|" "${targetDesktop}"
else
  echo "StartupNotify=false" >> "${targetDesktop}"
fi

if command -v kbuildsycoca6 >/dev/null 2>&1; then
  kbuildsycoca6 >/dev/null 2>&1 || true
elif command -v kbuildsycoca5 >/dev/null 2>&1; then
  kbuildsycoca5 >/dev/null 2>&1 || true
fi

echo "Desktop file: ${targetDesktop}"
if [[ -f "${targetIconPath}" ]]; then
  echo "Icon file:    ${targetIconPath}"
else
  echo "Icon file:    using default icon '${iconValue}'"
fi
echo "User data dir:${userDataDir}"
echo "Launcher:     ${nameValue}"
echo "Profile:      ${profileDirectory}"
echo "WM_CLASS:     ${startupWmClassValue}"
```

---

## 4) Run it

Examples:

```bash
./make-chrome-profile-launcher.sh 3 Fashionphile
./make-chrome-profile-launcher.sh 1 Tyler
```

This creates:

- Launcher: `~/.local/share/applications/chrome-<name>-profile-<n>.desktop`
- Icon: `~/.local/share/icons/chrome-<name>-profile-<n>.png`
- Data dir: `~/.local/share/chrome-profile-launchers/chrome-<name>-profile-<n>/`

---

## 5) Pin to the taskbar

1. Open the **Application Launcher**
2. Search for `Chrome - <Name>`
3. Launch it
4. Right-click the running item in the task manager → **Pin to Task Manager**

---

## Notes

### Why `--user-data-dir` is used
Default Chrome data is under:

```text
~/.config/google-chrome/
```

Using `--user-data-dir=...` makes each launcher use its own separate Chrome data root under:

```text
~/.local/share/chrome-profile-launchers/
```

That prevents KDE from merging the windows into one taskbar group.

### Where Chrome profile numbers map
- `0` → `Default`
- `1` → `Profile 1`
- `2` → `Profile 2`
- `3` → `Profile 3`
