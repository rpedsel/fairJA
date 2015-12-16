set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.6332, <2> 15.601, <3> 13.1098, <4> 48.9044, <5> 49.9088, <6> 8.6632, <7> 2.2141, <8> 0.488, <9> 37.4399, <10> 46.9388, <11> 32.281, <12> 1.2798, <13> 25.3226, <14> 26.6638, <15> 12.0522, <16> 49.581, <17> 33.578, <18> 32.4061, <19> 19.9052, <20> 3.4959;
param workload[JOB] := <1> 22.6332, <2> 15.601, <3> 13.1098, <4> 48.9044, <5> 49.9088, <6> 8.6632, <7> 2.2141, <8> 0.488, <9> 37.4399, <10> 46.9388, <11> 32.281, <12> 1.2798, <13> 25.3226, <14> 26.6638, <15> 12.0522, <16> 49.581, <17> 33.578, <18> 32.4061, <19> 19.9052, <20> 3.4959;
param capacity[MACHINE] := <1> 60.3083, <2> 60.3083, <3> 60.3083, <4> 60.3083, <5> 60.3083, <6> 60.3083;

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
