dev_name="_bucket"
mod_dir="E:\Games\Steam\steamapps\common\Don't Starve Together\mods"
mod_path="$(cygpath -u "${mod_dir}")/${dev_name}/"
sed -i -e 's/abc/XYZ/g' /tmp/file.txt
autocompiler="E:\Games\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\autocompiler.exe"

rm -rf dist/ -R
rm -rf "${mod_path}" -R

cp src/ "${mod_path}" -R
"$(cygpath -u "${autocompiler}")"
rm -rf "${mod_path}"exported/ -R


cp "${mod_path}" dist/ -R
sed -i 's/!dev-//g' "dist/modinfo.lua"

cat << "EOF"
ooooo+++++++++++///////:::::::::--------------------:::::::::///////++++++++++oo
oooo+++++++++///////:::::/++:---------.........------------:::::://////+++++++++
oo+++++++++//////:::::/sho:--..........................:-------::::://////++++++
+++++++++/////::::::shd+-........:+/:.....``..........-oyy:.------::::://///++++
+++++++////:::::-/ydmy-......../smommdys+:.``````````:s..odo....-----:::://///++
+++++////::::--/hdhhm-....```/yyohmdNhsyysys/.`:-```:m.``.y+h:.....----:::://///
+++////::::--:ydddhmm.``````sh/+hhNhdNddsyhhdds/h```hy```.dy+hs.o....----::::///
+/////::::--+dmsdNdNM:`````hy```.hdmhhmyydyddy/hN/``+s+:`sNdy+ddo......----::::/
////::::--:yshdmdmNNMd:```/o`````yhmdhddyhdmNd+hdh``````omNydy/hN+`......----:::
///::::--omhydmNddNmNNho.```````odymdNddmymmNdsdNm.```-yhhdmhshmyN+``......---::
//:::---oydNmhmMmmmmNMNdh+:.`.+shdNddmdddhNmNdsNNm`./hdmomdhhydyohN/```.....----
/:::----syyhNmmNNmmmNMNmmydddhyddNMmydNmddmmmdyMNhydhhNomdmdsmymmysm````.....---
:::---..-dsdhmNNNNmmNMNdmdddddddmNMMddmmmNdmmyyNmydyhmdmdNmhmmMd++yd-`````....--
::----...+ddmhmNNNMmdMNsmmmmdmmmNNMMMmNNNMNmdshNdNhmMMmdMNdNNdsydhhs```````....-
:----..:..hddmNmdmNNNNmdhmmNNmmmmNmNMMMNMNmdmymNNmmdNNhNmdmNhhmmssy`````````....
:---....//-mddmNNNNmdNNm-``.:osdmdmhdNMNmmshmomdy+o+:/yhhmddNdyymh``````````....
---.....`-oommmmNNNNNmmd:.      `./+ohmMohso+-`       dNNmmmhydds````````````...
---....````-sNmNNNNmmddhs-`          ``::`           :NMNNmdhmh+`````````````...
---....``````:NNMNNNNmhsh-.                          shmmdmNNNy```````````````..
---....````+hosNmNMNNmdho-`                          -hmdmmhhhNy``````````````..
--.....`````/dhdmmNMNmdh+-`                .`         sddhhhmy/```````````````..
--.....``````.sNNMMMMNmyo:./osyyhyyyo     `hyysso+:   hdhhdy-``````````````````.
--..-.`````````-ymhddNNdy:-    `:/+o.      ./o:```   .Nddm.```````````````````..
--../..``````````-+h-+//y:-`   .:+mN/`     :NN/.     +mhsm.```````````````````..
---./-.````````````d//yyy::.   `:oNd:`   - :yo-.     y+s+m```````````-.```````..
---.-/..```````````+h:sh+s::`   `-/o+`   + `:.`     -dsyys```````````-/``````...
----.o..````````````yy+o:d/:-            o          y+hym.```````````-o``````...
:----o-..```````````.yyyhyh/:.         .`o         :hsds.````````````-s:````....
::---++..`````````````-.``hs::.         /+        `d-````````````````-so.```....
::--:oo:..```````:.```````.dy::`       .---`      ss`````````````````-so/``....-
:::-/s+o-...`````/:````````.hy//.    `-`         /d.`````````````````.oso-....--
/:::oo+oo....````/+``````````od+/.              :h.``````````````-````+oso...---
//:/ysssoo....```+o.``````````-yh/-`           +s````````````````o````/osso----:
///oosysooo......+o:````````````:hh/.        .o:`````````````````o-``.+ossoo--::
+/+s/syyy/+o-....+++``````````````-ydo.    -s/```````````````````+o..-sssy+/::::
++///+oyys:/o-../+/+-`````````````-h:dNh/+hNmo``````````````````.so-.+sosyy/:://
+++///oyyo+::+--o+o+o..```````````oh  +mmNd/`y.```````````````..-o+o-s+osys+:///
+++++/oyys::::-/ysoso+....```````o+N+ .hmNo  /h```````````......+soso++oyyy+////
++++++yyyy//::/yysssso+.........s:/Nm:ddmdm/-os-``````.........-yosoy:ooyyo+//++
++++++hyyys///soyyssoss+-......o:`yNNNmdmdmmms.y............---oyoyyysosyyo/++++

EOF
