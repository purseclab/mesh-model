#!/bin/bash

# Tested with ProVerif version 2.04
pv=proverif
title="mesh"
prov_f="./mesh.pv"

prepare () {
	curr_num="$1"
	curr_name="$2"
	outdir="results-$title-$1-$2"
	mkdir -p $outdir
	tmp_f="$outdir/model.pv"
	out_f="$outdir/output.txt"
	options="-html $outdir"
	echo "$1" "$2"
}

analyze () {
	(time $pv $options $tmp_f) 2>&1 | tee $out_f | grep "^Query"
}

# Basic modules are implemented in "./mesh.pv".
# This script reproduces the results in Table 6 in the paper.

echo "Verifying Mesh security properties (P1 to P11)."

prepare "01" "M1P1"
m4 -DP1 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "02" "M1P2"
m4 -DP2 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "03" "M1P3"
m4 -DP3 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "04" "M1P4"
m4 -DP4 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "05" "M1P5"
m4 -DP5 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "06" "M1P6"
m4 -DP6 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "07" "M1P7"
m4 -DP7 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "08" "M1P8"
m4 -DP8 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "09" "M1P9"
m4 -DP9 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, keys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, keys)) | (OOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "10" "M1P10"
m4 -DP10 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, newkeys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, newkeys)) | (OOBPKoutOOBDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1)" >> $tmp_f
analyze
echo ""

prepare "11" "M1P11"
m4 -DP11 $prov_f > $tmp_f
echo "(OOBPKoutOOBProv(pri_P, newkeys)) | (OOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (OOBPKoutOOBProv(pri_P1, newkeys)) | (OOBPKoutOOBDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1)" >> $tmp_f
analyze
echo ""

prepare "12" "M2P1"
m4 -DP1 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "13" "M2P2"
m4 -DP2 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "14" "M2P3"
m4 -DP3 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "15" "M2P4"
m4 -DP4 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "16" "M2P5"
m4 -DP5 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "17" "M2P6"
m4 -DP6 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "18" "M2P7"
m4 -DP7 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "19" "M2P8"
m4 -DP8 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "20" "M2P9"
m4 -DP9 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, keys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, keys)) | (OOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "21" "M2P10"
m4 -DP10 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, newkeys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, newkeys)) | (OOBPKinOOBDev3(pri_D3)) | (inputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "22" "M2P11"
m4 -DP11 $prov_f > $tmp_f
echo "(OOBPKinOOBProv(pri_P, newkeys)) | (OOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (OOBPKinOOBProv(pri_P1, newkeys)) | (OOBPKinOOBDev3(pri_D3)) | (inputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "23" "M3P1"
m4 -DP1 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "24" "M3P2"
m4 -DP2 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "25" "M3P3"
m4 -DP3 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "26" "M3P4"
m4 -DP4 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "27" "M3P5"
m4 -DP5 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "28" "M3P6"
m4 -DP6 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "29" "M3P7"
m4 -DP7 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "30" "M3P8"
m4 -DP8 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "31" "M3P9"
m4 -DP9 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (OOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "32" "M3P10"
m4 -DP10 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, newkeys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, newkeys, static_oobdata)) | (OOBPKStaticOOBDev3(pri_D3, static_oobdata)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "33" "M3P11"
m4 -DP11 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, newkeys, static_oobdata)) | (OOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (OOBPKStaticOOBProv(pri_P1, newkeys, static_oobdata)) | (OOBPKStaticOOBDev3(pri_D3, static_oobdata)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "34" "M4P1"
m4 -DP1 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

# sleep 600

prepare "35" "M4P2"
m4 -DP2 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "36" "M4P3"
m4 -DP3 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "37" "M4P4"
m4 -DP4 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "38" "M4P5"
m4 -DP5 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "39" "M4P6"
m4 -DP6 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "40" "M4P7"
m4 -DP7 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "41" "M4P8"
m4 -DP8 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "42" "M4P9"
m4 -DP9 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, keys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, keys, zero)) | (OOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "43" "M4P10"
m4 -DP10 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, newkeys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, newkeys, zero)) | (OOBPKStaticOOBDev3(pri_D3, zero)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "44" "M4P11"
m4 -DP11 $prov_f > $tmp_f
echo "(OOBPKStaticOOBProv(pri_P, newkeys, zero)) | (OOBPKStaticOOBDev1(pri_D1, zero)) | (OOBPKStaticOOBProv(pri_P1, newkeys, zero)) | (OOBPKStaticOOBDev3(pri_D3, zero)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "45" "M5P1"
m4 -DP1 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "46" "M5P2"
m4 -DP2 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "47" "M5P3"
m4 -DP3 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "48" "M5P4"
m4 -DP4 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "49" "M5P5"
m4 -DP5 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "50" "M5P6"
m4 -DP6 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "51" "M5P7"
m4 -DP7 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "52" "M5P8"
m4 -DP8 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "53" "M5P9"
m4 -DP9 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, keys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, keys)) | (NoOOBPKoutOOBDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "54" "M5P10"
m4 -DP10 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, newkeys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, newkeys)) | (NoOOBPKoutOOBDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "55" "M5P11"
m4 -DP11 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKoutOOBProv(pri_P, newkeys)) | (NoOOBPKoutOOBDev1(pri_D1)) | (outputoob_user) | (NoOOBPKoutOOBProv(pri_P1, newkeys)) | (NoOOBPKoutOOBDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "56" "M6P1"
m4 -DP1 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "57" "M6P2"
m4 -DP2 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "58" "M6P3"
m4 -DP3 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "59" "M6P4"
m4 -DP4 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user)" >> $tmp_f
analyze
echo ""

prepare "60" "M6P5"
m4 -DP5 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "61" "M6P6"
m4 -DP6 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "62" "M6P7"
m4 -DP7 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "63" "M6P8"
m4 -DP8 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "64" "M6P9"
m4 -DP9 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, keys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, keys)) | (NoOOBPKinOOBDev2(pri_D2)) | (inputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "65" "M6P10"
m4 -DP10 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, newkeys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, newkeys)) | (NoOOBPKinOOBDev3(pri_D3)) | (inputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "66" "M6P11"
m4 -DP11 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKinOOBProv(pri_P, newkeys)) | (NoOOBPKinOOBDev1(pri_D1)) | (inputoob_user) | (NoOOBPKinOOBProv(pri_P1, newkeys)) | (NoOOBPKinOOBDev3(pri_D3)) | (inputoob_user) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "67" "M7P1"
m4 -DP1 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "68" "M7P2"
m4 -DP2 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

# sleep 600

prepare "69" "M7P3"
m4 -DP3 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "70" "M7P4"
m4 -DP4 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata))" >> $tmp_f
analyze
echo ""

prepare "71" "M7P5"
m4 -DP5 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "72" "M7P6"
m4 -DP6 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "73" "M7P7"
m4 -DP7 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "74" "M7P8"
m4 -DP8 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "75" "M7P9"
m4 -DP9 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, keys, static_oobdata)) | (NoOOBPKStaticOOBDev2(pri_D2, static_oobdata)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "76" "M7P10"
m4 -DP10 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, newkeys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, newkeys, static_oobdata)) | (NoOOBPKStaticOOBDev3(pri_D3, static_oobdata)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "77" "M7P11"
m4 -DP11 -DM5678 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, newkeys, static_oobdata)) | (NoOOBPKStaticOOBDev1(pri_D1, static_oobdata)) | (NoOOBPKStaticOOBProv(pri_P1, newkeys, static_oobdata)) | (NoOOBPKStaticOOBDev3(pri_D3, static_oobdata)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "78" "M8P1"
m4 -DP1 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "79" "M8P2"
m4 -DP2 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "80" "M8P3"
m4 -DP3 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "81" "M8P4"
m4 -DP4 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero))" >> $tmp_f
analyze
echo ""

prepare "82" "M8P5"
m4 -DP5 $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "83" "M8P6"
m4 -DP6 -DKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "84" "M8P7"
m4 -DP7 -DKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero)) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "85" "M8P8"
m4 -DP8 -DKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "86" "M8P9"
m4 -DP9 -DKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, keys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, keys, zero)) | (NoOOBPKStaticOOBDev2(pri_D2, zero)) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) | (key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "87" "M8P10"
m4 -DP10 -DNEWKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, newkeys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, newkeys, zero)) | (NoOOBPKStaticOOBDev3(pri_D3, zero)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "88" "M8P11"
m4 -DP11 -DNEWKEY $prov_f > $tmp_f
echo "(NoOOBPKStaticOOBProv(pri_P, newkeys, zero)) | (NoOOBPKStaticOOBDev1(pri_D1, zero)) | (NoOOBPKStaticOOBProv(pri_P1, newkeys, zero)) | (NoOOBPKStaticOOBDev3(pri_D3, zero)) | (friend_request_dev3) | (friend_offer_dev1) " >> $tmp_f
analyze
echo ""

prepare "89" "FixP1"
m4 -DP1 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "90" "FixP2"
m4 -DP2 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "91" "FixP3"
m4 -DP3 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "92" "FixP4"
m4 -DP4 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user)" >> $tmp_f
analyze
echo ""

prepare "93" "FixP5"
m4 -DP5 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "94" "FixP6"
m4 -DP6 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "95" "FixP7"
m4 -DP7 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user) | (dev1_send(msg1)) | (dev2_recv(msg2))" >> $tmp_f
analyze
echo ""

prepare "96" "FixP8"
m4 -DP8 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "97" "FixP9"
m4 -DP9 $prov_f > $tmp_f
echo "(FixProv(pri_P, keys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, keys)) | (FixDev2(pri_D2)) | (outputoob_user) | (key_update_send_prov_dev1) | (key_update_recv_dev1) | (key_update_send_prov_dev2) |(key_update_recv_dev2)" >> $tmp_f
analyze
echo ""

prepare "98" "FixP10"
m4 -DP10 $prov_f > $tmp_f
echo "(FixProv(pri_P, newkeys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, newkeys)) | (FixDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1)" >> $tmp_f
analyze
echo ""

prepare "99" "FixP11"
m4 -DP11 $prov_f > $tmp_f
echo "(FixProv(pri_P, newkeys)) | (FixDev1(pri_D1)) | (outputoob_user) | (FixProv(pri_P1, newkeys)) | (FixDev3(pri_D3)) | (outputoob_user) | (friend_request_dev3) | (friend_offer_dev1)" >> $tmp_f
analyze
echo ""

echo "Verifying Mesh finished."
