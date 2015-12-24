set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2646, <2> 28.6807, <3> 25.4755, <4> 21.1547, <5> 27.3439, <6> 28.2966, <7> 27.6616, <8> 26.1469, <9> 28.6369, <10> 24.0988;
param workload[JOB] := <1> 17.9931, <2> 12.5462, <3> 35.5827, <4> 32.6509, <5> 16.8545, <6> 0.678, <7> 21.9178, <8> 34.5095, <9> 27.5983, <10> 10.2717;
param capacity[MACHINE] := <1> 70.2009, <2> 70.2009, <3> 70.2009;

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
