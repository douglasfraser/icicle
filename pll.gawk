BEGIN { print "module pll(\n\tinput  clock_in,\n\toutput clock_out,\n\toutput locked\n\t);\n\nSB_PLL40_CORE #(" };
match($0, /.*FEEDBACK: (.*?)/, f) { print "\t\t.FEEDBACK_PATH(\"" f[1] "\")," };
match($0, /.*(DIV.):\s+([[:digit:]]+) (.*?)/, d) { print "\t\t." toupper(d[1]) d[3] ",\t\t// " toupper(d[1]) " = " d[2]; };
match($0, /.*(FILTER_RANGE):\s+([[:digit:]]+) (.*?)/, fr) { print "\t\t." toupper(fr[1]) fr[3] "\t// " toupper(fr[1]) " = " fr[2]; };
END { print "\t) uut (\n\t\t.LOCK(locked),\n\t\t.RESETB(1'b1),\n\t\t.BYPASS(1'b0),\n\t\t.REFERENCECLK(clock_in),\n\t\t.PLLOUTCORE(clock_out)\n\t\t);\n\nendmodule" };
