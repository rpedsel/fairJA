set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.6946, <2> 25.2398, <3> 21.7526, <4> 30.6147, <5> 21.4468, <6> 26.498, <7> 22.1382, <8> 23.2534, <9> 20.5081, <10> 24.91;
param workload[JOB] := <1> 609.8233, <2> 637.0475, <3> 473.1756, <4> 937.2599, <5> 459.9652, <6> 702.144, <7> 490.0999, <8> 540.7206, <9> 420.5822, <10> 620.5081;
param capacity[MACHINE] := <1> 1963.7754, <2> 1963.7754, <3> 1963.7754;

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
