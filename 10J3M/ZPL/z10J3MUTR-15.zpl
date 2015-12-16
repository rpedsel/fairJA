set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.6085, <2> 33.3024, <3> 25.9803, <4> 9.0355, <5> 15.9832, <6> 42.8402, <7> 38.1781, <8> 2.8945, <9> 10.2298, <10> 15.5379;
param workload[JOB] := <1> 38.1621, <2> 2.7674, <3> 17.4468, <4> 23.3711, <5> 34.6715, <6> 6.3679, <7> 26.7303, <8> 3.3174, <9> 28.2952, <10> 0.828;
param capacity[MACHINE] := <1> 45.4894, <2> 45.4894, <3> 45.4894;

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
