# Set a Windows Terminal--Style Icon for Tabby (KDE Plasma)

These steps replace **only the Tabby app icon** without changing your
system icon theme.

------------------------------------------------------------------------

## 1. Download the Windows Terminal SVG Icon

``` bash
mkdir -p ~/.local/share/icons && curl -L "https://upload.wikimedia.org/wikipedia/commons/5/51/Windows_Terminal_logo.svg" -o ~/.local/share/icons/windows-terminal.svg
```

This saves the icon to:

    ~/.local/share/icons/windows-terminal.svg

SVG works best because KDE Plasma scales vector icons perfectly at any
taskbar size.

------------------------------------------------------------------------

## 2. Override the Tabby Launcher Icon

``` bash
cp /usr/share/applications/tabby.desktop ~/.local/share/applications/tabby.desktop && sed -i 's|^Icon=.*|Icon=/home/'"$USER"'/.local/share/icons/windows-terminal.svg|' ~/.local/share/applications/tabby.desktop && kbuildsycoca6
```

This: - Copies the system launcher to your user launcher directory -
Changes the icon path - Refreshes the KDE application database

------------------------------------------------------------------------

## 3. Restart Plasma (If the Icon Does Not Update)

``` bash
kquitapp6 plasmashell && kstart plasmashell
```

------------------------------------------------------------------------

## Result

Tabby will now use the **Windows Terminal icon** in:

-   KDE taskbar
-   Application launcher
-   Alt+Tab switcher

No other system icons are affected.
