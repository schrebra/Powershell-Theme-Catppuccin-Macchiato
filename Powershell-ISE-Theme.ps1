# Ensure this is running in PowerShell ISE
if ($host.Name -ne 'Windows PowerShell ISE Host') {
    Write-Warning "This script must be executed within PowerShell ISE."
    return
}

# Helper to convert Hex to WPF Color
function Get-WpfColor ([string]$HexColor) {
    [System.Windows.Media.ColorConverter]::ConvertFromString($HexColor)
}

# Catppuccin Macchiato Palette Mapping
$macchiato = @{
    Base     = Get-WpfColor '#24273a'
    Text     = Get-WpfColor '#cad3f5'
    Overlay1 = Get-WpfColor '#8087a2'
    Blue     = Get-WpfColor '#8aadf4'
    Green    = Get-WpfColor '#a6da95'
    Mauve    = Get-WpfColor '#c6a0f6'
    Yellow   = Get-WpfColor '#eed49f'
    Teal     = Get-WpfColor '#8bd5ca'
    Flamingo = Get-WpfColor '#f0c6c6'
    Peach    = Get-WpfColor '#f5a97f'
    Red      = Get-WpfColor '#ed8796'
    Sapphire = Get-WpfColor '#7dc4e4'
    Maroon   = Get-WpfColor '#ee99a0'
}

# 1. Editor and Console Backgrounds/Foregrounds
$psISE.Options.ScriptPaneBackgroundColor      = $macchiato.Base
$psISE.Options.ConsolePaneBackgroundColor     = $macchiato.Base
$psISE.Options.ConsolePaneTextBackgroundColor = $macchiato.Base
$psISE.Options.ConsolePaneForegroundColor     = $macchiato.Text

# 2. Syntax Highlighting (Token Colors)
$tokens = $psISE.Options.TokenColors
$tokens['Attribute']         = $macchiato.Yellow
$tokens['Command']           = $macchiato.Blue
$tokens['CommandArgument']   = $macchiato.Text
$tokens['CommandParameter']  = $macchiato.Maroon
$tokens['Comment']           = $macchiato.Overlay1
$tokens['GroupEnd']          = $macchiato.Overlay1
$tokens['GroupStart']        = $macchiato.Overlay1
$tokens['Keyword']           = $macchiato.Mauve
$tokens['LineContinuation']  = $macchiato.Overlay1
$tokens['LoopLabel']         = $macchiato.Teal
$tokens['Member']            = $macchiato.Sapphire
$tokens['Number']            = $macchiato.Peach
$tokens['Operator']          = $macchiato.Teal
$tokens['Position']          = $macchiato.Overlay1
$tokens['StatementSeparator']= $macchiato.Overlay1
$tokens['String']            = $macchiato.Green
$tokens['Type']              = $macchiato.Yellow
$tokens['Unknown']           = $macchiato.Red
$tokens['Variable']          = $macchiato.Flamingo
