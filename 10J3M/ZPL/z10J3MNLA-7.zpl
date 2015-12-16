set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.6077, <2> 20.2298, <3> 26.5288, <4> 24.6032, <5> 26.0432, <6> 34.2273, <7> 20.3781, <8> 14.1205, <9> 20.699, <10> 18.228;
param workload[JOB] := <1> 1197.6929, <2> 409.2448, <3> 703.7772, <4> 605.3175, <5> 678.2483, <6> 1171.5081, <7> 415.267, <8> 199.3885, <9> 428.4486, <10> 332.26;
param capacity[MACHINE] := <1> 2047.051, <2> 2047.051, <3> 2047.051;

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
