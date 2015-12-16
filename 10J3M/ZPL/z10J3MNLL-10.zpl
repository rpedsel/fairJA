set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3365, <2> 19.5289, <3> 20.3384, <4> 33.5246, <5> 21.3119, <6> 27.1377, <7> 23.1483, <8> 22.7775, <9> 27.751, <10> 29.1674;
param workload[JOB] := <1> 28.3365, <2> 19.5289, <3> 20.3384, <4> 33.5246, <5> 21.3119, <6> 27.1377, <7> 23.1483, <8> 22.7775, <9> 27.751, <10> 29.1674;
param capacity[MACHINE] := <1> 84.3407, <2> 84.3407, <3> 84.3407;

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
