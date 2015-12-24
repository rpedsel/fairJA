set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.7001, <2> 21.7819, <3> 37.467, <4> 25.1636, <5> 18.2517, <6> 17.6859, <7> 27.9966, <8> 19.5679, <9> 21.1299, <10> 16.9928;
param workload[JOB] := <1> 1274.4971, <2> 474.4512, <3> 1403.7761, <4> 633.2068, <5> 333.1246, <6> 312.7911, <7> 783.8096, <8> 382.9027, <9> 446.4727, <10> 288.7553;
param capacity[MACHINE] := <1> 2111.2624, <2> 2111.2624, <3> 2111.2624;

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
