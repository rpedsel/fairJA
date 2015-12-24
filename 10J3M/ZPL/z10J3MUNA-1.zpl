set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.3048, <2> 39.1294, <3> 12.5368, <4> 7.8094, <5> 21.5862, <6> 41.0852, <7> 6.5332, <8> 8.4009, <9> 35.3426, <10> 0.2874;
param workload[JOB] := <1> 2144.1345, <2> 1531.1099, <3> 157.1714, <4> 60.9867, <5> 465.964, <6> 1687.9937, <7> 42.6827, <8> 70.5751, <9> 1249.0994, <10> 0.0826;
param capacity[MACHINE] := <1> 7409.8, <2> 7409.8, <3> 7409.8;

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
