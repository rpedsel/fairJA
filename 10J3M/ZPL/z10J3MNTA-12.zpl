set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.99, <2> 23.1664, <3> 23.4507, <4> 20.7941, <5> 27.957, <6> 28.0587, <7> 27.5415, <8> 26.279, <9> 22.5753, <10> 21.2099;
param workload[JOB] := <1> 575.5201, <2> 536.6821, <3> 549.9353, <4> 432.3946, <5> 781.5938, <6> 787.2906, <7> 758.5342, <8> 690.5858, <9> 509.6442, <10> 449.8599;
param capacity[MACHINE] := <1> 1518.0101, <2> 1518.0101, <3> 1518.0101;

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
