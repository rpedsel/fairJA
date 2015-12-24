set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.2519, <2> 19.4724, <3> 35.3982, <4> 31.2841, <5> 22.9109, <6> 23.5267, <7> 31.3845, <8> 32.1948, <9> 25.2692, <10> 24.7782;
param workload[JOB] := <1> 33.4908, <2> 22.3021, <3> 23.4636, <4> 46.0067, <5> 25.0563, <6> 24.0759, <7> 5.6424, <8> 2.4046, <9> 48.3628, <10> 2.9938;
param capacity[MACHINE] := <1> 233.799, <2> 233.799, <3> 233.799;

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
