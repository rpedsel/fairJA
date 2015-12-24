set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7948, <2> 43.1154, <3> 21.5027, <4> 15.4486, <5> 16.004, <6> 42.7022, <7> 40.135, <8> 2.6665, <9> 4.0494, <10> 34.2659;
param workload[JOB] := <1> 28.7948, <2> 43.1154, <3> 21.5027, <4> 15.4486, <5> 16.004, <6> 42.7022, <7> 40.135, <8> 2.6665, <9> 4.0494, <10> 34.2659;
param capacity[MACHINE] := <1> 248.6845, <2> 248.6845, <3> 248.6845;

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
