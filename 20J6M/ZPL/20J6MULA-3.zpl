set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9113, <2> 32.9358, <3> 41.4069, <4> 20.4936, <5> 14.6477, <6> 11.7738, <7> 14.9255, <8> 18.105, <9> 9.6529, <10> 30.7965, <11> 20.491, <12> 7.4322, <13> 13.7136, <14> 31.4163, <15> 10.9711, <16> 5.1876, <17> 26.9327, <18> 29.8216, <19> 8.4066, <20> 19.1412;
param workload[JOB] := <1> 620.5729, <2> 1084.7669, <3> 1714.5314, <4> 419.9876, <5> 214.5551, <6> 138.6224, <7> 222.7706, <8> 327.791, <9> 93.1785, <10> 948.4244, <11> 419.8811, <12> 55.2376, <13> 188.0628, <14> 986.9839, <15> 120.365, <16> 26.9112, <17> 725.3703, <18> 889.3278, <19> 70.6709, <20> 366.3855;
param capacity[MACHINE] := <1> 1605.7328, <2> 1605.7328, <3> 1605.7328, <4> 1605.7328, <5> 1605.7328, <6> 1605.7328;

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
