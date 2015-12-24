set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7069, <2> 14.045, <3> 30.3428, <4> 25.2705, <5> 26.8697, <6> 18.2164, <7> 21.8993, <8> 18.7749, <9> 22.5612, <10> 20.7419;
param workload[JOB] := <1> 27.7069, <2> 14.045, <3> 30.3428, <4> 25.2705, <5> 26.8697, <6> 18.2164, <7> 21.8993, <8> 18.7749, <9> 22.5612, <10> 20.7419;
param capacity[MACHINE] := <1> 75.4762, <2> 75.4762, <3> 75.4762;

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
