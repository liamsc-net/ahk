DetectHiddenWindows, On
WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
PixelGetColor, color, 565, 983
if (color == "0x36681A")
{
    ExitApp
}
else if (color == "0x181818")
{
    WinActivate, ahk_exe C:\Users\thega\AppData\Roaming\Spotify\Spotify.exe
    PixelGetColor, color2, 560, 1004
    if (color2 == "0x54B91D"){
        SendEvent, ^{r}
    }
    else if (color2 == "0x181818") {
        SendEvent, ^{r}
        sleep 100
        SendEvent, ^{r}
    }
}
ExitApp