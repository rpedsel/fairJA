set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0906, <2> 44.1295, <3> 32.0334, <4> 37.0239, <5> 40.1274, <6> 3.1458, <7> 13.2568, <8> 16.3203, <9> 36.0168, <10> 31.6422, <11> 1.3015, <12> 36.6912, <13> 4.1936, <14> 16.7809, <15> 20.8912, <16> 6.2836, <17> 45.375, <18> 6.796, <19> 38.2221, <20> 21.2732;
param workload[JOB] := <1> 21.0906, <2> 44.1295, <3> 32.0334, <4> 37.0239, <5> 40.1274, <6> 3.1458, <7> 13.2568, <8> 16.3203, <9> 36.0168, <10> 31.6422, <11> 1.3015, <12> 36.6912, <13> 4.1936, <14> 16.7809, <15> 20.8912, <16> 6.2836, <17> 45.375, <18> 6.796, <19> 38.2221, <20> 21.2732;
param capacity[MACHINE] := <1> 50.6352, <2> 50.6352, <3> 50.6352, <4> 50.6352, <5> 50.6352, <6> 50.6352, <7> 50.6352;

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
