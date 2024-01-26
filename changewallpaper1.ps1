# Set the URL to your desired image
$imageUrl = "https://raw.githubusercontent.com/Leozk2000/internstuff/main/anikacat.jpg"

# Set the local path where you want to save the downloaded image
$downloadPath = "C:\Temp\urlimage.jpg"

# Download the image from the URL
Invoke-WebRequest -Uri $imageUrl -OutFile $downloadPath

# Use the SystemParametersInfo function to change the wallpaper
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
[Wallpaper]::SystemParametersInfo(20, 0, $downloadPath, 3)

Write-Host "Wallpaper changed to $imageUrl"
