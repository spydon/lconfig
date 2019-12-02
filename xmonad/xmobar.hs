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
        Run Date "w.%V %a %b %_d %H:%M" "date" 600,
        Run DynNetwork [] 50,
        Run Battery [
          "-t", "<acstatus>: <left>% <timeleft>",
        "--",
        --"-c", "charge_full",
        "-O", "AC",
        "-o", "Bat",
        "-h", "green",
        "-l", "red"
        ] 600,
        Run Com "/home/lukasklingsbo/scripts/altcoin.sh" ["BTC"] "bitcoin" 600,
        Run Com "/home/lukasklingsbo/scripts/altcoin.sh" ["ETH"] "ethereum" 600,
        Run Com "/home/lukasklingsbo/scripts/altcoin.sh" ["XMR"] "monero" 600,
        Run Com "/home/lukasklingsbo/scripts/altcoin.sh" ["XRP"] "ripple" 600,
        Run StdinReader],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader%  }{ %bitcoin% | %ethereum% | %monero% | %ripple% | %multicpu% | %dynnetwork% | %memory% | %battery% | <fc=#ee9a00>%date%</fc>"
}

