set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3239, <2> 28.0836, <3> 30.6024, <4> 33.1, <5> 29.0454, <6> 21.6173, <7> 21.6764, <8> 20.4067, <9> 22.4539, <10> 21.5855;
param workload[JOB] := <1> 30.3239, <2> 28.0836, <3> 30.6024, <4> 33.1, <5> 29.0454, <6> 21.6173, <7> 21.6764, <8> 20.4067, <9> 22.4539, <10> 21.5855;
param capacity[MACHINE] := <1> 64.7238, <2> 64.7238, <3> 64.7238;

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
