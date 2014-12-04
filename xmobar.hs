Config {
    font = "xft:Fixed-10",
    bgColor = "#161616",
    fgColor = "#ffffff",
    pickBroadest = True,
--    position = Static { xpos = 1920, ypos = 0, width = 1920, height = 16 },
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#599caa","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedbar>","-H","8192","-L","4096","-h","#FFB6B0","-l","#599caa","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#599caa","-n","#FFFFCC"] 10,
        Run Network "wlp5s0" ["-t","Net: <rx> | <tx>","-l","#599caa","-S", "True"] 10,
        Run Date "%a %b %_d %l:%M:%S" "date" 10,
        Run BatteryP ["BAT1"]
              ["-t", "<acstatus> (<left>%)",
               "-L", "10", "-H", "80", "-p", "3",
               "--", "-O", "<fc=green>On</fc> - ", "-i", "",
               "-L", "-15", "-H", "-5",
               "-f", "/sys/class/power_supply/BAT1/status",
               "-l", "red", "-m", "blue", "-h", "green"]
              600,
        Run MPD ["-t", "<state>: <artist> - <title> - <lapsed> <bar>"] 10,
        Run Kbd [("de", "de"), ("us", "us")],
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% } %mpd% { %multicpu%   %memory%   %swap% %wlp5s0% <fc=#FFFFCC>%date%</fc>     %battery% %kbd%"
}
