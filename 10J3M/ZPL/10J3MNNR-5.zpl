set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4483, <2> 24.0619, <3> 27.8586, <4> 31.6657, <5> 29.8764, <6> 21.2486, <7> 27.4263, <8> 25.3426, <9> 31.9801, <10> 21.3456;
param workload[JOB] := <1> 42.9096, <2> 19.2133, <3> 9.7328, <4> 27.4864, <5> 41.2027, <6> 46.8022, <7> 40.1446, <8> 32.7078, <9> 29.9885, <10> 6.9023;
param capacity[MACHINE] := <1> 297.0902, <2> 297.0902, <3> 297.0902;

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
