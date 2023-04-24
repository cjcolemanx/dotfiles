#!/usr/bin/env bash
eight_bit="$1"

lookup() {
	case "${1}" in
	000) echo "000000" ;;
	001) echo "800000" ;;
	002) echo "008000" ;;
	003) echo "808000" ;;
	004) echo "000080" ;;
	005) echo "800080" ;;
	006) echo "008080" ;;
	007) echo "c0c0c0" ;;
	008) echo "808080" ;;
	009) echo "ff0000" ;;
	010) echo "00ff00" ;;
	011) echo "ffff00" ;;
	012) echo "0000ff" ;;
	013) echo "ff00ff" ;;
	014) echo "00ffff" ;;
	015) echo "ffffff" ;;
	016) echo '000000' ;;
	017) echo '00005f' ;;
	018) echo '000087' ;;
	019) echo '0000af' ;;
	020) echo '0000d7' ;;
	021) echo '0000ff' ;;
	022) echo '005f00' ;;
	023) echo '005f5f' ;;
	024) echo '005f87' ;;
	025) echo '005faf' ;;
	026) echo '005fd7' ;;
	027) echo '005fff' ;;
	028) echo '008700' ;;
	029) echo '00875f' ;;
	030) echo '008787' ;;
	031) echo '0087af' ;;
	032) echo '0087d7' ;;
	033) echo '0087ff' ;;
	034) echo '00af00' ;;
	035) echo '00af5f' ;;
	036) echo '00af87' ;;
	037) echo '00afaf' ;;
	038) echo '00afd7' ;;
	039) echo '00afff' ;;
	040) echo '00d700' ;;
	041) echo '00d75f' ;;
	042) echo '00d787' ;;
	043) echo '00d7af' ;;
	044) echo '00d7d7' ;;
	045) echo '00d7ff' ;;
	046) echo '00ff00' ;;
	047) echo '00ff5f' ;;
	048) echo '00ff87' ;;
	049) echo '00ffaf' ;;
	050) echo '00ffd7' ;;
	051) echo '00ffff' ;;
	052) echo '5f0000' ;;
	053) echo '5f005f' ;;
	054) echo '5f0087' ;;
	055) echo '5f00af' ;;
	056) echo '5f00d7' ;;
	057) echo '5f00ff' ;;
	058) echo '5f5f00' ;;
	059) echo '5f5f5f' ;;
	060) echo '5f5f87' ;;
	061) echo '5f5faf' ;;
	062) echo '5f5fd7' ;;
	063) echo '5f5fff' ;;
	064) echo '5f8700' ;;
	065) echo '5f875f' ;;
	066) echo '5f8787' ;;
	067) echo '5f87af' ;;
	068) echo '5f87d7' ;;
	069) echo '5f87ff' ;;
	070) echo '5faf00' ;;
	071) echo '5faf5f' ;;
	072) echo '5faf87' ;;
	073) echo '5fafaf' ;;
	074) echo '5fafd7' ;;
	075) echo '5fafff' ;;
	076) echo '5fd700' ;;
	077) echo '5fd75f' ;;
	078) echo '5fd787' ;;
	079) echo '5fd7af' ;;
	080) echo '5fd7d7' ;;
	081) echo '5fd7ff' ;;
	082) echo '5fff00' ;;
	083) echo '5fff5f' ;;
	084) echo '5fff87' ;;
	085) echo '5fffaf' ;;
	086) echo '5fffd7' ;;
	087) echo '5fffff' ;;
	088) echo '870000' ;;
	089) echo '87005f' ;;
	090) echo '870087' ;;
	091) echo '8700af' ;;
	092) echo '8700d7' ;;
	093) echo '8700ff' ;;
	094) echo '875f00' ;;
	095) echo '875f5f' ;;
	096) echo '875f87' ;;
	097) echo '875faf' ;;
	098) echo '875fd7' ;;
	099) echo '875fff' ;;
	100) echo '878700' ;;
	101) echo '87875f' ;;
	102) echo '878787' ;;
	103) echo '8787af' ;;
	104) echo '8787d7' ;;
	105) echo '8787ff' ;;
	106) echo '87af00' ;;
	107) echo '87af5f' ;;
	108) echo '87af87' ;;
	109) echo '87afaf' ;;
	110) echo '87afd7' ;;
	111) echo '87afff' ;;
	112) echo '87d700' ;;
	113) echo '87d75f' ;;
	114) echo '87d787' ;;
	115) echo '87d7af' ;;
	116) echo '87d7d7' ;;
	117) echo '87d7ff' ;;
	118) echo '87ff00' ;;
	119) echo '87ff5f' ;;
	120) echo '87ff87' ;;
	121) echo '87ffaf' ;;
	122) echo '87ffd7' ;;
	123) echo '87ffff' ;;
	124) echo 'af0000' ;;
	125) echo 'af005f' ;;
	126) echo 'af0087' ;;
	127) echo 'af00af' ;;
	128) echo 'af00d7' ;;
	129) echo 'af00ff' ;;
	130) echo 'af5f00' ;;
	131) echo 'af5f5f' ;;
	132) echo 'af5f87' ;;
	133) echo 'af5faf' ;;
	134) echo 'af5fd7' ;;
	135) echo 'af5fff' ;;
	136) echo 'af8700' ;;
	137) echo 'af875f' ;;
	138) echo 'af8787' ;;
	139) echo 'af87af' ;;
	140) echo 'af87d7' ;;
	141) echo 'af87ff' ;;
	142) echo 'afaf00' ;;
	143) echo 'afaf5f' ;;
	144) echo 'afaf87' ;;
	145) echo 'afafaf' ;;
	146) echo 'afafd7' ;;
	147) echo 'afafff' ;;
	148) echo 'afd700' ;;
	149) echo 'afd75f' ;;
	150) echo 'afd787' ;;
	151) echo 'afd7af' ;;
	152) echo 'afd7d7' ;;
	153) echo 'afd7ff' ;;
	154) echo 'afff00' ;;
	155) echo 'afff5f' ;;
	156) echo 'afff87' ;;
	157) echo 'afffaf' ;;
	158) echo 'afffd7' ;;
	159) echo 'afffff' ;;
	160) echo 'd70000' ;;
	161) echo 'd7005f' ;;
	162) echo 'd70087' ;;
	163) echo 'd700af' ;;
	164) echo 'd700d7' ;;
	165) echo 'd700ff' ;;
	166) echo 'd75f00' ;;
	167) echo 'd75f5f' ;;
	168) echo 'd75f87' ;;
	169) echo 'd75faf' ;;
	170) echo 'd75fd7' ;;
	171) echo 'd75fff' ;;
	172) echo 'd78700' ;;
	173) echo 'd7875f' ;;
	174) echo 'd78787' ;;
	175) echo 'd787af' ;;
	176) echo 'd787d7' ;;
	177) echo 'd787ff' ;;
	178) echo 'd7af00' ;;
	179) echo 'd7af5f' ;;
	180) echo 'd7af87' ;;
	181) echo 'd7afaf' ;;
	182) echo 'd7afd7' ;;
	183) echo 'd7afff' ;;
	184) echo 'd7d700' ;;
	185) echo 'd7d75f' ;;
	186) echo 'd7d787' ;;
	187) echo 'd7d7af' ;;
	188) echo 'd7d7d7' ;;
	189) echo 'd7d7ff' ;;
	190) echo 'd7ff00' ;;
	191) echo 'd7ff5f' ;;
	192) echo 'd7ff87' ;;
	193) echo 'd7ffaf' ;;
	194) echo 'd7ffd7' ;;
	195) echo 'd7ffff' ;;
	196) echo 'ff0000' ;;
	197) echo 'ff005f' ;;
	198) echo 'ff0087' ;;
	199) echo 'ff00af' ;;
	200) echo 'ff00d7' ;;
	201) echo 'ff00ff' ;;
	202) echo 'ff5f00' ;;
	203) echo 'ff5f5f' ;;
	204) echo 'ff5f87' ;;
	205) echo 'ff5faf' ;;
	206) echo 'ff5fd7' ;;
	207) echo 'ff5fff' ;;
	208) echo 'ff8700' ;;
	209) echo 'ff875f' ;;
	210) echo 'ff8787' ;;
	211) echo 'ff87af' ;;
	212) echo 'ff87d7' ;;
	213) echo 'ff87ff' ;;
	214) echo 'ffaf00' ;;
	215) echo 'ffaf5f' ;;
	216) echo 'ffaf87' ;;
	217) echo 'ffafaf' ;;
	218) echo 'ffafd7' ;;
	219) echo 'ffafff' ;;
	220) echo 'ffd700' ;;
	221) echo 'ffd75f' ;;
	222) echo 'ffd787' ;;
	223) echo 'ffd7af' ;;
	224) echo 'ffd7d7' ;;
	225) echo 'ffd7ff' ;;
	226) echo 'ffff00' ;;
	227) echo 'ffff5f' ;;
	228) echo 'ffff87' ;;
	229) echo 'ffffaf' ;;
	230) echo 'ffffd7' ;;
	231) echo 'ffffff' ;;
	232) echo "080808" ;;
	233) echo "121212" ;;
	234) echo "1c1c1c" ;;
	235) echo "262626" ;;
	236) echo "303030" ;;
	237) echo "3a3a3a" ;;
	238) echo "444444" ;;
	239) echo "4e4e4e" ;;
	240) echo "585858" ;;
	241) echo "626262" ;;
	242) echo "6c6c6c" ;;
	243) echo "767676" ;;
	244) echo "808080" ;;
	245) echo "8a8a8a" ;;
	246) echo "949494" ;;
	247) echo "9e9e9e" ;;
	248) echo "a8a8a8" ;;
	249) echo "b2b2b2" ;;
	250) echo "bcbcbc" ;;
	251) echo "c6c6c6" ;;
	252) echo "d0d0d0" ;;
	253) echo "dadada" ;;
	254) echo "e4e4e4" ;;
	255) echo "eeeeee" ;;
	esac
}

echo "#$(lookup "$eight_bit")"
# vim:ft=sh