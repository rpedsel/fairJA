set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.8439, <2> 23.3592, <3> 34.6027, <4> 27.5894, <5> 22.1405, <6> 4.6777, <7> 44.0864, <8> 39.769, <9> 1.9777, <10> 10.2417;
param workload[JOB] := <1> 10.8439, <2> 23.3592, <3> 34.6027, <4> 27.5894, <5> 22.1405, <6> 4.6777, <7> 44.0864, <8> 39.769, <9> 1.9777, <10> 10.2417;
param capacity[MACHINE] := <1> 54.8221, <2> 54.8221, <3> 54.8221;

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
