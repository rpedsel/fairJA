set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3422, <2> 12.8803, <3> 26.3497, <4> 24.5291, <5> 2.868, <6> 34.2524, <7> 0.2174, <8> 27.9767, <9> 27.8797, <10> 25.8541, <11> 45.7599, <12> 29.4486, <13> 7.5893, <14> 21.8971, <15> 24.3899, <16> 31.8743, <17> 35.4241, <18> 48.4723, <19> 0.1121, <20> 44.578;
param workload[JOB] := <1> 26.9569, <2> 0.6607, <3> 46.5551, <4> 1.2674, <5> 28.1632, <6> 2.9344, <7> 43.0006, <8> 11.7616, <9> 30.957, <10> 44.6672, <11> 28.8482, <12> 30.0989, <13> 2.147, <14> 22.5145, <15> 9.3854, <16> 12.0331, <17> 9.5908, <18> 7.9805, <19> 16.9187, <20> 15.4555;
param capacity[MACHINE] := <1> 55.9852, <2> 55.9852, <3> 55.9852, <4> 55.9852, <5> 55.9852, <6> 55.9852, <7> 55.9852;

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
