set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.6095, <2> 29.5145, <3> 22.1968, <4> 21.0313, <5> 31.3909, <6> 18.9856, <7> 24.2986, <8> 19.7653, <9> 22.6258, <10> 21.905;
param workload[JOB] := <1> 1063.3795, <2> 871.1057, <3> 492.6979, <4> 442.3156, <5> 985.3886, <6> 360.453, <7> 590.422, <8> 390.6671, <9> 511.9268, <10> 479.829;
param capacity[MACHINE] := <1> 6188.1852, <2> 6188.1852, <3> 6188.1852;

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
