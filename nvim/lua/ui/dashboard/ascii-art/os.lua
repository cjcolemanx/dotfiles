local M = {}
local os_logos = {}

M.arch_01 = {
  "      /\\      ",
  "     /  \\     ",
  "    /\\   \\   ",
  "   /      \\   ",
  "  /   ,,   \\  ",
  " /   |  |  -\\ ",
  "/_-''    ''-_\\"
}

M.arch_02 = {
  "              __                          ",
  "         _=(SDGJT=_                       ",
  "       _GTDJHGGFCVS)                      ",
  "      ,GTDJGGDTDFBGX0                     ",
  "      JDJDIJHRORVFSBSVL     -=+=,_        ",
  "     IJFDUFHJNXIXCDXDSV,       \"DEBL     ",
  "    [LKDSDJTDU=OUSCSBFLD.        '?ZWX,   ",
  "   ,LMDSDSWH'     `DCBOSI          DRDS], ",
  "   SDDFDFH'         !YEWD,        )HDROD  ",
  "  !KMDOCG            &GSU|  \\_GFHRGO\\'  ",
  "  HKLSGP'             __\\TKM0\\GHRBV)'   ",
  " JSNRVW'            __+MNAEC\\IOI,\\BN'   ",
  " HELK['         __,=OFFXCBGHCFD)          ",
  " ?KGHE      \\_-#DASDFLSV=''EF            ",
  " 'EHTI                   !H               ",
  " `0F'                    '!               ",
}

M.arch_03 = {
  "                    y:                    ",
  "                   sMN-                   ",
  "                  +MMMm`                  ",
  "                 /MMMMMd`                 ",
  "                :NMMMMMMy                 ",
  "               -NMMMMMMMMs                ",
  "              .NMMMMMMMMMM+               ",
  "             .mMMMMMMMMMMMM+              ",
  "             oNMMMMMMMMMMMMM+             ",
  "           `+:-+NMMMMMMMMMMMM+            ",
  "           .sNMNhNMMMMMMMMMMMM/           ",
  "         `hho/sNMMMMMMMMMMMMMMM/          ",
  "        `.`omMMmMMMMMMMMMMMMMMMM+         ",
  "       .mMNdshMMMMd+::oNMMMMMMMMMo        ",
  "      .mMMMMMMMMM+     `yMMMMMMMMMs       ",
  "     .NMMMMMMMMM/        yMMMMMMMMMy      ",
  "    -NMMMMMMMMMh         `mNMMMMMMMMd`    ",
  "   /NMMMNds+:.`             `-/oymMMMm.   ",
  "  +Mmy/.                          `:smN:  ",
  " /+.                                  -o. ",
}

M.arch_irony_01 = {
  "             .MMM..:MMMMMMM               ",
  "           MMMMMMMMMMMMMMMMMM             ",
  "           MMMMMMMMMMMMMMMMMMMM.          ",
  "          MMMMMMMMMMMMMMMMMMMMMM          ",
  "         ,MMMMMMMMMMMMMMMMMMMMMM:         ",
  "         MMMMMMMMMMMMMMMMMMMMMMMM         ",
  "   .MMMM'  MMMMMMMMMMMMMMMMMMMMMM         ",
  "  MMMMMM    `MMMMMMMMMMMMMMMMMMMM.        ",
  " MMMMMMMM      MMMMMMMMMMMMMMMMMM .       ",
  " MMMMMMMMM.       `MMMMMMMMMMMMM' MM.     ",
  " MMMMMMMMMMM.                     MMMM    ",
  " `MMMMMMMMMMMMM.       A R C H   ,MMMMM.  ",
  "  `MMMMMMMMMMMMMMMMM.   B T W  ,MMMMMMMM. ",
  "     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ",
  "       MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM: ",
  "          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ",
  "             `MMMMMMMMMMMMMMMMMMMMMMMM:   ",
  "                 ``MMMMMMMMMMMMMMMMM'     ",
}

M.arch_irony_02 = {
  "                                 ..   ",
  "                     ....,,:;+cclll   ",
  "       ...,,+:;  clllllllllllllllll   ",
  " ,cclllllllllll  lllllllllllllllllll  ",
  " llllllllllllll  lllll   lllllllllll  ",
  " llllll lllllll  llll  R  llllllllll  ",
  " lllll A llllll  lllll   lllllllllll  ",
  " llllll lllllll  lllllllllllllllllll  ",
  " llllllllllllll  lllllllllllllllllll  ",
  "                                     ",
  " llllllllllllll  lllllllllllllllllll  ",
  " llllllllllllll  lllllllllllllllllll  ",
  " llllllll lllll  lllllllllllllllllll  ",
  " lllllll C llll  lllllllllllll lllll  ",
  " llllllll lllll  llllllllllll H llll  ",
  " `'ccllllllllll  lllllllllllll lllll  ",
  "        `' \\*::  :ccllllllllllllllll ",
  "                        ````''*::cll  ",
  " btw                              ``  ",
}

M.arch_irony_03 = {
  "         ,.=:!!t3Z3z.,                ",
  "        :tt:::tt333EE3                ",
  "        Et:::ztt33EEEL @Ee.,      .., ",
  "       ;tt:::tt333EE7 ;EEEEEEttttt33# ",
  "      :Et:::zt333EEQ. $EEEEEttttt33QL ",
  "      it::::tt333EEF @EEEEEEttttt33F  ",
  "     ;3=*^```\"*4EEV :EEEEEEttttt33@.  ",
  "     ,.=::::!t=., ` @EEEEEEtttz33QF   ",
  "    ;::::::::zt33)   \"4EEEtttji3P*    ",
  "   :t::::::::tt33.:Z3z..  `` ,..g.    ",
  "   i::::::::zt33F AEEEtttt::::ztF     ",
  "  ;:::::::::t33V ;EEEttttt::::t3      ",
  "  E::::::::zt33L @EEEtttt::::z3F      ",
  " {3=*^```\"*4E3) ;EEEtttt:::::tZ`      ",
  "              ` :EEEEtttt::::z7       ",
  "                  \"VEzjt:;;z>*`       ",
  "                                      ",
  "                             Arch btw ",
}

table.insert(os_logos, M.arch_01)
table.insert(os_logos, M.arch_02)
table.insert(os_logos, M.arch_irony_01)
table.insert(os_logos, M.arch_irony_02)
table.insert(os_logos, M.arch_irony_03)

M.images = os_logos

return M
