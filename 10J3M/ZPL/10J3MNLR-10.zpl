set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2134, <2> 27.741, <3> 18.3804, <4> 24.7017, <5> 19.2566, <6> 22.6307, <7> 16.861, <8> 24.5562, <9> 20.9852, <10> 24.532;
param workload[JOB] := <1> 3.3054, <2> 48.5556, <3> 1.6534, <4> 44.8331, <5> 41.2344, <6> 19.9727, <7> 4.5232, <8> 14.8687, <9> 11.669, <10> 27.7761;
param capacity[MACHINE] := <1> 72.7972, <2> 72.7972, <3> 72.7972;

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
