set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.5197, <2> 28.1015, <3> 23.5881, <4> 24.9795, <5> 32.1259, <6> 27.805, <7> 37.7145, <8> 21.0772, <9> 33.9795, <10> 17.873;
param workload[JOB] := <1> 39.4948, <2> 19.9124, <3> 28.5772, <4> 49.3749, <5> 24.8526, <6> 47.9353, <7> 21.1016, <8> 42.2937, <9> 27.275, <10> 2.2198;
param capacity[MACHINE] := <1> 75.7593, <2> 75.7593, <3> 75.7593;

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
