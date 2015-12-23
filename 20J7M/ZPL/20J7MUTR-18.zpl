set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8267, <2> 27.4364, <3> 2.7908, <4> 6.039, <5> 40.5142, <6> 39.0576, <7> 31.9564, <8> 11.8384, <9> 38.2873, <10> 18.5964, <11> 43.5174, <12> 31.5587, <13> 12.4989, <14> 20.3624, <15> 37.6903, <16> 34.3689, <17> 31.8076, <18> 21.6893, <19> 20.47, <20> 44.9073;
param workload[JOB] := <1> 13.2143, <2> 49.9599, <3> 32.6839, <4> 23.8943, <5> 45.6036, <6> 16.2061, <7> 49.1268, <8> 45.6631, <9> 19.5733, <10> 39.818, <11> 13.889, <12> 49.3436, <13> 5.1568, <14> 22.3462, <15> 26.3149, <16> 6.3522, <17> 32.3503, <18> 5.4125, <19> 24.9198, <20> 36.755;
param capacity[MACHINE] := <1> 59.8483, <2> 59.8483, <3> 59.8483, <4> 59.8483, <5> 59.8483, <6> 59.8483, <7> 59.8483;

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
