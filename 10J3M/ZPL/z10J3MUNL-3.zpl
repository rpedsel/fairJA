set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3583, <2> 13.2335, <3> 4.0026, <4> 39.9172, <5> 8.267, <6> 4.4503, <7> 37.1352, <8> 28.2793, <9> 22.387, <10> 4.1775;
param workload[JOB] := <1> 17.3583, <2> 13.2335, <3> 4.0026, <4> 39.9172, <5> 8.267, <6> 4.4503, <7> 37.1352, <8> 28.2793, <9> 22.387, <10> 4.1775;
param capacity[MACHINE] := <1> 179.2079, <2> 179.2079, <3> 179.2079;

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
