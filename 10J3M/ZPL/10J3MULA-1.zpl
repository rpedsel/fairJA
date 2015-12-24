set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3938, <2> 24.6148, <3> 47.0108, <4> 9.0642, <5> 3.6312, <6> 48.6089, <7> 22.6622, <8> 9.9737, <9> 15.7064, <10> 19.8948;
param workload[JOB] := <1> 644.8451, <2> 605.8884, <3> 2210.0153, <4> 82.1597, <5> 13.1856, <6> 2362.8252, <7> 513.5753, <8> 99.4747, <9> 246.691, <10> 395.8031;
param capacity[MACHINE] := <1> 2391.4878, <2> 2391.4878, <3> 2391.4878;

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
