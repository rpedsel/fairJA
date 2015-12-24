set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.0544, <2> 12.8369, <3> 10.7594, <4> 32.1614, <5> 48.5571, <6> 27.8641, <7> 9.3274, <8> 15.1615, <9> 41.3239, <10> 27.4584;
param workload[JOB] := <1> 145.3086, <2> 164.786, <3> 115.7647, <4> 1034.3556, <5> 2357.792, <6> 776.4081, <7> 87.0004, <8> 229.8711, <9> 1707.6647, <10> 753.9637;
param capacity[MACHINE] := <1> 2682.7661, <2> 2682.7661, <3> 2682.7661;

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
