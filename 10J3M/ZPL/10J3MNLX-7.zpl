set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9437, <2> 23.049, <3> 21.2241, <4> 22.7454, <5> 20.3434, <6> 23.4019, <7> 31.6861, <8> 27.2513, <9> 21.9237, <10> 17.933;
param workload[JOB] := <1> 4.9944, <2> 4.8009, <3> 4.607, <4> 4.7692, <5> 4.5104, <6> 4.8376, <7> 5.629, <8> 5.2203, <9> 4.6823, <10> 4.2347;
param capacity[MACHINE] := <1> 16.0953, <2> 16.0953, <3> 16.0953;

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
