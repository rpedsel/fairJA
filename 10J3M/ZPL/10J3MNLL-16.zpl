set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3885, <2> 33.3805, <3> 25.3448, <4> 17.9724, <5> 19.7015, <6> 22.9946, <7> 20.2925, <8> 21.1838, <9> 36.809, <10> 24.3719;
param workload[JOB] := <1> 27.3885, <2> 33.3805, <3> 25.3448, <4> 17.9724, <5> 19.7015, <6> 22.9946, <7> 20.2925, <8> 21.1838, <9> 36.809, <10> 24.3719;
param capacity[MACHINE] := <1> 83.1465, <2> 83.1465, <3> 83.1465;

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
