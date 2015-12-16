set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1423, <2> 28.8584, <3> 31.9732, <4> 19.4285, <5> 17.9815, <6> 17.7729, <7> 28.7731, <8> 19.8096, <9> 23.8469, <10> 30.8038;
param workload[JOB] := <1> 849.2736, <2> 832.8073, <3> 1022.2855, <4> 377.4666, <5> 323.3343, <6> 315.876, <7> 827.8913, <8> 392.4203, <9> 568.6746, <10> 948.8741;
param capacity[MACHINE] := <1> 2152.9679, <2> 2152.9679, <3> 2152.9679;

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
