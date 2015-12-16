set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2029, <2> 38.3109, <3> 11.8419, <4> 13.1379, <5> 34.7202, <6> 13.3905, <7> 29.1661, <8> 47.4257, <9> 21.7151, <10> 27.41;
param workload[JOB] := <1> 4.3821, <2> 6.1896, <3> 3.4412, <4> 3.6246, <5> 5.8924, <6> 3.6593, <7> 5.4006, <8> 6.8866, <9> 4.6599, <10> 5.2355;
param capacity[MACHINE] := <1> 49.3718, <2> 49.3718, <3> 49.3718;

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
