set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.2626, <2> 26.9706, <3> 25.0646, <4> 18.247, <5> 22.0019, <6> 24.0053, <7> 28.6542, <8> 25.8304, <9> 32.5665, <10> 19.0522;
param workload[JOB] := <1> 1786.1274, <2> 727.4133, <3> 628.2342, <4> 332.953, <5> 484.0836, <6> 576.2544, <7> 821.0632, <8> 667.2096, <9> 1060.5769, <10> 362.9863;
param capacity[MACHINE] := <1> 2482.3006, <2> 2482.3006, <3> 2482.3006;

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
