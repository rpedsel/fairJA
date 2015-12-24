set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1328, <2> 34.9522, <3> 35.6662, <4> 26.0581, <5> 23.2389, <6> 27.0843, <7> 18.0649, <8> 20.8939, <9> 24.4378, <10> 20.0069;
param workload[JOB] := <1> 28.0414, <2> 42.7815, <3> 28.294, <4> 40.4516, <5> 15.9493, <6> 1.6081, <7> 9.5117, <8> 48.6786, <9> 30.3737, <10> 10.5674;
param capacity[MACHINE] := <1> 64.0643, <2> 64.0643, <3> 64.0643;

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
