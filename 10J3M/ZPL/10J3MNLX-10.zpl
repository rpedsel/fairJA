set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.2781, <2> 35.4259, <3> 19.1417, <4> 24.1974, <5> 20.5179, <6> 26.0601, <7> 25.7121, <8> 21.5685, <9> 27.9835, <10> 30.7127;
param workload[JOB] := <1> 4.2753, <2> 5.952, <3> 4.3751, <4> 4.9191, <5> 4.5297, <6> 5.1049, <7> 5.0707, <8> 4.6442, <9> 5.2899, <10> 5.5419;
param capacity[MACHINE] := <1> 16.5676, <2> 16.5676, <3> 16.5676;

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
