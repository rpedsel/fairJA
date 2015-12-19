set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3173, <2> 23.1379, <3> 26.2338, <4> 31.734, <5> 26.1363, <6> 24.4697, <7> 22.1593, <8> 20.2827, <9> 29.7005, <10> 25.261;
param workload[JOB] := <1> 17.3173, <2> 23.1379, <3> 26.2338, <4> 31.734, <5> 26.1363, <6> 24.4697, <7> 22.1593, <8> 20.2827, <9> 29.7005, <10> 25.261;
param capacity[MACHINE] := <1> 82.1442, <2> 82.1442, <3> 82.1442;

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
