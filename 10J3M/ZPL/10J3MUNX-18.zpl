set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2018, <2> 11.385, <3> 42.2289, <4> 22.9538, <5> 12.8006, <6> 46.6777, <7> 25.0796, <8> 31.6321, <9> 43.6149, <10> 6.5328;
param workload[JOB] := <1> 4.4946, <2> 3.3742, <3> 6.4984, <4> 4.791, <5> 3.5778, <6> 6.8321, <7> 5.008, <8> 5.6242, <9> 6.6042, <10> 2.5559;
param capacity[MACHINE] := <1> 49.3604, <2> 49.3604, <3> 49.3604;

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
