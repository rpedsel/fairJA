set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3906, <2> 33.7254, <3> 28.2413, <4> 24.4443, <5> 16.4725, <6> 25.1248, <7> 26.0884, <8> 18.8126, <9> 25.5179, <10> 24.2383;
param workload[JOB] := <1> 644.6826, <2> 1137.4026, <3> 797.571, <4> 597.5238, <5> 271.3433, <6> 631.2556, <7> 680.6046, <8> 353.9139, <9> 651.1632, <10> 587.4952;
param capacity[MACHINE] := <1> 6352.9558, <2> 6352.9558, <3> 6352.9558;

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
