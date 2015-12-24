set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7479, <2> 22.3368, <3> 25.2859, <4> 30.0859, <5> 26.9614, <6> 24.5804, <7> 26.746, <8> 21.2052, <9> 31.2855, <10> 26.0517;
param workload[JOB] := <1> 5.1718, <2> 4.7262, <3> 5.0285, <4> 5.4851, <5> 5.1924, <6> 4.9579, <7> 5.1717, <8> 4.6049, <9> 5.5933, <10> 5.1041;
param capacity[MACHINE] := <1> 17.012, <2> 17.012, <3> 17.012;

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
