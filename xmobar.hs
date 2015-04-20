Config {
    font = "xft:Terminess Powerline:pixelsize=10",
    position = Top
--    position = Static { xpos = 1928 , ypos = 8, width = 1904, height = 18 },
    bgColor = "#282828",
    fgColor = "#ebdbb2",
    borderColor = "#e4e4e4",
    borderWidth = 1,
    border = FullB,
    pickBroadest = True,
    iconRoot = "/home/rootnode/.xmonad"
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","<icon=/home/rootnode/.xmonad/cpu.xbm/> <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#fabd2f","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","<icon=/home/rootnode/.xmonad/mem.xbm/> <usedbar>","-H","8192","-L","4096","-h","#FFB6B0","-l","#fabd2f","-n","#FFFFCC"] 10,
        Run Swap ["-t","<icon=/home/rootnode/.xmonad/diskette.xbm/> <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#fabd2f","-n","#FFFFCC"] 10,
        Run Network "wlp5s0" ["-t","<icon=/home/rootnode/.xmonad/wifi_01.xbm/> <rx> | <tx>","-l","#fabd2f","-S", "True"] 10,
        Run Network "enp3s0" ["-t","<icon=/home/rootnode/.xmonad/wifi_01.xbm/> <rx> | <tx>","-l","#fabd2f","-S", "True"] 10,
        Run Date "%a %b %_d %l:%M:%S" "date" 10,
        Run BatteryP ["BAT1"]
              ["-t", "<acstatus> (<left>%)",
               "-L", "10", "-H", "80", "-p", "3",
               "--", "-O", "<fc=green>On</fc> - ", "-i", "",
               "-L", "-15", "-H", "-5",
               "-f", "/sys/class/power_supply/BAT1/status",
               "-l", "red", "-m", "blue", "-h", "green"]
              600,
        Run MPD ["-t", "<statei>: <fc=#fabd2f><artist></fc> - <title> - <lapsed> <bar>"] 10,
        Run Kbd [("de", "de"), ("us", "us")],
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " <icon=/home/rootnode/.xmonad/arch.xbm/> %StdinReader% } %mpd% { %multicpu%   %memory%   %swap% %wlp5s0% %enp3s0% %date%     %battery%  %kbd% "
}
