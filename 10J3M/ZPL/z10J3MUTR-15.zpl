set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.8853, <2> 43.0, <3> 29.9508, <4> 20.2053, <5> 42.2592, <6> 12.0697, <7> 27.9105, <8> 43.9119, <9> 5.9448, <10> 3.33;
param workload[JOB] := <1> 44.598, <2> 27.7425, <3> 3.8789, <4> 22.6109, <5> 0.3334, <6> 36.2467, <7> 30.5237, <8> 40.2321, <9> 29.6351, <10> 22.5998;
param capacity[MACHINE] := <1> 64.6003, <2> 64.6003, <3> 64.6003;

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
