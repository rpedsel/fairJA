set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9288, <2> 22.2448, <3> 17.709, <4> 20.8449, <5> 22.882, <6> 24.0248, <7> 30.3443, <8> 21.0013, <9> 21.3919, <10> 28.296;
param workload[JOB] := <1> 621.4451, <2> 494.8311, <3> 313.6087, <4> 434.5099, <5> 523.5859, <6> 577.191, <7> 920.7765, <8> 441.0546, <9> 457.6134, <10> 800.6636;
param capacity[MACHINE] := <1> 5585.2798, <2> 5585.2798, <3> 5585.2798;

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
