set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3232, <2> 40.211, <3> 33.5223, <4> 29.9043, <5> 24.3461, <6> 12.6064, <7> 17.3368, <8> 33.4075, <9> 38.0437, <10> 15.8355;
param workload[JOB] := <1> 4.8294, <2> 6.3412, <3> 5.7898, <4> 5.4685, <5> 4.9342, <6> 3.5505, <7> 4.1637, <8> 5.7799, <9> 6.168, <10> 3.9794;
param capacity[MACHINE] := <1> 17.0015, <2> 17.0015, <3> 17.0015;

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
