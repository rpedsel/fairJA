set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5233, <2> 28.15, <3> 25.3632, <4> 25.5113, <5> 21.137, <6> 36.3264, <7> 33.6083, <8> 36.3898, <9> 22.7098, <10> 27.0873, <11> 31.7111, <12> 29.6346, <13> 23.0811, <14> 25.053, <15> 19.1089, <16> 18.356, <17> 27.957, <18> 24.8793, <19> 22.739, <20> 27.0141;
param workload[JOB] := <1> 3.94, <2> 5.3057, <3> 5.0362, <4> 5.0509, <5> 4.5975, <6> 6.0271, <7> 5.7973, <8> 6.0324, <9> 4.7655, <10> 5.2045, <11> 5.6313, <12> 5.4438, <13> 4.8043, <14> 5.0053, <15> 4.3714, <16> 4.2844, <17> 5.2874, <18> 4.9879, <19> 4.7685, <20> 5.1975;
param capacity[MACHINE] := <1> 10.8792, <2> 10.8792, <3> 10.8792, <4> 10.8792, <5> 10.8792, <6> 10.8792, <7> 10.8792;

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
