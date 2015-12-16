set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.6632, <2> 0.9905, <3> 15.2554, <4> 43.0157, <5> 19.5883, <6> 6.5774, <7> 48.9827, <8> 16.5564, <9> 6.736, <10> 21.7963;
param workload[JOB] := <1> 20.6632, <2> 0.9905, <3> 15.2554, <4> 43.0157, <5> 19.5883, <6> 6.5774, <7> 48.9827, <8> 16.5564, <9> 6.736, <10> 21.7963;
param capacity[MACHINE] := <1> 66.7206, <2> 66.7206, <3> 66.7206;

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
