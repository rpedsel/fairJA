set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.8832, <2> 30.5122, <3> 10.5498, <4> 13.1967, <5> 25.7994, <6> 20.3671, <7> 3.8612, <8> 8.9201, <9> 25.8823, <10> 2.3085;
param workload[JOB] := <1> 13.6926, <2> 0.4196, <3> 26.8837, <4> 40.2027, <5> 32.9531, <6> 19.6472, <7> 47.5274, <8> 39.906, <9> 33.5351, <10> 9.9613;
param capacity[MACHINE] := <1> 264.7287, <2> 264.7287, <3> 264.7287;

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
