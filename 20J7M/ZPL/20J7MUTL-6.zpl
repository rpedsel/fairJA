set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.2509, <2> 45.9745, <3> 44.4361, <4> 48.5749, <5> 27.8311, <6> 10.6539, <7> 17.9346, <8> 34.5621, <9> 43.9388, <10> 22.121, <11> 23.2797, <12> 29.4474, <13> 44.6088, <14> 22.2503, <15> 49.0648, <16> 24.6352, <17> 9.9065, <18> 11.4609, <19> 19.3178, <20> 46.2886;
param workload[JOB] := <1> 33.2509, <2> 45.9745, <3> 44.4361, <4> 48.5749, <5> 27.8311, <6> 10.6539, <7> 17.9346, <8> 34.5621, <9> 43.9388, <10> 22.121, <11> 23.2797, <12> 29.4474, <13> 44.6088, <14> 22.2503, <15> 49.0648, <16> 24.6352, <17> 9.9065, <18> 11.4609, <19> 19.3178, <20> 46.2886;
param capacity[MACHINE] := <1> 65.3076, <2> 65.3076, <3> 65.3076, <4> 65.3076, <5> 65.3076, <6> 65.3076, <7> 65.3076;

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