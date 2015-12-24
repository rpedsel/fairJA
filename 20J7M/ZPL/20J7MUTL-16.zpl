set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.2902, <2> 17.7205, <3> 41.8465, <4> 13.3623, <5> 10.3817, <6> 12.6384, <7> 40.8783, <8> 32.8461, <9> 41.6793, <10> 39.5892, <11> 48.1736, <12> 0.236, <13> 19.1879, <14> 38.8355, <15> 7.9006, <16> 22.6252, <17> 31.5865, <18> 32.5143, <19> 7.2307, <20> 1.2532;
param workload[JOB] := <1> 37.2902, <2> 17.7205, <3> 41.8465, <4> 13.3623, <5> 10.3817, <6> 12.6384, <7> 40.8783, <8> 32.8461, <9> 41.6793, <10> 39.5892, <11> 48.1736, <12> 0.236, <13> 19.1879, <14> 38.8355, <15> 7.9006, <16> 22.6252, <17> 31.5865, <18> 32.5143, <19> 7.2307, <20> 1.2532;
param capacity[MACHINE] := <1> 53.3332, <2> 53.3332, <3> 53.3332, <4> 53.3332, <5> 53.3332, <6> 53.3332, <7> 53.3332;

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
