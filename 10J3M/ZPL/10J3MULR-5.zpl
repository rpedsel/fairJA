set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.5797, <2> 48.4853, <3> 10.6693, <4> 30.7992, <5> 4.4054, <6> 25.9792, <7> 17.1965, <8> 19.7508, <9> 25.4742, <10> 27.8949;
param workload[JOB] := <1> 25.7738, <2> 46.973, <3> 18.6266, <4> 47.3515, <5> 40.5431, <6> 31.7342, <7> 37.658, <8> 6.1025, <9> 0.9216, <10> 46.3817;
param capacity[MACHINE] := <1> 100.6887, <2> 100.6887, <3> 100.6887;

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
