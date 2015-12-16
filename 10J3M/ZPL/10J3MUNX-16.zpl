set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7096, <2> 27.1249, <3> 32.2709, <4> 35.7171, <5> 7.1533, <6> 46.8177, <7> 13.4545, <8> 27.9449, <9> 31.0202, <10> 2.582;
param workload[JOB] := <1> 4.4395, <2> 5.2082, <3> 5.6807, <4> 5.9764, <5> 2.6746, <6> 6.8423, <7> 3.668, <8> 5.2863, <9> 5.5696, <10> 1.6069;
param capacity[MACHINE] := <1> 46.9525, <2> 46.9525, <3> 46.9525;

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
