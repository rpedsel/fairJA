set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.2819, <2> 27.0331, <3> 17.1309, <4> 45.6622, <5> 17.748, <6> 11.3195, <7> 49.7254, <8> 5.4481, <9> 3.7588, <10> 2.1484;
param workload[JOB] := <1> 39.4606, <2> 41.3675, <3> 22.0057, <4> 38.1932, <5> 16.0827, <6> 1.292, <7> 31.4834, <8> 34.2172, <9> 36.047, <10> 11.2645;
param capacity[MACHINE] := <1> 67.8535, <2> 67.8535, <3> 67.8535;

var x[JM] binary;
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
