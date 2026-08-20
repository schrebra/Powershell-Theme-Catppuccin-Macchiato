function Set-CatppuccinMacchiato {
    <#
    .SYNOPSIS
    Applies or removes the Catppuccin Macchiato theme for PowerShell Console and ISE 5.1.
    .DESCRIPTION
    This script uses the exact color palette provided in the Notepad++ XML to configure 
    PSReadLine syntax highlighting and ISE 5.1 UI/Token colors.
    .EXAMPLE
    Set-CatppuccinMacchiato -Action Apply
    .EXAMPLE
    Set-CatppuccinMacchiato -Action Remove
    #>
    param(
        [Parameter(Mandatory=$false)]
        [ValidateSet('Apply', 'Remove')]
        [string]$Action = 'Apply'
    )

    # Complete Catppuccin Macchiato Palette extracted from the provided XML
    $Macchiato = @{
        Base       = "#24273A" # Global background / Default bgColor
        Crust      = "#181926" # Bad brace foreground / Error bg
        Text       = "#CAD3F5" # Global foreground / Default fgColor
        Subtext1   = "#B8C0E0" # Inactive tabs text (Global)
        Subtext0   = "#A5ADCB" # EOL / Non-printing chars
        Overlay2   = "#939AB7" # Operators / Comments
        Overlay1   = "#8087A2" # Line number margin / Doc comments
        Overlay0   = "#6E738D" # Smart Highlighting
        Surface2   = "#5B6078" # Document map bg
        Surface1   = "#454A5F" # Selection / Brace highlight bg
        Surface0   = "#35394D" # Current line background
        Blue       = "#8AADF4" # Commands / Functions / Aliases / Tags
        Lavender   = "#B7BDF8" # Change history revert modified
        Sapphire   = "#7DC4E4" # Mark style 1
        Sky        = "#91D7E3" # Operators (in some lexers) / URL hovered
        Teal       = "#8BD5CA" # User keywords / Members
        Green      = "#A6DA95" # Strings / Added lines
        Yellow     = "#EED49F" # Warnings / Types / Preprocessor
        Peach      = "#F5A97F" # Numbers / Hide symbol
        Maroon     = "#EE99A0" # Removed key / Parameter
        Red        = "#ED8796" # Errors / Deleted lines
        Mauve      = "#C6A0F6" # Keywords / Instruction words
        Pink       = "#F5BDE6" # Parameters / Regex / Verbatim
        Flamingo   = "#F0C6C6" # User keywords 8
        Rosewater  = "#F4DBD6" # Caret color / Preprocessor
    }

    # Helper function to convert Hex to RGB for ANSI VT sequences
    function Convert-HexToRgb ([string]$Hex) {
        $Hex = $Hex.TrimStart("#")
        $R = [Convert]::ToInt32($Hex.Substring(0,2), 16)
        $G = [Convert]::ToInt32($Hex.Substring(2,2), 16)
        $B = [Convert]::ToInt32($Hex.Substring(4,2), 16)
        return "$R;$G;$B"
    }

    # --- PowerShell ISE Logic ---
    if ($psISE) {
        if ($Action -eq 'Apply') {
            # Set ISE UI background and foreground colors
            $psISE.Options.ConsolePaneBackgroundColor = $Macchiato.Base
            $psISE.Options.ConsolePaneTextBackgroundColor = $Macchiato.Base
            $psISE.Options.ConsolePaneForegroundColor = $Macchiato.Text
            $psISE.Options.ScriptPaneBackgroundColor = $Macchiato.Base
            $psISE.Options.ScriptPaneForegroundColor = $Macchiato.Text
            
            # Set ISE Script Pane Syntax Token Colors (Mapping XML to ISE Tokens)
            $psISE.Options.TokenColors['Command']            = $Macchiato.Blue
            $psISE.Options.TokenColors['CommandParameter']   = $Macchiato.Pink
            $psISE.Options.TokenColors['CommandArgument']    = $Macchiato.Text
            $psISE.Options.TokenColors['Variable']           = $Macchiato.Text
            $psISE.Options.TokenColors['String']             = $Macchiato.Green
            $psISE.Options.TokenColors['Number']             = $Macchiato.Peach
            $psISE.Options.TokenColors['Comment']            = $Macchiato.Overlay2
            $psISE.Options.TokenColors['Keyword']            = $Macchiato.Mauve
            $psISE.Options.TokenColors['Operator']           = $Macchiato.Overlay2
            $psISE.Options.TokenColors['Type']               = $Macchiato.Mauve
            $psISE.Options.TokenColors['Member']             = $Macchiato.Teal
            $psISE.Options.TokenColors['GroupStart']         = $Macchiato.Overlay2
            $psISE.Options.TokenColors['GroupEnd']           = $Macchiato.Overlay2
            $psISE.Options.TokenColors['NewLine']            = $Macchiato.Text
            $psISE.Options.TokenColors['LineContinuation']   = $Macchiato.Text
            $psISE.Options.TokenColors['StatementSeparator'] = $Macchiato.Overlay2
            $psISE.Options.TokenColors['Unknown']            = $Macchiato.Text
            $psISE.Options.TokenColors['Attribute']          = $Macchiato.Yellow
            $psISE.Options.TokenColors['Position']           = $Macchiato.Overlay1
            
            # Set ISE Console Pane Syntax Token Colors
            $psISE.Options.ConsoleTokenColors['Command']            = $Macchiato.Blue
            $psISE.Options.ConsoleTokenColors['CommandParameter']   = $Macchiato.Pink
            $psISE.Options.ConsoleTokenColors['CommandArgument']    = $Macchiato.Text
            $psISE.Options.ConsoleTokenColors['Variable']           = $Macchiato.Text
            $psISE.Options.ConsoleTokenColors['String']             = $Macchiato.Green
            $psISE.Options.ConsoleTokenColors['Number']             = $Macchiato.Peach
            $psISE.Options.ConsoleTokenColors['Comment']            = $Macchiato.Overlay2
            $psISE.Options.ConsoleTokenColors['Keyword']            = $Macchiato.Mauve
            $psISE.Options.ConsoleTokenColors['Operator']           = $Macchiato.Overlay2
            $psISE.Options.ConsoleTokenColors['Type']               = $Macchiato.Mauve
            $psISE.Options.ConsoleTokenColors['Member']             = $Macchiato.Teal
            $psISE.Options.ConsoleTokenColors['GroupStart']         = $Macchiato.Overlay2
            $psISE.Options.ConsoleTokenColors['GroupEnd']           = $Macchiato.Overlay2
            $psISE.Options.ConsoleTokenColors['NewLine']            = $Macchiato.Text
            $psISE.Options.ConsoleTokenColors['LineContinuation']   = $Macchiato.Text
            $psISE.Options.ConsoleTokenColors['StatementSeparator'] = $Macchiato.Overlay2
            $psISE.Options.ConsoleTokenColors['Unknown']            = $Macchiato.Text
            $psISE.Options.ConsoleTokenColors['Attribute']          = $Macchiato.Yellow
            $psISE.Options.ConsoleTokenColors['Position']           = $Macchiato.Overlay1
            
            # Set Output pane colors (Errors, Warnings, etc.) based on XML GlobalStyles
            $psISE.Options.ErrorBackgroundColor = $Macchiato.Crust
            $psISE.Options.ErrorForegroundColor = $Macchiato.Red
            $psISE.Options.WarningBackgroundColor = $Macchiato.Base
            $psISE.Options.WarningForegroundColor = $Macchiato.Yellow
            $psISE.Options.VerboseBackgroundColor = $Macchiato.Base
            $psISE.Options.VerboseForegroundColor = $Macchiato.Blue
            $psISE.Options.DebugBackgroundColor = $Macchiato.Base
            $psISE.Options.DebugForegroundColor = $Macchiato.Teal

            Write-Host "Catppuccin Macchiato theme applied to PowerShell ISE!"
        }
        elseif ($Action -eq 'Remove') {
            # Restore ISE defaults
            $psISE.Options.RestoreDefaultTokenColors()
            $psISE.Options.RestoreDefaultConsoleTokenColors()
            
            # Restore UI colors to ISE Defaults
            $psISE.Options.ConsolePaneBackgroundColor = "#FFFFFF"
            $psISE.Options.ConsolePaneTextBackgroundColor = "#FFFFFF"
            $psISE.Options.ConsolePaneForegroundColor = "#000000"
            $psISE.Options.ScriptPaneBackgroundColor = "#FFFFFF"
            $psISE.Options.ScriptPaneForegroundColor = "#000000"
            $psISE.Options.ErrorBackgroundColor = "#FFFFFF"
            $psISE.Options.ErrorForegroundColor = "#FF0000"
            $psISE.Options.WarningBackgroundColor = "#FFFFFF"
            $psISE.Options.WarningForegroundColor = "#000000"
            $psISE.Options.VerboseBackgroundColor = "#FFFFFF"
            $psISE.Options.VerboseForegroundColor = "#000000"
            $psISE.Options.DebugBackgroundColor = "#FFFFFF"
            $psISE.Options.DebugForegroundColor = "#000000"
            
            Write-Host "Theme removed. Default ISE colors restored."
        }
    }
    # --- PowerShell Console Logic ---
    else {
        if ($Action -eq 'Apply') {
            # 1. Set PSReadLine syntax highlighting colors
            if (Get-Module -ListAvailable -Name PSReadLine) {
                Set-PSReadLineOption -Color @{
                    Command            = $Macchiato.Blue
                    Parameter          = $Macchiato.Pink
                    Operator           = $Macchiato.Overlay2
                    Variable           = $Macchiato.Text
                    String             = $Macchiato.Green
                    Number             = $Macchiato.Peach
                    Type               = $Macchiato.Mauve
                    Comment            = $Macchiato.Overlay2
                    Keyword            = $Macchiato.Mauve
                    Error              = $Macchiato.Red
                    Member             = $Macchiato.Teal
                    Emphasis           = $Macchiato.Rosewater
                    Selection          = $Macchiato.Surface1
                    Default            = $Macchiato.Text
                    ContinuationPrompt = $Macchiato.Overlay1
                    Unknown            = $Macchiato.Text
                }
            }

            # 2. Set background and foreground using ANSI VT sequences
            $bgRgb = Convert-HexToRgb $Macchiato.Base
            $fgRgb = Convert-HexToRgb $Macchiato.Text

            [char]27 + "[48;2;$bgRgb" + "m" | Out-Host -NoNewline
            [char]27 + "[38;2;$fgRgb" + "m" | Out-Host -NoNewline
            
            # Clear the screen so the new background color fills the entire console buffer
            Clear-Host
            Write-Host "Catppuccin Macchiato theme applied to PowerShell Console!"
        }
        elseif ($Action -eq 'Remove') {
            # 1. Restore PSReadLine defaults
            if (Get-Module -ListAvailable -Name PSReadLine) {
                Set-PSReadLineOption -Color @{
                    Command            = 'Yellow'
                    Parameter          = 'DarkGray'
                    Operator           = 'DarkGray'
                    Variable           = 'Gray'
                    String             = 'DarkCyan'
                    Number             = 'DarkCyan'
                    Type               = 'Gray'
                    Comment            = 'DarkGreen'
                    Keyword            = 'DarkGreen'
                    Error              = 'DarkRed'
                    Member             = 'Gray'
                    Emphasis           = 'Cyan'
                    Selection          = 'White'
                    Default            = 'Gray'
                    ContinuationPrompt = 'Gray'
                    Unknown            = 'Gray'
                }
            }

            # 2. Reset console background and foreground to defaults
            $Host.UI.RawUI.BackgroundColor = "Black"
            $Host.UI.RawUI.ForegroundColor = "Gray"
            
            # Send ANSI reset sequence and clear screen
            [char]27 + "[0m" | Out-Host -NoNewline
            Clear-Host
            Write-Host "Theme removed. Default Console colors restored."
        }
    }
}

Set-CatppuccinMacchiato
