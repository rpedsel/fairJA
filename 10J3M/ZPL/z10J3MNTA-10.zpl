set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.8741, <2> 24.7787, <3> 20.7898, <4> 20.2256, <5> 9.4369, <6> 14.6527, <7> 21.3406, <8> 13.966, <9> 15.4219, <10> 19.1688;
param workload[JOB] := <1> 1080.7065, <2> 613.984, <3> 432.2158, <4> 409.0749, <5> 89.0551, <6> 214.7016, <7> 455.4212, <8> 195.0492, <9> 237.835, <10> 367.4429;
param capacity[MACHINE] := <1> 1660.436, <2> 1660.436, <3> 1660.436;

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
