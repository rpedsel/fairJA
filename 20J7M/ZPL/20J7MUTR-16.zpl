set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2865, <2> 23.436, <3> 46.8328, <4> 46.3655, <5> 38.0619, <6> 27.3661, <7> 1.345, <8> 0.5635, <9> 17.5316, <10> 13.2636, <11> 13.9709, <12> 36.2108, <13> 28.8967, <14> 42.9196, <15> 0.7741, <16> 26.6158, <17> 5.9054, <18> 48.3184, <19> 47.5707, <20> 6.9792;
param workload[JOB] := <1> 24.8721, <2> 18.3081, <3> 12.7199, <4> 34.8696, <5> 6.4314, <6> 45.2129, <7> 6.3574, <8> 49.1123, <9> 9.3014, <10> 8.7859, <11> 36.1115, <12> 40.164, <13> 43.5015, <14> 25.3974, <15> 23.8359, <16> 26.4823, <17> 3.0904, <18> 9.5693, <19> 25.5458, <20> 3.6979;
param capacity[MACHINE] := <1> 48.575, <2> 48.575, <3> 48.575, <4> 48.575, <5> 48.575, <6> 48.575, <7> 48.575;

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
