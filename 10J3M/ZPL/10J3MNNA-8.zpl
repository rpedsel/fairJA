set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.94, <2> 18.2018, <3> 24.7941, <4> 27.5904, <5> 20.1644, <6> 32.0883, <7> 22.3252, <8> 22.3566, <9> 25.2686, <10> 18.2889;
param workload[JOB] := <1> 573.1236, <2> 331.3055, <3> 614.7474, <4> 761.2302, <5> 406.603, <6> 1029.659, <7> 498.4146, <8> 499.8176, <9> 638.5021, <10> 334.4839;
param capacity[MACHINE] := <1> 5687.8869, <2> 5687.8869, <3> 5687.8869;

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
