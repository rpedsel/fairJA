set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.2647, <2> 3.0307, <3> 13.2622, <4> 9.7541, <5> 19.5102, <6> 21.8113, <7> 5.5245, <8> 25.3045, <9> 16.0978, <10> 43.1073;
param workload[JOB] := <1> 40.999, <2> 19.2222, <3> 21.1451, <4> 3.0694, <5> 28.242, <6> 18.4241, <7> 41.6905, <8> 3.5003, <9> 24.8662, <10> 46.1925;
param capacity[MACHINE] := <1> 61.8378, <2> 61.8378, <3> 61.8378;

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
