set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.7601, <2> 40.9983, <3> 46.961, <4> 10.2713, <5> 44.7442, <6> 45.9828, <7> 4.9036, <8> 45.9424, <9> 1.611, <10> 33.5966, <11> 8.5376, <12> 19.7172, <13> 10.7705, <14> 14.0135, <15> 0.7086, <16> 29.8897, <17> 37.3557, <18> 30.909, <19> 40.5328, <20> 5.5807;
param workload[JOB] := <1> 6.3844, <2> 6.403, <3> 6.8528, <4> 3.2049, <5> 6.6891, <6> 6.7811, <7> 2.2144, <8> 6.7781, <9> 1.2693, <10> 5.7963, <11> 2.9219, <12> 4.4404, <13> 3.2818, <14> 3.7435, <15> 0.8418, <16> 5.4671, <17> 6.1119, <18> 5.5596, <19> 6.3665, <20> 2.3624;
param capacity[MACHINE] := <1> 93.4703, <2> 93.4703, <3> 93.4703, <4> 93.4703, <5> 93.4703, <6> 93.4703, <7> 93.4703;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
