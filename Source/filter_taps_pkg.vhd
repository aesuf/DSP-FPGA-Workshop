----------------------------------------------------------------------------------
-- FILENAME: filter_taps_pkg.vhd
--
-- DESCRIPTION: Autogenerated filter taps
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.user_pkg.all;

package filter_taps_pkg is

	-- Types
	type TAPS_ARR is array (0 to FILTER_COUNT-1, 0 to FIFO_OUT_DEPTH-1) of integer;

	-- Define
	constant FILTER_TAPS : TAPS_ARR := (
		(-333, -17, -17, -18, -18, -18, -19, -19, -20, -20, 
		-21, -21, -22, -22, -22, -23, -23, -24, -24, -25, 
		-25, -26, -26, -26, -27, -27, -28, -28, -29, -29, 
		-29, -30, -30, -31, -31, -31, -32, -32, -33, -33, 
		-33, -34, -34, -34, -35, -35, -35, -36, -36, -36, 
		-37, -37, -37, -37, -38, -38, -38, -38, -39, -39, 
		-39, -39, -39, -39, -39, -39, -39, -40, -40, -40, 
		-40, -40, -40, -40, -40, -40, -39, -40, -39, -39, 
		-39, -39, -39, -39, -38, -38, -38, -38, -37, -37, 
		-37, -36, -36, -35, -35, -35, -34, -34, -33, -32, 
		-32, -31, -31, -30, -29, -29, -28, -27, -26, -26, 
		-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, 
		-15, -14, -13, -12, -11, -9, -8, -7, -5, -4, 
		-3, -1, 0, 0, 2, 3, 5, 7, 8, 10, 
		11, 13, 15, 16, 18, 20, 22, 24, 25, 27, 
		29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 
		50, 52, 54, 56, 58, 61, 63, 65, 68, 70, 
		72, 75, 77, 80, 82, 85, 87, 90, 92, 95, 
		97, 100, 103, 105, 108, 111, 113, 116, 119, 122, 
		124, 127, 130, 133, 135, 138, 141, 144, 147, 150, 
		152, 155, 158, 161, 164, 167, 170, 173, 176, 178, 
		181, 184, 187, 190, 193, 196, 199, 202, 205, 208, 
		211, 214, 216, 219, 222, 225, 228, 231, 234, 237, 
		240, 242, 245, 248, 251, 254, 257, 259, 262, 265, 
		268, 270, 273, 276, 278, 281, 284, 286, 289, 292, 
		294, 297, 299, 302, 304, 307, 309, 311, 314, 316, 
		319, 321, 323, 325, 328, 330, 332, 334, 336, 338, 
		340, 342, 344, 346, 348, 350, 352, 354, 355, 357, 
		359, 361, 362, 364, 365, 367, 368, 370, 371, 372, 
		374, 375, 376, 377, 379, 380, 381, 382, 383, 384, 
		385, 386, 386, 387, 388, 389, 389, 390, 390, 391, 
		391, 392, 392, 393, 393, 393, 393, 393, 394, 394, 
		394), -- end of filter 1
		(-295, 88, 77, 69, 62, 57, 53, 50, 48, 46, 
		45, 45, 45, 45, 46, 47, 48, 49, 50, 51, 
		52, 54, 55, 56, 58, 59, 60, 62, 63, 64, 
		65, 66, 67, 68, 69, 70, 70, 71, 72, 72, 
		72, 73, 73, 73, 73, 73, 72, 72, 72, 71, 
		70, 70, 69, 68, 67, 65, 64, 63, 61, 60, 
		58, 56, 54, 53, 51, 48, 46, 44, 42, 39, 
		37, 35, 32, 30, 27, 25, 22, 19, 17, 14, 
		12, 9, 6, 4, 1, 0, -3, -5, -7, -10, 
		-12, -14, -16, -18, -20, -21, -23, -25, -26, -27, 
		-28, -30, -30, -31, -32, -32, -33, -33, -33, -33, 
		-33, -33, -32, -32, -31, -30, -29, -28, -26, -25, 
		-23, -22, -20, -18, -16, -14, -12, -9, -7, -5, 
		-2, 0, 2, 5, 7, 10, 12, 15, 18, 20, 
		23, 25, 28, 30, 32, 35, 37, 39, 40, 42, 
		44, 45, 46, 47, 48, 49, 49, 49, 49, 48, 
		48, 47, 46, 44, 43, 40, 38, 35, 33, 29, 
		26, 22, 17, 13, 8, 3, -2, -8, -14, -21, 
		-28, -35, -42, -50, -58, -66, -75, -84, -93, -102, 
		-112, -122, -132, -142, -152, -163, -173, -184, -195, -206, 
		-217, -228, -239, -250, -261, -272, -283, -294, -305, -316, 
		-326, -336, -347, -356, -366, -376, -385, -394, -402, -410, 
		-418, -425, -432, -439, -445, -450, -455, -460, -464, -467, 
		-470, -473, -474, -475, -476, -475, -475, -473, -471, -468, 
		-464, -460, -455, -449, -443, -436, -428, -420, -410, -400, 
		-390, -378, -366, -354, -340, -326, -312, -297, -281, -264, 
		-247, -230, -211, -193, -174, -154, -134, -114, -93, -71, 
		-50, -28, -6, 16, 38, 61, 84, 108, 131, 154, 
		177, 201, 224, 247, 271, 293, 316, 339, 361, 383, 
		405, 427, 448, 468, 488, 508, 527, 546, 564, 582, 
		599, 615, 631, 645, 660, 673, 686, 698, 709, 719, 
		728, 737, 745, 752, 758, 763, 767, 770, 772, 774, 
		774), -- end of filter 2
		(295, 52, 55, 58, 61, 62, 63, 63, 62, 59, 
		56, 52, 47, 40, 33, 25, 16, 6, -4, -14, 
		-26, -37, -49, -61, -72, -83, -93, -103, -111, -119, 
		-126, -131, -135, -138, -139, -139, -137, -135, -130, -125, 
		-118, -110, -102, -92, -82, -72, -61, -50, -39, -29, 
		-18, -9, 0, 8, 15, 22, 27, 32, 36, 38, 
		40, 40, 40, 39, 38, 36, 34, 31, 29, 27, 
		25, 23, 22, 22, 23, 24, 26, 29, 34, 39, 
		44, 51, 58, 66, 75, 83, 92, 100, 108, 116, 
		123, 129, 134, 137, 140, 141, 140, 137, 133, 128, 
		120, 111, 101, 89, 76, 63, 48, 33, 18, 3, 
		-11, -25, -39, -52, -63, -72, -80, -86, -91, -93, 
		-93, -91, -88, -82, -75, -66, -56, -45, -34, -21, 
		-9, 2, 14, 24, 34, 42, 49, 53, 55, 55, 
		53, 48, 41, 31, 19, 5, -11, -28, -48, -68, 
		-90, -111, -133, -154, -174, -192, -210, -225, -237, -247, 
		-254, -258, -259, -256, -250, -241, -229, -213, -195, -175, 
		-152, -128, -102, -75, -48, -22, 3, 29, 52, 74, 
		93, 110, 124, 134, 142, 146, 146, 144, 138, 130, 
		118, 105, 90, 73, 55, 37, 19, 2, -13, -28, 
		-40, -50, -57, -60, -60, -56, -49, -38, -22, -4, 
		17, 42, 70, 100, 131, 164, 196, 229, 261, 291, 
		318, 343, 365, 383, 397, 405, 409, 408, 402, 390, 
		374, 352, 326, 297, 263, 227, 189, 149, 108, 67, 
		28, -10, -45, -78, -107, -132, -152, -167, -177, -181, 
		-180, -173, -162, -145, -125, -100, -74, -45, -15, 14, 
		43, 70, 94, 114, 129, 137, 140, 134, 120, 98, 
		68, 28, -20, -77, -142, -215, -294, -379, -468, -561, 
		-655, -749, -842, -932, -1017, -1095, -1165, -1225, -1274, -1310, 
		-1332, -1340, -1331, -1305, -1263, -1203, -1126, -1033, -923, -798, 
		-659, -508, -345, -172, 6, 191, 380, 568, 755, 939, 
		1115, 1283, 1440, 1584, 1713, 1825, 1920, 1994, 2048, 2081, 
		2092), -- end of filter 3
		(157, -168, -111, -78, -57, -40, -26, -14, -5, -2, 
		-6, -18, -37, -61, -86, -107, -118, -115, -94, -55, 
		2, 72, 148, 222, 284, 324, 337, 319, 269, 191, 
		94, -12, -117, -209, -278, -317, -325, -301, -252, -187, 
		-114, -45, 11, 50, 68, 66, 48, 21, -6, -30, 
		-42, -39, -21, 7, 44, 82, 114, 135, 142, 134, 
		113, 82, 48, 16, -6, -18, -18, -6, 12, 34, 
		53, 63, 61, 46, 18, -17, -57, -93, -122, -137, 
		-138, -124, -99, -67, -35, -9, 7, 12, 4, -13, 
		-36, -58, -75, -80, -71, -48, -14, 26, 69, 105, 
		131, 142, 137, 118, 89, 56, 26, 3, -6, -2, 
		13, 38, 65, 88, 102, 101, 84, 51, 8, -39, 
		-85, -123, -146, -151, -140, -115, -81, -46, -18, 0, 
		1, -11, -36, -68, -100, -123, -132, -124, -96, -53, 
		0, 56, 106, 143, 163, 162, 142, 110, 71, 35, 
		9, 0, 7, 31, 67, 107, 142, 165, 168, 150, 
		109, 53, -11, -76, -130, -166, -180, -171, -142, -102, 
		-59, -23, -2, -1, -22, -60, -109, -158, -196, -216, 
		-211, -179, -122, -50, 28, 101, 158, 191, 197, 177, 
		137, 88, 41, 8, -4, 9, 47, 103, 166, 225, 
		267, 281, 263, 212, 135, 43, -51, -133, -192, -219, 
		-213, -179, -125, -67, -17, 10, 8, -24, -86, -166, 
		-249, -319, -362, -367, -330, -254, -150, -32, 81, 173, 
		232, 249, 227, 173, 103, 33, -16, -33, -9, 55, 
		152, 266, 375, 459, 501, 490, 425, 312, 167, 13, 
		-125, -230, -286, -287, -239, -156, -61, 21, 68, 63, 
		0, -117, -272, -440, -591, -698, -737, -699, -583, -407, 
		-195, 18, 201, 325, 373, 343, 247, 113, -25, -129, 
		-165, -113, 33, 261, 539, 824, 1069, 1227, 1266, 1170, 
		949, 630, 264, -93, -382, -555, -587, -476, -253, 27, 
		293, 463, 467, 255, -187, -838, -1631, -2468, -3227, -3780, 
		-4014, -3846, -3239, -2215, -847, 738, 2380, 3901, 5133, 5934, 
		6212), -- end of filter 4
		(351, 39, -8, 51, 155, 68, -288, -617, -501, 87, 
		662, 705, 225, -276, -378, -160, 4, -56, -161, -105, 
		55, 119, 45, -6, 62, 144, 91, -58, -133, -74, 
		-7, -43, -119, -96, 21, 95, 56, -3, 23, 94, 
		85, -18, -95, -67, -8, -27, -96, -98, -4, 75, 
		57, 0, 12, 81, 93, 8, -77, -67, -10, -16, 
		-85, -107, -27, 63, 62, 5, 4, 74, 105, 33, 
		-63, -72, -14, -6, -75, -117, -51, 50, 69, 13, 
		-2, 65, 117, 60, -47, -77, -22, 1, -64, -127, 
		-78, 34, 76, 24, -8, 54, 127, 89, -27, -82, 
		-33, 7, -51, -133, -107, 12, 81, 37, -11, 41, 
		132, 119, -1, -85, -48, 9, -35, -135, -137, -16, 
		82, 54, -11, 25, 132, 150, 31, -81, -64, 7, 
		-18, -131, -166, -51, 76, 72, -5, 7, 125, 178, 
		70, -71, -82, 0, 0, -121, -193, -94, 61, 89, 
		4, -8, 112, 203, 116, -51, -98, -12, 15, -104, 
		-215, -143, 37, 105, 21, -23, 92, 223, 168, -20, 
		-111, -32, 28, -80, -231, -197, 0, 115, 44, -33, 
		66, 234, 224, 23, -118, -57, 36, -52, -238, -254, 
		-51, 118, 71, -37, 35, 237, 284, 82, -115, -87, 
		36, -18, -235, -314, -119, 108, 102, -33, 0, 230, 
		344, 158, -99, -120, 28, 18, -221, -374, -204, 83, 
		137, -19, -37, 209, 404, 255, -62, -154, 8, 56, 
		-194, -435, -312, 35, 171, 6, -76, 173, 464, 376, 
		0, -187, -25, 94, -150, -493, -449, -45, 200, 48, 
		-112, 122, 522, 531, 101, -212, -77, 129, -89, -552, 
		-627, -173, 221, 112, -145, 48, 582, 740, 266, -226, 
		-155, 160, 0, -614, -878, -388, 223, 208, -173, -60, 
		651, 1054, 552, -211, -278, 185, 138, -697, -1293, -787, 
		182, 374, -195, -247, 761, 1647, 1152, -124, -519, 202, 
		416, -866, -2249, -1803, 0, 781, -208, -744, 1087, 3575, 
		3336, 341, -1462, 211, 1781, -1931, -9435, -11913, -3155, 11362, 
		18511), -- end of filter 5
		(133, -393, 148, 62, -75, -61, 26, 51, 0, -41, 
		-19, 25, 29, -8, -31, -7, 25, 20, -13, -26, 
		0, 26, 13, -18, -23, 6, 26, 7, -23, -19, 
		13, 26, 0, -26, -13, 20, 23, -8, -28, -5, 
		26, 18, -17, -27, 3, 30, 11, -24, -24, 12, 
		31, 2, -30, -18, 22, 29, -7, -34, -9, 30, 
		24, -18, -34, 1, 36, 16, -28, -31, 13, 38, 
		5, -36, -24, 25, 37, -7, -41, -13, 35, 31, 
		-20, -42, 0, 43, 22, -33, -39, 14, 47, 9, 
		-43, -31, 28, 46, -6, -50, -19, 42, 40, -22, 
		-52, -3, 52, 29, -38, -49, 14, 57, 13, -51, 
		-40, 32, 57, -4, -60, -25, 49, 50, -24, -64, 
		-7, 61, 38, -43, -61, 14, 69, 20, -60, -51, 
		36, 70, -1, -72, -34, 56, 63, -26, -77, -12, 
		73, 49, -49, -75, 13, 83, 28, -71, -64, 40, 
		85, 2, -86, -45, 65, 79, -27, -94, -19, 86, 
		63, -56, -93, 11, 100, 39, -82, -81, 43, 105, 
		7, -103, -59, 75, 98, -27, -114, -29, 102, 81, 
		-63, -114, 7, 120, 53, -96, -102, 47, 128, 16, 
		-123, -78, 86, 123, -26, -139, -43, 121, 104, -71, 
		-143, 1, 146, 72, -113, -131, 50, 159, 28, -148, 
		-104, 100, 156, -23, -172, -62, 145, 136, -80, -180, 
		-8, 180, 99, -135, -170, 53, 201, 46, -182, -139, 
		117, 202, -18, -217, -90, 178, 182, -91, -233, -23, 
		228, 139, -164, -226, 55, 261, 74, -231, -193, 141, 
		271, -9, -284, -134, 226, 252, -106, -315, -49, 301, 
		203, -210, -317, 57, 358, 121, -311, -284, 179, 387, 
		8, -399, -211, 309, 378, -131, -463, -97, 436, 325, 
		-293, -492, 58, 549, 218, -470, -472, 257, 634, 50, 
		-651, -389, 499, 675, -189, -828, -223, 785, 652, -522, 
		-990, 59, 1132, 528, -996, -1127, 539, 1590, 226, -1757, 
		-1232, 1469, 2361, -549, -3467, -1297, 4397, 5074, -5016, -20207, 
		38001) -- end of filter 6
	);

end filter_taps_pkg;
