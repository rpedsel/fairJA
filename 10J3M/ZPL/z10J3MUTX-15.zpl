set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2465, <2> 24.8936, <3> 22.3816, <4> 27.8193, <5> 17.1764, <6> 42.8872, <7> 28.2786, <8> 43.9956, <9> 2.0967, <10> 35.2409;
param workload[JOB] := <1> 5.5899, <2> 4.9893, <3> 4.7309, <4> 5.2744, <5> 4.1444, <6> 6.5488, <7> 5.3178, <8> 6.6329, <9> 1.448, <10> 5.9364;
param capacity[MACHINE] := <1> 12.6532, <2> 12.6532, <3> 12.6532;

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
