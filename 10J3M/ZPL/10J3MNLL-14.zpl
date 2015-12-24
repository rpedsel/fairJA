set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4951, <2> 24.656, <3> 24.0277, <4> 22.2808, <5> 32.3613, <6> 27.5214, <7> 27.3804, <8> 27.5179, <9> 27.2685, <10> 22.2336;
param workload[JOB] := <1> 18.4951, <2> 24.656, <3> 24.0277, <4> 22.2808, <5> 32.3613, <6> 27.5214, <7> 27.3804, <8> 27.5179, <9> 27.2685, <10> 22.2336;
param capacity[MACHINE] := <1> 84.5809, <2> 84.5809, <3> 84.5809;

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
