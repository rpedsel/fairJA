set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3706, <2> 27.1813, <3> 25.0456, <4> 21.404, <5> 20.8372, <6> 21.7447, <7> 17.1285, <8> 26.5516, <9> 22.1137, <10> 22.5694;
param workload[JOB] := <1> 40.0466, <2> 0.202, <3> 41.8248, <4> 4.5968, <5> 31.3521, <6> 5.3777, <7> 20.1018, <8> 5.1247, <9> 17.4097, <10> 41.2196;
param capacity[MACHINE] := <1> 207.2558, <2> 207.2558, <3> 207.2558;

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
