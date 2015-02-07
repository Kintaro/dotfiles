Config {
    font = "xft:Ohsnap:style=Regular:pixelsize=12,Sazanami Mincho:style=Regular:pixelsize=12",
    position = Top
--    position = Static { xpos = 1928 , ypos = 8, width = 1904, height = 18 },
    bgColor = "#151515",
    fgColor = "#ebebeb",
--    borderColor = "#ebebeb",
--    borderWidth = 0,
--    border = FullB,
    pickBroadest = True,
    iconRoot = "/home/rootnode/.xmonad"
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","<icon=/home/rootnode/.xmonad/cpu.xbm/> <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#bf1e2d","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","<icon=/home/rootnode/.xmonad/mem.xbm/> <usedbar>","-H","8192","-L","4096","-h","#FFB6B0","-l","#bf1e2d","-n","#FFFFCC"] 10,
        Run Swap ["-t","<icon=/home/rootnode/.xmonad/diskette.xbm/> <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#bf1e2d","-n","#FFFFCC"] 10,
        Run Network "wlan0" ["-t","<icon=/home/rootnode/.xmonad/wifi_01.xbm/> <rx> | <tx>","-l","#bf1e2d","-S", "True"] 10,
        Run Date "%a %b %_d %l:%M:%S" "date" 10,
        Run BatteryP ["BAT1"]
              ["-t", "<acstatus> (<left>%)",
               "-L", "10", "-H", "80", "-p", "3",
               "--", "-O", "<fc=green>On</fc> - ", "-i", "",
               "-L", "-15", "-H", "-5",
               "-f", "/sys/class/power_supply/BAT1/status",
               "-l", "red", "-m", "blue", "-h", "green"]
              600,
        Run MPD ["-t", "<statei>: <fc=#bf1e2d><artist></fc> - <title> - <lapsed> <bar>"] 10,
        Run Kbd [("de", "de"), ("us", "us")],
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " <icon=/home/rootnode/.xmonad/arch.xbm/> %StdinReader% } %mpd% { %multicpu%   %memory%   %swap% %wlan0% %date%     %battery% %kbd% "
}
