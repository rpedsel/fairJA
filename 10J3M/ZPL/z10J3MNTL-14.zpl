set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0113, <2> 32.4822, <3> 25.9589, <4> 19.4784, <5> 28.5023, <6> 32.3803, <7> 31.7855, <8> 21.6562, <9> 32.3584, <10> 27.8745;
param workload[JOB] := <1> 29.0113, <2> 32.4822, <3> 25.9589, <4> 19.4784, <5> 28.5023, <6> 32.3803, <7> 31.7855, <8> 21.6562, <9> 32.3584, <10> 27.8745;
param capacity[MACHINE] := <1> 70.372, <2> 70.372, <3> 70.372;

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
