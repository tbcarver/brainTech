# Set a Windows Terminal--Style Icon for Tabby (KDE Plasma)

These steps replace **only the Tabby app icon** without changing your
system icon theme.

------------------------------------------------------------------------

## 1. Download the Windows Terminal Icon

``` bash
mkdir -p ~/.local/share/icons && curl -L "https://store-images.s-microsoft.com/image/apps.8232.13926773940052066.8978812d-6c65-429b-835d-2cecd178e2d7.7cb2976d-0593-49c3-8ab7-8bce4a09d750?h=307" -o ~/.local/share/icons/windows-terminal.webp
```

This saves the icon to:

    ~/.local/share/icons/windows-terminal.webp

------------------------------------------------------------------------

## 2. Override the Tabby Launcher Icon

``` bash
cp /usr/share/applications/tabby.desktop ~/.local/share/applications/tabby.desktop && \
sed -i 's|^Icon=.*|Icon=/home/'"$USER"'/.local/share/icons/windows-terminal.webp|' ~/.local/share/applications/tabby.desktop && \
kbuildsycoca6
```

This: - Copies the system launcher to your user launcher directory -
Changes the icon path - Refreshes the KDE application database

------------------------------------------------------------------------

## 3. Restart Plasma (If the Icon Does Not Update)

``` bash
kquitapp5 plasmashell && kstart5 plasmashell
```

------------------------------------------------------------------------

## Result

Tabby will now use the **Windows Terminal--style icon** in:

-   KDE taskbar
-   Application launcher
-   Alt+Tab switcher

No other system icons are affected.
