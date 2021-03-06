set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.8432, <2> 44.7467, <3> 1.8351, <4> 0.3823, <5> 30.0656, <6> 14.1442, <7> 23.3156, <8> 5.8948, <9> 20.0328, <10> 6.9096, <11> 30.9984, <12> 1.588, <13> 48.7957, <14> 13.5694, <15> 10.6615, <16> 21.384, <17> 44.9914, <18> 41.1843, <19> 46.5559, <20> 35.9717;
param workload[JOB] := <1> 1587.4806, <2> 2002.2672, <3> 3.3676, <4> 0.1462, <5> 903.9403, <6> 200.0584, <7> 543.6172, <8> 34.7487, <9> 401.3131, <10> 47.7426, <11> 960.9008, <12> 2.5217, <13> 2381.0203, <14> 184.1286, <15> 113.6676, <16> 457.2755, <17> 2024.2261, <18> 1696.1466, <19> 2167.4518, <20> 1293.9632;
param capacity[MACHINE] := <1> 2489.2916, <2> 2489.2916, <3> 2489.2916, <4> 2489.2916, <5> 2489.2916, <6> 2489.2916, <7> 2489.2916;

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
