set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.8928, <2> 20.8817, <3> 32.9309, <4> 26.0796, <5> 26.3025, <6> 26.3736, <7> 19.1222, <8> 25.3973, <9> 27.8445, <10> 26.3127;
param workload[JOB] := <1> 3.7273, <2> 4.5696, <3> 5.7385, <4> 5.1068, <5> 5.1286, <6> 5.1355, <7> 4.3729, <8> 5.0396, <9> 5.2768, <10> 5.1296;
param capacity[MACHINE] := <1> 16.4084, <2> 16.4084, <3> 16.4084;

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
