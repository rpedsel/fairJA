set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3697, <2> 28.7666, <3> 13.9972, <4> 27.8925, <5> 24.9017, <6> 25.9309, <7> 20.8273, <8> 28.3081, <9> 13.7533, <10> 26.1342;
param workload[JOB] := <1> 30.3697, <2> 28.7666, <3> 13.9972, <4> 27.8925, <5> 24.9017, <6> 25.9309, <7> 20.8273, <8> 28.3081, <9> 13.7533, <10> 26.1342;
param capacity[MACHINE] := <1> 80.2938, <2> 80.2938, <3> 80.2938;

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
