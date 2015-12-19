set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4035, <2> 22.8083, <3> 21.1934, <4> 22.9275, <5> 15.6876, <6> 22.73, <7> 28.0162, <8> 26.5777, <9> 25.6878, <10> 28.89;
param workload[JOB] := <1> 17.4035, <2> 22.8083, <3> 21.1934, <4> 22.9275, <5> 15.6876, <6> 22.73, <7> 28.0162, <8> 26.5777, <9> 25.6878, <10> 28.89;
param capacity[MACHINE] := <1> 57.9805, <2> 57.9805, <3> 57.9805;

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
