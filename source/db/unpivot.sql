INSERT INTO calls_master(id, ownerID, appID, fnID, trigID)
SELECT ID, ownerID, appID, fnID, trigID FROM staging;

INSERT INTO calls_minute(id, minuteid, reqcount)
SELECT ID, unnest(array[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,994,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440]) as minute, unnest(array[min1,min2,min3,min4,min5,min6,min7,min8,min9,min10,min11,min12,min13,min14,min15,min16,min17,min18,min19,min20,min21,min22,min23,min24,min25,min26,min27,min28,min29,min30,min31,min32,min33,min34,min35,min36,min37,min38,min39,min40,min41,min42,min43,min44,min45,min46,min47,min48,min49,min50,min51,min52,min53,min54,min55,min56,min57,min58,min59,min60,min61,min62,min63,min64,min65,min66,min67,min68,min69,min70,min71,min72,min73,min74,min75,min76,min77,min78,min79,min80,min81,min82,min83,min84,min85,min86,min87,min88,min89,min90,min91,min92,min93,min94,min95,min96,min97,min98,min99,min100,min101,min102,min103,min104,min105,min106,min107,min108,min109,min110,min111,min112,min113,min114,min115,min116,min117,min118,min119,min120,min121,min122,min123,min124,min125,min126,min127,min128,min129,min130,min131,min132,min133,min134,min135,min136,min137,min138,min139,min140,min141,min142,min143,min144,min145,min146,min147,min148,min149,min150,min151,min152,min153,min154,min155,min156,min157,min158,min159,min160,min161,min162,min163,min164,min165,min166,min167,min168,min169,min170,min171,min172,min173,min174,min175,min176,min177,min178,min179,min180,min181,min182,min183,min184,min185,min186,min187,min188,min189,min190,min191,min192,min193,min194,min195,min196,min197,min198,min199,min200,min201,min202,min203,min204,min205,min206,min207,min208,min209,min210,min211,min212,min213,min214,min215,min216,min217,min218,min219,min220,min221,min222,min223,min224,min225,min226,min227,min228,min229,min230,min231,min232,min233,min234,min235,min236,min237,min238,min239,min240,min241,min242,min243,min244,min245,min246,min247,min248,min249,min250,min251,min252,min253,min254,min255,min256,min257,min258,min259,min260,min261,min262,min263,min264,min265,min266,min267,min268,min269,min270,min271,min272,min273,min274,min275,min276,min277,min278,min279,min280,min281,min282,min283,min284,min285,min286,min287,min288,min289,min290,min291,min292,min293,min294,min295,min296,min297,min298,min299,min300,min301,min302,min303,min304,min305,min306,min307,min308,min309,min310,min311,min312,min313,min314,min315,min316,min317,min318,min319,min320,min321,min322,min323,min324,min325,min326,min327,min328,min329,min330,min331,min332,min333,min334,min335,min336,min337,min338,min339,min340,min341,min342,min343,min344,min345,min346,min347,min348,min349,min350,min351,min352,min353,min354,min355,min356,min357,min358,min359,min360,min361,min362,min363,min364,min365,min366,min367,min368,min369,min370,min371,min372,min373,min374,min375,min376,min377,min378,min379,min380,min381,min382,min383,min384,min385,min386,min387,min388,min389,min390,min391,min392,min393,min394,min395,min396,min397,min398,min399,min400,min401,min402,min403,min404,min405,min406,min407,min408,min409,min410,min411,min412,min413,min414,min415,min416,min417,min418,min419,min420,min421,min422,min423,min424,min425,min426,min427,min428,min429,min430,min431,min432,min433,min434,min435,min436,min437,min438,min439,min440,min441,min442,min443,min444,min445,min446,min447,min448,min449,min450,min451,min452,min453,min454,min455,min456,min457,min458,min459,min460,min461,min462,min463,min464,min465,min466,min467,min468,min469,min470,min471,min472,min473,min474,min475,min476,min477,min478,min479,min480,min481,min482,min483,min484,min485,min486,min487,min488,min489,min490,min491,min492,min493,min494,min495,min496,min497,min498,min499,min500,min501,min502,min503,min504,min505,min506,min507,min508,min509,min510,min511,min512,min513,min514,min515,min516,min517,min518,min519,min520,min521,min522,min523,min524,min525,min526,min527,min528,min529,min530,min531,min532,min533,min534,min535,min536,min537,min538,min539,min540,min541,min542,min543,min544,min545,min546,min547,min548,min549,min550,min551,min552,min553,min554,min555,min556,min557,min558,min559,min560,min561,min562,min563,min564,min565,min566,min567,min568,min569,min570,min571,min572,min573,min574,min575,min576,min577,min578,min579,min580,min581,min582,min583,min584,min585,min586,min587,min588,min589,min590,min591,min592,min593,min594,min595,min596,min597,min598,min599,min600,min601,min602,min603,min604,min605,min606,min607,min608,min609,min610,min611,min612,min613,min614,min615,min616,min617,min618,min619,min620,min621,min622,min623,min624,min625,min626,min627,min628,min629,min630,min631,min632,min633,min634,min635,min636,min637,min638,min639,min640,min641,min642,min643,min644,min645,min646,min647,min648,min649,min650,min651,min652,min653,min654,min655,min656,min657,min658,min659,min660,min661,min662,min663,min664,min665,min666,min667,min668,min669,min670,min671,min672,min673,min674,min675,min676,min677,min678,min679,min680,min681,min682,min683,min684,min685,min686,min687,min688,min689,min690,min691,min692,min693,min694,min695,min696,min697,min698,min699,min700,min701,min702,min703,min704,min705,min706,min707,min708,min709,min710,min711,min712,min713,min714,min715,min716,min717,min718,min719,min720,min721,min722,min723,min724,min725,min726,min727,min728,min729,min730,min731,min732,min733,min734,min735,min736,min737,min738,min739,min740,min741,min742,min743,min744,min745,min746,min747,min748,min749,min750,min751,min752,min753,min754,min755,min756,min757,min758,min759,min760,min761,min762,min763,min764,min765,min766,min767,min768,min769,min770,min771,min772,min773,min774,min775,min776,min777,min778,min779,min780,min781,min782,min783,min784,min785,min786,min787,min788,min789,min790,min791,min792,min793,min794,min795,min796,min797,min798,min799,min800,min801,min802,min803,min804,min805,min806,min807,min808,min809,min810,min811,min812,min813,min814,min815,min816,min817,min818,min819,min820,min821,min822,min823,min824,min825,min826,min827,min828,min829,min830,min831,min832,min833,min834,min835,min836,min837,min838,min839,min840,min841,min842,min843,min844,min845,min846,min847,min848,min849,min850,min851,min852,min853,min854,min855,min856,min857,min858,min859,min860,min861,min862,min863,min864,min865,min866,min867,min868,min869,min870,min871,min872,min873,min874,min875,min876,min877,min878,min879,min880,min881,min882,min883,min884,min885,min886,min887,min888,min889,min890,min891,min892,min893,min894,min895,min896,min897,min898,min899,min900,min901,min902,min903,min904,min905,min906,min907,min908,min909,min910,min911,min912,min913,min914,min915,min916,min917,min918,min919,min920,min921,min922,min923,min924,min925,min926,min927,min928,min929,min930,min931,min932,min933,min934,min935,min936,min937,min938,min939,min940,min941,min942,min943,min944,min945,min946,min947,min948,min949,min950,min951,min952,min953,min954,min955,min956,min957,min958,min959,min960,min961,min962,min963,min964,min965,min966,min967,min968,min969,min970,min971,min972,min973,min974,min975,min976,min977,min978,min979,min980,min981,min982,min983,min984,min985,min986,min987,min988,min989,min990,min991,min992,min993,min994,min995,min996,min997,min998,min999,min1000,min1001,min1002,min1003,min1004,min1005,min1006,min1007,min1008,min1009,min1010,min1011,min1012,min1013,min1014,min1015,min1016,min1017,min1018,min1019,min1020,min1021,min1022,min1023,min1024,min1025,min1026,min1027,min1028,min1029,min1030,min1031,min1032,min1033,min1034,min1035,min1036,min1037,min1038,min1039,min1040,min1041,min1042,min1043,min1044,min1045,min1046,min1047,min1048,min1049,min1050,min1051,min1052,min1053,min1054,min1055,min1056,min1057,min1058,min1059,min1060,min1061,min1062,min1063,min1064,min1065,min1066,min1067,min1068,min1069,min1070,min1071,min1072,min1073,min1074,min1075,min1076,min1077,min1078,min1079,min1080,min1081,min1082,min1083,min1084,min1085,min1086,min1087,min1088,min1089,min1090,min1091,min1092,min1093,min1094,min1095,min1096,min1097,min1098,min1099,min1100,min1101,min1102,min1103,min1104,min1105,min1106,min1107,min1108,min1109,min1110,min1111,min1112,min1113,min1114,min1115,min1116,min1117,min1118,min1119,min1120,min1121,min1122,min1123,min1124,min1125,min1126,min1127,min1128,min1129,min1130,min1131,min1132,min1133,min1134,min1135,min1136,min1137,min1138,min1139,min1140,min1141,min1142,min1143,min1144,min1145,min1146,min1147,min1148,min1149,min1150,min1151,min1152,min1153,min1154,min1155,min1156,min1157,min1158,min1159,min1160,min1161,min1162,min1163,min1164,min1165,min1166,min1167,min1168,min1169,min1170,min1171,min1172,min1173,min1174,min1175,min1176,min1177,min1178,min1179,min1180,min1181,min1182,min1183,min1184,min1185,min1186,min1187,min1188,min1189,min1190,min1191,min1192,min1193,min1194,min1195,min1196,min1197,min1198,min1199,min1200,min1201,min1202,min1203,min1204,min1205,min1206,min1207,min1208,min1209,min1210,min1211,min1212,min1213,min1214,min1215,min1216,min1217,min1218,min1219,min1220,min1221,min1222,min1223,min1224,min1225,min1226,min1227,min1228,min1229,min1230,min1231,min1232,min1233,min1234,min1235,min1236,min1237,min1238,min1239,min1240,min1241,min1242,min1243,min1244,min1245,min1246,min1247,min1248,min1249,min1250,min1251,min1252,min1253,min1254,min1255,min1256,min1257,min1258,min1259,min1260,min1261,min1262,min1263,min1264,min1265,min1266,min1267,min1268,min1269,min1270,min1271,min1272,min1273,min1274,min1275,min1276,min1277,min1278,min1279,min1280,min1281,min1282,min1283,min1284,min1285,min1286,min1287,min1288,min1289,min1290,min1291,min1292,min1293,min1294,min1295,min1296,min1297,min1298,min1299,min1300,min1301,min1302,min1303,min1304,min1305,min1306,min1307,min1308,min1309,min1310,min1311,min1312,min1313,min1314,min1315,min1316,min1317,min1318,min1319,min1320,min1321,min1322,min1323,min1324,min1325,min1326,min1327,min1328,min1329,min1330,min1331,min1332,min1333,min1334,min1335,min1336,min1337,min1338,min1339,min1340,min1341,min1342,min1343,min1344,min1345,min1346,min1347,min1348,min1349,min1350,min1351,min1352,min1353,min1354,min1355,min1356,min1357,min1358,min1359,min1360,min1361,min1362,min1363,min1364,min1365,min1366,min1367,min1368,min1369,min1370,min1371,min1372,min1373,min1374,min1375,min1376,min1377,min1378,min1379,min1380,min1381,min1382,min1383,min1384,min1385,min1386,min1387,min1388,min1389,min1390,min1391,min1392,min1393,min1394,min1395,min1396,min1397,min1398,min1399,min1400,min1401,min1402,min1403,min1404,min1405,min1406,min1407,min1408,min1409,min1410,min1411,min1412,min1413,min1414,min1415,min1416,min1417,min1418,min1419,min1420,min1421,min1422,min1423,min1424,min1425,min1426,min1427,min1428,min1429,min1430,min1431,min1432,min1433,min1434,min1435,min1436,min1437,min1438,min1439,min1440]) as calls FROM staging;
