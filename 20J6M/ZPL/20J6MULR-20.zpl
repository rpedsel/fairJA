set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2581, <2> 29.4668, <3> 33.0168, <4> 26.2279, <5> 36.7848, <6> 37.5003, <7> 8.4817, <8> 41.4593, <9> 31.3657, <10> 16.6768, <11> 0.5576, <12> 29.2757, <13> 10.7368, <14> 24.667, <15> 43.5714, <16> 13.743, <17> 16.6909, <18> 14.7155, <19> 13.3198, <20> 37.7679;
param workload[JOB] := <1> 49.68, <2> 37.7315, <3> 17.6976, <4> 28.9943, <5> 27.0191, <6> 38.3739, <7> 13.9109, <8> 3.6135, <9> 0.2422, <10> 23.6647, <11> 36.0607, <12> 1.2427, <13> 47.5528, <14> 2.4139, <15> 38.0347, <16> 19.0974, <17> 35.886, <18> 44.8764, <19> 3.7758, <20> 28.6927;
param capacity[MACHINE] := <1> 83.0935, <2> 83.0935, <3> 83.0935, <4> 83.0935, <5> 83.0935, <6> 83.0935;

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
