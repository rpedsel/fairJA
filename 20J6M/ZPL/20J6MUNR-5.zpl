set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9427, <2> 5.7956, <3> 29.711, <4> 27.3985, <5> 14.6859, <6> 29.105, <7> 26.2364, <8> 24.1122, <9> 23.6156, <10> 22.4229, <11> 39.6156, <12> 44.1516, <13> 48.1396, <14> 48.6749, <15> 10.5225, <16> 38.5137, <17> 42.3731, <18> 49.1044, <19> 15.5198, <20> 27.3357;
param workload[JOB] := <1> 4.1147, <2> 22.6467, <3> 11.0478, <4> 10.0153, <5> 12.1428, <6> 40.2556, <7> 2.6241, <8> 14.1967, <9> 25.8503, <10> 6.1379, <11> 44.2174, <12> 9.3706, <13> 26.2442, <14> 0.1706, <15> 9.8109, <16> 4.2581, <17> 0.7774, <18> 10.3701, <19> 12.7328, <20> 36.7087;
param capacity[MACHINE] := <1> 303.6927, <2> 303.6927, <3> 303.6927, <4> 303.6927, <5> 303.6927, <6> 303.6927;

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
