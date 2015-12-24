set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2, <2> 44.656, <3> 14.4741, <4> 40.1227, <5> 11.849, <6> 14.0539, <7> 48.6973, <8> 15.9417, <9> 39.8432, <10> 49.0299, <11> 2.8874, <12> 26.6965, <13> 22.3414, <14> 35.1698, <15> 44.3341, <16> 34.5334, <17> 12.3025, <18> 40.0933, <19> 38.0019, <20> 3.281;
param workload[JOB] := <1> 19.2, <2> 44.656, <3> 14.4741, <4> 40.1227, <5> 11.849, <6> 14.0539, <7> 48.6973, <8> 15.9417, <9> 39.8432, <10> 49.0299, <11> 2.8874, <12> 26.6965, <13> 22.3414, <14> 35.1698, <15> 44.3341, <16> 34.5334, <17> 12.3025, <18> 40.0933, <19> 38.0019, <20> 3.281;
param capacity[MACHINE] := <1> 59.7331, <2> 59.7331, <3> 59.7331, <4> 59.7331, <5> 59.7331, <6> 59.7331, <7> 59.7331;

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
