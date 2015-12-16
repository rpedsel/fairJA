set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.0867, <2> 33.8675, <3> 40.2006, <4> 15.0336, <5> 34.3451, <6> 34.434, <7> 4.0819, <8> 43.6204, <9> 2.5507, <10> 2.6017;
param workload[JOB] := <1> 1.7569, <2> 5.8196, <3> 6.3404, <4> 3.8773, <5> 5.8605, <6> 5.868, <7> 2.0204, <8> 6.6046, <9> 1.5971, <10> 1.613;
param capacity[MACHINE] := <1> 10.3394, <2> 10.3394, <3> 10.3394;

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
