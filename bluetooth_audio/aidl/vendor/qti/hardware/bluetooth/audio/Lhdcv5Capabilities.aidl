/*
Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted (subject to the limitations in the
disclaimer below) provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.

    * Neither the name of Qualcomm Innovation Center, Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE
GRANTED BY THIS LICENSE. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT
HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package vendor.qti.hardware.bluetooth.audio;

/**
 * LHDC v5 codec capabilities.
 *
 * RECONSTRUCTED, NOT FROM QUALCOMM. Motorola's arcfox blob
 * btaudio_offload_if.so links vendor.qti.hardware.bluetooth.audio-V2-ndk.so.
 * V2 in this repo is the UNFROZEN 'current', and Qualcomm's V2 for that blob
 * defines two types this repo lacks -- Lhdcv5Capabilities and
 * Lhdcv5Configuration -- so a source build produces the same soname with a
 * DIFFERENT ABI. PAL's init_a2dp_source() dlopens it, the layout does not
 * match, and NOTHING IS LOGGED: the symptoms are silent A2DP plus an audio
 * clock at ~0.48x that also halves video framerate, with only
 * "a2dp handle is not identified" from an unrelated code path to go on.
 *
 * FIELD TYPES AND ORDER ARE MEASURED and are what the ABI depends on. Recovered
 * independently twice from the AParcel_* sequences in writeToParcel and
 * readFromParcel of the stock library; both recoveries agreed slot for slot.
 * The struct offsets also form a natural declaration-order layout with no gaps.
 *
 * FIELD NAMES ARE OURS. Verified irrelevant to the ABI: AIDL parcels are
 * positional, toString() is never instantiated, and no field name string
 * appears in either binary. Rename freely; do NOT reorder or retype.
 */
@VintfStability
parcelable Lhdcv5Capabilities {
  int[]  sampleRate;
  byte[] bitsPerSample;
  byte[] channelMode;
  byte[] frameDuration;
  int[]  bitrate;
  int[]  maxBitrate;
  int[]  minBitrate;
  byte[] version;
  byte[] qualityMode;
  byte[] lowLatencyMode;
  byte[] maxTargetBitrate;
  byte[] codecSpecific;
}
