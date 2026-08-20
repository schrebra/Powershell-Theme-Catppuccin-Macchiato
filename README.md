# Powershell-Theme-Catppuccin-Macchiato

A native dark mode configuration bringing the soothing, pastel tones of the [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin) palette directly to your PowerShell environments.

This repository contains the necessary scripts to apply the theme to both the standard Windows PowerShell 5.1 console (via 24-bit ANSI escape sequences) and the PowerShell ISE (via WPF color objects).

---

## 🚀 Usage

Since the configuration files are maintained in this repository, you can easily pull them down and apply them to your local environment.

### Standard PowerShell Console

The console script modifies your `PSReadLine` syntax highlighting tokens.

1. Clone or download this repository.
2. Open your standard PowerShell profile by running `notepad $PROFILE`.
3. Copy the contents of the console theme script from this repository into your profile.
4. Save and restart your session, or run `. $PROFILE` to reload.

> **Note on Background Colors:** The legacy Windows console (`conhost.exe`) cannot render the true `#24273a` Macchiato background color natively. To achieve the full aesthetic, run PowerShell inside **Windows Terminal** with a matching background hex defined in your `settings.json`.

### PowerShell ISE

The ISE script maps the Macchiato palette directly to the `$psISE.Options` object.

1. Open PowerShell ISE.
2. Load and run the ISE theme script provided in this repository.
3. The editor and console panes will instantly update. These settings automatically save to your user profile and will persist across future sessions.

---

Are there specific script filenames in your repository root (like `Install-ConsoleTheme.ps1`) that you want me to explicitly name in those numbered steps to make the documentation clearer for other users?
