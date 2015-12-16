set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.835, <2> 27.4284, <3> 30.0644, <4> 25.326, <5> 21.4821, <6> 26.1563, <7> 29.5184, <8> 21.9652, <9> 28.382, <10> 30.7814;
param workload[JOB] := <1> 5.1803, <2> 5.2372, <3> 5.4831, <4> 5.0325, <5> 4.6349, <6> 5.1143, <7> 5.4331, <8> 4.6867, <9> 5.3275, <10> 5.5481;
param capacity[MACHINE] := <1> 51.6777, <2> 51.6777, <3> 51.6777;

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
