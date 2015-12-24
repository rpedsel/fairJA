set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.8819, <2> 44.0111, <3> 48.3507, <4> 44.8633, <5> 10.1963, <6> 31.7704, <7> 28.6377, <8> 6.4101, <9> 14.2614, <10> 38.2885, <11> 35.6503, <12> 12.4114, <13> 23.5011, <14> 26.5482, <15> 16.0569, <16> 30.241, <17> 24.1836, <18> 1.8169, <19> 1.8449, <20> 40.8121;
param workload[JOB] := <1> 10.925, <2> 48.7224, <3> 4.6097, <4> 0.2593, <5> 19.0067, <6> 36.1164, <7> 32.1056, <8> 23.3513, <9> 25.0828, <10> 30.1312, <11> 15.9962, <12> 35.8954, <13> 25.6212, <14> 30.394, <15> 14.2609, <16> 29.7469, <17> 17.223, <18> 34.6511, <19> 14.9234, <20> 23.1418;
param capacity[MACHINE] := <1> 50.589, <2> 50.589, <3> 50.589, <4> 50.589, <5> 50.589, <6> 50.589, <7> 50.589;

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
