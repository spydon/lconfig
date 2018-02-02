Config {
    font = "xft:Monospace:pixelsize=12",
    allDesktops = True,
    pickBroadest = True,   -- choose widest display (multi-monitor) 
    commands = [
        Run MultiCpu       [ "--template" , "Cpu: <total0>% <total1>% <total2>% <total3>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 100,
        Run Memory ["-t","Mem: <usedratio>%"] 100,
        Run Date "%a %b %_d %H:%M" "date" 600,
        Run DynNetwork [] 50,
        Run Battery [
          "-t", "<acstatus>: <left>% <timeleft>",
        "--",
        --"-c", "charge_full",
        "-O", "AC",
        "-o", "Bat",
        "-h", "green",
        "-l", "red"
        ] 10,
        Run Com "/home/spydon/scripts/altcoin.sh" ["BTC"] "bitcoin" 600,
        Run Com "/home/spydon/scripts/altcoin.sh" ["XMR"] "monero" 600,
        Run MPD ["-t",
                  "<artist>: <title> (<album>) <state>", -- <remaining>
                            "--", "-P", ">>", "-Z", "|", "-S", "><"] 30,
        Run StdinReader],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader%  }{ %bitcoin% | %monero% | %multicpu% | %dynnetwork% | %memory% | %battery% | <fc=#ee9a00>%date%</fc>"
    --template = "%StdinReader%  Playing: %mpd% }{ %multicpu% | %dynnetwork% | %memory% | %battery% | <fc=#ee9a00>%date%</fc>"
}

