set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.6687, <2> 7.4937, <3> 40.5353, <4> 8.1061, <5> 22.0103, <6> 19.4328, <7> 1.3438, <8> 29.7053, <9> 24.9186, <10> 34.566;
param workload[JOB] := <1> 5.5053, <2> 3.7721, <3> 37.4208, <4> 26.8611, <5> 25.4933, <6> 25.8573, <7> 14.2466, <8> 49.5958, <9> 36.4321, <10> 22.638;
param capacity[MACHINE] := <1> 82.6075, <2> 82.6075, <3> 82.6075;

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
