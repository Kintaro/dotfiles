Config {
    font = "xft:Envy Code R for Powerline:pixelsize=12,Sazanami Mincho:pixelsize=10",
--    position = TopW C 98
    position = Static { xpos = 1938 , ypos = 8, width = 1884, height = 14 },
    bgColor = "#fafafa",
    fgColor = "#4d4d4c",
--    border = FullB,
    borderColor = "#1f1f1f",
    pickBroadest = True,
    iconRoot = "/home/rootnode/.xmonad"
--    position = Static { xpos = 1920, ypos = 0, width = 1920, height = 16 },
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","<icon=/home/rootnode/.xmonad/cpu.xbm/> <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#4271ae","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","<icon=/home/rootnode/.xmonad/mem.xbm/> <usedbar>","-H","8192","-L","4096","-h","#FFB6B0","-l","#4271ae","-n","#FFFFCC"] 10,
        Run Swap ["-t","<icon=/home/rootnode/.xmonad/diskette.xbm/> <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#4271ae","-n","#FFFFCC"] 10,
        Run Network "wlan0" ["-t","<icon=/home/rootnode/.xmonad/wifi_01.xbm/> <rx> | <tx>","-l","#4271ae","-S", "True"] 10,
        Run Date "%a %b %_d %l:%M:%S" "date" 10,
        Run BatteryP ["BAT1"]
              ["-t", "<acstatus> (<left>%)",
               "-L", "10", "-H", "80", "-p", "3",
               "--", "-O", "<fc=green>On</fc> - ", "-i", "",
               "-L", "-15", "-H", "-5",
               "-f", "/sys/class/power_supply/BAT1/status",
               "-l", "red", "-m", "blue", "-h", "green"]
              600,
        Run MPD ["-t", "<statei>: <fc=#4271ae><artist></fc> - <title> - <lapsed> <bar>"] 10,
        Run Kbd [("de", "de"), ("us", "us")],
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " <icon=/home/rootnode/.xmonad/arch.xbm/> %StdinReader% } %mpd% { %multicpu%   %memory%   %swap% %wlan0% %date%     %battery% %kbd% "
}
